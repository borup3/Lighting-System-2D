/// @desc Draw stats

var lightCount = ds_list_size(global.worldLights);
var shadowCasters = instance_number(obj_shadow_caster);
draw_text(10, 10, "Rebuilt lights: " + string(global.worldRebuiltLights) + " of " + string(lightCount)
				+ "\nActive shadow casters: " + string(global.worldActiveShadowCasters) + " of " + string(shadowCasters * lightCount) + " (" + string(shadowCasters) + " shadow casters)");