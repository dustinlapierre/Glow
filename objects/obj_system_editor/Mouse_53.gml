var closest_light = instance_nearest(mouse_x, mouse_y, _glow_light);

if(point_distance(mouse_x, mouse_y, closest_light.x, closest_light.y) < 50 
&& !collision_circle(mouse_x,mouse_y, 10, obj_handle, false, true))
{
	//select the light
	light_selected = closest_light;
	//set all sliders values equal to that light's values
	with(light_fov) percent = closest_light.fov / max_val;
	with(light_dir) percent = closest_light.dir / max_val;
	with(light_radius) percent = closest_light.radius / max_val;
	with(light_falloff) percent = (closest_light.falloff_speed - min_val) / (max_val - min_val);
	with(red_slider) percent = color_get_red(closest_light.col) / max_val;
	with(green_slider) percent = color_get_green(closest_light.col) / max_val;
	with(blue_slider) percent = color_get_blue(closest_light.col) / max_val;
}