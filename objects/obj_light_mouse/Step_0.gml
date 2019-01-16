/// @desc Follow mouse

light[| eLight.X] = mouse_x;
light[| eLight.Y] = mouse_y;
light[| eLight.Flags] |= eLightFlags.Dirty; // rebuild static shadow casters