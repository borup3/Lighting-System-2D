/// @desc Free the lighting engine

vertex_format_delete(global.lightVertexFormat);

// Remove all lights, if any
var lights = global.worldLights;
for(var i = 0; i < ds_list_size(global.worldLights); ++i) {
	light_destroy(lights[| i]);
}
ds_list_destroy(lights);

ds_map_destroy(global.lightVertexArrayMap);

if(global.worldShadowMap != undefined && surface_exists(global.worldShadowMap))
	surface_free(global.worldShadowMap);

if(global.lightShadowMap != undefined && surface_exists(global.lightShadowMap))
	surface_free(global.lightShadowMap);
	
ds_list_destroy(global.worldDirtyShadowCasters);

ds_list_destroy(global.worldCulledShadowCastersRTree);