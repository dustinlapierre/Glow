if(keyboard_check(ord("D")))
{
	cameraX += 3;	
}
if(keyboard_check(ord("A")))
{
	cameraX -= 3;	
}

//clamp main point within room (offsets can go outside)
cameraX = clamp(cameraX, 0, room_width - cameraWidth);
cameraY = clamp(cameraY, 0, room_height - cameraHeight);

//set final coordinates
camera_set_view_pos(view_camera[0], cameraX, cameraY);