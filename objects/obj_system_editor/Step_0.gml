//keep gui elements locked to their camera positions
var _x = camera_get_view_x(view_camera[0]);
var _y = camera_get_view_y(view_camera[0]);

for(var i = 0; i < array_length(gui_elements); i++)
{
	gui_elements[i].x = _x + gui_elements[i].gui_x;
	gui_elements[i].y = _y + gui_elements[i].gui_y;
}

//set values based on sliders
glow_set_ambient_opacity(ambient_opacity_slider.get_value());

//set light values
if(keyboard_check_pressed(vk_escape))
{
	light_selected = noone;
	with(red_slider) percent = color_get_red(glow_get_ambient_color()) / max_val;
	with(green_slider) percent = color_get_green(glow_get_ambient_color()) / max_val;
	with(blue_slider) percent = color_get_blue(glow_get_ambient_color()) / max_val;
}
	
if(light_selected != noone)
{
	light_selected.fov = light_fov.get_value();
	light_selected.dir = light_dir.get_value();
	light_selected.falloff_speed = light_falloff.get_value();
	light_selected.radius = light_radius.get_value();
	light_selected.col = make_color_rgb(red_slider.get_value(), green_slider.get_value(), blue_slider.get_value());
}
else
{
	glow_set_ambient_color(
	make_color_rgb(
		red_slider.get_value(),
		green_slider.get_value(),
		blue_slider.get_value()))	
}

//move light
if(light_holding != noone)
{
	light_holding.x = mouse_x;
	light_holding.y = mouse_y;
}