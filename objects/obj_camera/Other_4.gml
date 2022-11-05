view_enabled = true;
view_visible[0] = true;

view_camera[0] = camera_create_view(0, 0, ideal_width, ideal_height);

surface_resize(application_surface, ideal_width, ideal_height);
window_set_size(ideal_width, ideal_height);
display_set_gui_size(ideal_width, ideal_height);