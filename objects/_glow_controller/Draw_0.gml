#region setup
var _u_pos = u_pos;
var _u_pos2 = u_pos2;
var _u_dir = u_dir;
var _u_fov = u_fov;
var _u_radius = u_radius;
var _u_falloff_speed = u_falloff_speed;
var _vb = vb;
//if views are enabled grab the first cam
if(view_enabled)
{
	var _cam = view_camera[0];
	var _vx = camera_get_view_x(_cam);
	var _vy = camera_get_view_y(_cam);
	var _vw = camera_get_view_width(_cam);
	var _vh = camera_get_view_height(_cam);
}
//otherwise shade the entire room
else
{
	var _vx = 0
	var _vy = 0
	var _vw = room_width;
	var _vh = room_height;
}
var texel_w = 1 / _vw;
var texel_h = 1 / _vh;

if(!surface_exists(mainSurface)) mainSurface = surface_create(_vw, _vh);
if(!surface_exists(compSurface)) compSurface = surface_create(_vw, _vh);

//pass into with statements
var _mainSurface = mainSurface;
var _compSurface = compSurface;

//offset surface coordinates based on camera position
matrix_set(matrix_world, matrix_build(-_vx, -_vy, 0, 0, 0, 0, 1, 1, 1));
#endregion

#region fill surface with shadow

surface_set_target(mainSurface);
draw_clear(ambient_color); //change shadow color here
surface_reset_target();

#endregion

#region draw lights

//for every light source
with(_glow_light)
{
	surface_set_target(_compSurface);
		//fill with white
		draw_clear_alpha(c_white, 1.0);
		//use shader and pos to draw shadow buffer
		shader_set(_glow_shader_shadow);
			shader_set_uniform_f(_u_pos2, x, y);
			vertex_submit(_vb, pr_trianglelist, -1);
		shader_reset();
	surface_reset_target();
	
	
	//draw light
	gpu_set_blendmode(bm_add);
		surface_set_target(_mainSurface);
			//draw light
			shader_set(_glow_shader_light);
			shader_set_uniform_f(_u_pos, x, y);
			shader_set_uniform_f(_u_dir, dir);
			shader_set_uniform_f(_u_fov, fov);
			shader_set_uniform_f(_u_radius, radius);
			shader_set_uniform_f(_u_falloff_speed, falloff_speed);
			//transfer shadows
			draw_surface_ext(_compSurface,_vx,_vy,1,1,0,col,1);
			shader_reset();
		surface_reset_target();
	gpu_set_blendmode(bm_normal);
}

#endregion

#region fill in shadow casters with shadow (for edge lighting effect)
surface_set_target(mainSurface);
var u_color = shader_get_uniform(_glow_shader_silo,"color");
shader_set(_glow_shader_silo);
shader_set_uniform_f(u_color, 
	colour_get_red(ambient_color)/255, 
	color_get_green(ambient_color)/255,
	color_get_blue(ambient_color)/255,
);

with(_glow_shadow_parent)
{
	draw_self();
}
shader_reset();
surface_reset_target();
#endregion

#region blur the resulting shadows, softens and adds edge lighting
if(blur_pass)
{
	if(!surface_exists(srf_ping)) srf_ping = surface_create(_vw, _vh);

	gpu_set_tex_filter(true); //must be set to get an accurate result
	shader_set(_glow_shader_blur);
		shader_set_uniform_f(u_texel_size, texel_w, texel_h);
		
		//1st pass: horizontal
		shader_set_uniform_f(u_blur_vector, 1, 0);
		surface_set_target(srf_ping);
			draw_surface(mainSurface, _vx, _vy);
		surface_reset_target();
		
		//2nd pass vertical
		surface_set_target(mainSurface);
		shader_set_uniform_f(u_blur_vector, 0, 1);
		draw_surface(srf_ping, _vx, _vy);
		surface_reset_target();
	shader_reset();
	gpu_set_tex_filter(false);
}
matrix_set(matrix_world, matrix_build(0, 0, 0, 0, 0, 0, 1, 1, 1));
#endregion

#region add ambient light (sets overall shadow alpha by adding white)
surface_set_target(mainSurface);
	gpu_set_blendmode(bm_add);
	draw_set_color(c_white);
	draw_set_alpha(1.0 - ambient_opacity);
	draw_rectangle(0,0,_vw,_vh, false);
	draw_set_alpha(1.0);
	draw_set_color(c_white);
surface_reset_target();
#endregion

#region draw final result to screen 
gpu_set_blendmode_ext(bm_zero, bm_src_colour);
draw_surface(mainSurface,_vx,_vy);
gpu_set_blendmode(bm_normal);
#endregion
