![Lighting Demo](http://thecode.cafe/assets/img/lighting-banner.png)

## GameMaker Studio 2 Version

This project is known to work in GameMaker Studio Beta IDE v2.2.1.374 with Beta Runtime v2.2.1.286 as of January 15, 2019. This is the minimum version of GameMaker Studio 2 you must use.
This system benefits massively from YYC, so it is recommended to use this compiler for releases.

## Links

Shaun Spalding's introduction video: https://www.youtube.com/watch?v=RFRV3lhVOhg.  
Website: http://thecode.cafe/posts/lighting-2d.  
Demo project repository: https://github.com/borup3/Lighting-System-2D-Demos.  
Marketplace: https://marketplace.yoyogames.com/assets/7820/lighting-system-2d.

## 2D Lighting for GameMaker Studio 2

I decided to write a lighting system for GameMaker Studio 2 because I wasn't super satisfied with the availability of lighting in the GameMaker ecosystem.
One of my priorities were to demystify a system like this and ensure that everyone can pick it up, learn from it and understand what's going on, and integrate and adapt it to their game projects.
That's not to say that this is by any means a "gold standard". It's not, but this is what I wrote and it's free and looks alright.
I am releasing this system for free under the [MIT License](http://thecode.cafe/assets/files/mit_license.txt), and it is open-source so everyone can make it better
and modify it to their heart's content. I welcome additions and bug fixes to the general design of the lighting system back into the repository so all users benefit from your cleverness - full credit is of course given.

![Lighting Demo](http://thecode.cafe/assets/img/lighting-use.png)

This is a lightweight shader lighting system for **dynamic pixel lights** that composites multiple lights into a single surface. The surface is fitted to a "camera" that is used to perform the lighting pass.
Instances that inherit from the object `obj_shadow_caster` are able to cast shadows, and lights are placed and configured in the game with instances of `obj_light`. It has good support for [object variables](https://www.yoyogames.com/blog/454/ghosted-parent-events-and-object-variables).

It is my desire to provide a *general* lighting system that could be further customized to suit the needs of each specific game project it is used in.
To get the best performance, or lighting quality, or whatever else, for your game you will probably end up modifying it to some extent. It might also work well for your game or prototype out-of-the-box by tweaking some of the knobs.

You can easily upgrade the lighting system, once integrated in your game, to a newer version by simply replacing the previous version's assets in your project.
It also tracks various statistics (if you opt in) that help you optimize your use of the system.

## Feature suggestions

- Optimizations: trade-off with usability / learnability
- Soft shadows
- Multiple polygons per shadow caster
- Shadow map layers: assign lights and shadow casters to different layers, producing per-layer shadow maps
- Z axis and shadow caster height: use eLight.Z and remove eLight.ShadowLength and obj_shadow_caster.shadow_length hack

## Known issues

- light_trace_polygon doesn't produce a closed polygon, only an issue with shadows smaller than the shadow caster
- Variables eLight.ShadowLength and obj_shadow_caster.shadow_length are a dirty hack to control shadow drops. See feature wishlist.

## Demo

I have prepared a small demo of the lighting system to show what it's capable of in the hands of a moderately bad environment designer in a very short time span (60 minutes).
This demo is a virtual tour of the different types of light in a single level. This demo is not by any means a gold (or even good) standard: for a game project you should do a lot of things different from this demo.
Demos are always time sinks so I decided to leave it in its current sort of unimpressive state. You are of course free to improve this, or make better demos, too.

You can download the demo of the lighting system here: [Lighting_Demo_01.zip](http://thecode.cafe/assets/files/Lighting_Demo_01.zip) (*binary only*).

![Lighting Demo](http://thecode.cafe/assets/img/lighting-office.png)

Note that while this demo is not included with the lighting system project, a selection of testbed rooms are.

## Lights

Lights are defined as a set of attributes that determine their behavior, so they are decoupled from the object that created them.
These attributes include spatial information, rendering attributes like color, range and intensity and what type of light to use.

The following light types are supported at the time of writing:

- `Point` Omnidirectional point emitter
- `Spot` Conical point emitter
- `Area` Unidirectional line emitter
- `Line` Bidirectional line emitter
- `Directional` Infinite directional light without an emitter source

These light types give you a lot of possibilities for lighting up your game worlds.

## Shadow casters

A shadow caster is nothing more than a user-defined polygon and a bitmask enum to mark a shadow caster as static, dirty and so on. Shadow casters are by default non-static (for easier use by novices).
Scripts are included to create a polygon from the axis-aligned or rotated bounding box of an instance and from a path resource for more complex polygons.
This allows you to define complex polygons by tracing sprites on a room path layer and apply rotations with the [path_orientation](https://docs2.yoyogames.com/source/_build/3_scripting/4_gml_reference/paths/path_orientation.html) variable.

By toggling the global variable `shadowCastersCullByCollisionMask` you can control whether to cull shadow casters by their collision masks using an R-tree algorithm or linearly by their polygons. There may be a performance improvement to be had when using the R-tree algorithm, so the default value of this variable is `true`.

## Documentation

I believe the code is sufficiently documented and with the addition of several test rooms and the demo project, I don't feel further documentation is required.
For example, the lighting system contains only 4 objects: the initialization object, the renderer object, the light object and the shadow caster object.