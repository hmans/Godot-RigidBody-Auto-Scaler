# Godot RigidBody Auto Scaler Plugin

**Scale your Godot RigidBody nodes like it was nothing!** This plugin works around a limitation in the Godot engine that prevents RigidBodies from being scaled (see [Issue #5734](https://github.com/godotengine/godot/issues/5734)). If this issue gets resolved in a future version, this plugin becomes obsolete.

![image](https://user-images.githubusercontent.com/1061/223428242-3c1d3d5a-de5f-4217-b88a-22a6b52b8619.png) ![image](https://user-images.githubusercontent.com/1061/223428448-943cd444-511c-483d-af24-7f6cb6e32af0.png)

Minimum Godot version: 4.0

### Features

- Fire-and-forget: just add this plugin to your project and scaled rigidbodies will _just work_.
- Works with both `RigidBody2D` and `RigidBody3D` nodes.
- Will correctly inherit parent scale and fix collision shape offsets, too.

### Installing

- Download it via the Godot Asset Library
- Download [this repository's ZIP archive](https://github.com/hmans/Godot-RigidBody-Auto-Scaler/archive/refs/heads/main.zip), unpack it into your Godot project, and enable the plugin in your Project Settings

### How does it work?

This plugin installs a global autoload script that listens for new nodes entering the active scene tree. When it encounters a rigidbody node with a scale applied, it will automatically reset its scale back to `1`, and instead apply the original scale to each of its children (and their local positions, in case they're not located at origin.)

### Caveats

Both spawning new rigidbodies at runtime and applying a scale to them as well as creating scaled rigidbodies in the editor will generally _just work_, but there are a couple of minor caveats you should be aware of:

- When you scale rigidbodies in the editor, it will still display the little warning triangle in the scene tree. You can safely ignore it.
- When spawning new rigidbodies and scaling them, you must make sure that you apply the scale _before_ adding the nodes to the scene tree (`add_child()` et al), because the scale processing will happen immediately once the node enters the tree.
- Since 3D collision shapes generally only support uniform scale (ie. all components of the scale vector having the same value), it is recommended that you only apply uniform scale to your rigidbodies, too. If you apply non-uniform scale to them, the plugin _will_ also apply it to their children, but in the case of collision shapes, this may wreak havoc with the physics simulation.
- Please also keep in mind that nodes will only ever be processed _once_, when adding the scene tree. This plugin does not allow you to _change_ a physics body's scale during its lifetime.

### Get in touch

- https://hmans.dev
- https://norden.social/@hmans
- https://github.com/hmans
- hendrik@mans.de

### License

```
Copyright (c) 2023 Hendrik Mans

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
```
