function Quad(_vb, _x1, _y1, _x2, _y2)
{
	vertex_position_3d(_vb, _x1, _y1, 0);
	vertex_position_3d(_vb, _x1, _y1, 1);
	vertex_position_3d(_vb, _x2, _y2, 0);
	
	vertex_position_3d(_vb, _x1, _y1, 1);
	vertex_position_3d(_vb, _x2, _y2, 0);
	vertex_position_3d(_vb, _x2, _y2, 1);
}

//write to vertex buffer
vertex_begin(vb, vf);

	var _vb = vb;
	with(_glow_shadow_caster_rect)
	{
		Quad(_vb, x, y, x+sprite_width, y+sprite_height);
		Quad(_vb, x+sprite_width, y, x, y+sprite_height);
	}
	with(_glow_shadow_caster_slope)
	{
		Quad(_vb, x, y, x+sprite_width, y+sprite_height);
		Quad(_vb, x, y+sprite_height, mid_x, mid_y);
	}
	
vertex_end(vb);
