/// @desc Create shadow caster polygon

// Inherit the parent event
event_inherited();

// Create a sprite polygon for this instance
polygon = polygon_from_instance(id);

// This is not a static shadow caster (it follows the mouse every frame)
//flags |= eShadowCasterFlags.Static;