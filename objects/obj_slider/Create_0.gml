function get_value()
{
	return lerp(min_val, max_val, percent);
}

label = "Test Slider";
min_val = 0;
max_val = 1;
percent = 0.5;

handle = instance_create_depth(x,y,depth-1,obj_handle);