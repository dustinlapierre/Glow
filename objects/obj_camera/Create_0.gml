//determine the aspect ratio of the monitor for dynamic aspect ratio
aspect_ratio = display_get_width() / display_get_height(); 
//aspect_ratio = 16 / 9; //fixed aspect ratio
	
//going with fixed height here because expanding the screen to the left and right a bit
//won't really be as important as up and down
ideal_height = room_height;
ideal_width = round(ideal_height * aspect_ratio); //calculate based on height & aspect ratio
	
//prevent the width from being odd
if(ideal_width & 1)
	ideal_width++;
	
//position vars
cameraX = camera_get_view_x(view_camera[0]);
cameraY = camera_get_view_y(view_camera[0]);
cameraHeight = ideal_height;
cameraWidth = ideal_width;