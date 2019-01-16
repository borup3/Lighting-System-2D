/// @desc Range

light[| eLight.Range] = max(light[| eLight.Range] - 50, 1);
light[| eLight.Flags] |= eLightFlags.Dirty;