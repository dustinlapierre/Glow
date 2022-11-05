//A quickly thrown together test object for playing around with the system live
gui_elements = [];
function gui_element_add(_obj, _x, _y)
{
	var element = instance_create_depth(_x, _y, depth, _obj);
	with(element)
	{
		gui_x = _x;
		gui_y = _y;
	}
	array_push(gui_elements, element);
	return element;
}

#region ambient settings

blur_checkbox = gui_element_add(obj_blur_checkbox, 16, 60);

ambient_opacity_slider = gui_element_add(obj_slider, 16, 140);
with(ambient_opacity_slider)
{
	label = "Ambient Opacity";
	percent = glow_get_ambient_opacity() / max_val;
}

red_slider = gui_element_add(obj_slider, 16, 190);
with(red_slider)
{
	label = "Red";
	min_val = 0;
	max_val = 255;
	percent = color_get_red(glow_get_ambient_color()) / max_val;
}
green_slider = gui_element_add(obj_slider, 16, 240);
with(green_slider)
{
	label = "Green";
	min_val = 0;
	max_val = 255;
	percent = color_get_green(glow_get_ambient_color()) / max_val;
}
blue_slider = gui_element_add(obj_slider, 16, 290);
with(blue_slider)
{
	label = "Blue";
	min_val = 0;
	max_val = 255;
	percent = color_get_blue(glow_get_ambient_color()) / max_val;
}
#endregion

#region light edit settings

light_selected = noone; //edit light
light_holding = noone; //move light

light_fov = gui_element_add(obj_slider, 16, room_height - 24);
with(light_fov)
{
	label = "FOV";
	min_val = 0;
	max_val = 360;
}
light_dir = gui_element_add(obj_slider, 200, room_height - 24);
with(light_dir)
{
	label = "DIR";
	min_val = 0;
	max_val = 360;
}
light_falloff = gui_element_add(obj_slider, 384, room_height - 24);
with(light_falloff)
{
	label = "FALLOFF";
	min_val = 1;
	max_val = 20;
}
light_radius = gui_element_add(obj_slider, 568, room_height - 24);
with(light_radius)
{
	label = "RADIUS";
	min_val = 0;
	max_val = 800;
}

#endregion