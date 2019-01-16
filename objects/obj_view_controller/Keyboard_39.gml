/// @desc Move view

var camera = view_get_camera(0);
camera_set_view_pos(camera, camera_get_view_x(camera) + 5, camera_get_view_y(camera));
lighting_set_dirty(true);