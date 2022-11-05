if(!handle.active)
{
	handle.x = x + (sprite_width * percent);
	handle.y = y;
}
else
{
	//adjusting value via handle
	handle.x = clamp(mouse_x, x, x+sprite_width); 
	percent = (handle.x - x) / sprite_width;
}
