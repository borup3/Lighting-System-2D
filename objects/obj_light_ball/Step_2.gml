/// @desc Wrap around

move_wrap(false, true, Light_Range);

light[| eLight.X] = x;
light[| eLight.Y] = y;
light[| eLight.Flags] |= eLightFlags.Dirty; // rebuild static shadow casters