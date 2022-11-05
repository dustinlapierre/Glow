if(light_holding == noone)
{
	var closest_light = instance_nearest(mouse_x, mouse_y, _glow_light);

	if(point_distance(mouse_x, mouse_y, closest_light.x, closest_light.y) < 50 
	&& !collision_circle(mouse_x,mouse_y, 10, obj_handle, false, true))
	{
		//select the light
		light_holding = closest_light;
	}
}
else
{
	light_holding = noone;	
}