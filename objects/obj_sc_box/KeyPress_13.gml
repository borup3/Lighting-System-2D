/// @desc Toggle ignore shadow caster

if(!instance_exists(obj_light_mouse)) {
	show_debug_message("obj_sc_box :: Key Press - Enter: obj_light_mouse doesn't exist");
	return;
}

if(!ignored) {
	// Ignore for mouse light
	light_ignore_shadow_caster(obj_light_mouse.light, id);
	ignored = true;
}
else {
	// Acknowledge for mouse light
	light_acknowledge_shadow_caster(obj_light_mouse.light, id);
	ignored = false;
}