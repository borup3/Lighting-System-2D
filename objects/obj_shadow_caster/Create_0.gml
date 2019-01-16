/// @desc Initialise shadow caster

//
//	Inherit this event and assign a polygon and (optionally) shadow caster flags
//	Use eShadowCasterFlags.Static if your shadow caster is unlikely to move between frames!
//

// Child objects set this
polygon = undefined;

// Default shadow caster flags
flags = eShadowCasterFlags.None;

// The maximum length of shadows cast by this shadow caster
// shadow_length -- this is an object variable

//
// Internal
//

// The cached polygon is automatically maintained by the system to optimize static shadow casters
cached_polygon_area = undefined;

// Is the shadow caster outside the active camera?
outside_active_camera = false;
// The last camera this shadow caster was compared against,
// as the view array
last_camera = undefined;