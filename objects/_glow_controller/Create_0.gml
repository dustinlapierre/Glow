mainSurface = -1;
compSurface = -1;

//light positions for the shaders
u_pos = shader_get_uniform(_glow_shader_light, "u_pos");
u_pos2 = shader_get_uniform(_glow_shader_shadow, "u_pos");

//directional light vars
u_dir = shader_get_uniform(_glow_shader_light, "u_dir");
u_fov = shader_get_uniform(_glow_shader_light, "u_fov");
u_radius = shader_get_uniform(_glow_shader_light, "u_radius");
u_falloff_speed = shader_get_uniform(_glow_shader_light, "u_falloff_speed");

//creating vertex format
vertex_format_begin();
vertex_format_add_position_3d();
vf = vertex_format_end();

//create vertex buffer
vb = vertex_create_buffer();

//blurring shader vars
u_texel_size = shader_get_uniform(_glow_shader_blur, "texel_size"); 
u_blur_vector = shader_get_uniform(_glow_shader_blur, "blur_vector"); //direction of blur

srf_ping = -1;