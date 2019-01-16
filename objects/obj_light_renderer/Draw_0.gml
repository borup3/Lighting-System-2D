/// @desc Lighting

// Update the shadow map
var exists;

if(dirty || tick >= global.lightUpdateFrameDelay || global.worldShadowMap == undefined || !surface_exists(global.worldShadowMap)) {
	// Composite shadow map
	exists = composite_shadow_map(global.worldLights);
	dirty = false;
	tick = 0;
}
else exists = surface_exists(global.worldShadowMap);

if(exists) {
	// Get the active camera
	var camera = lighting_get_active_camera();
	// Draw the shadow map
	draw_shadow_map(camera[eLightingCamera.X], camera[eLightingCamera.Y]);
}