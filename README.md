# Godot RigidBody Auto Scaler Plugin

**Scale your Godot RigidBody nodes like it was nothing!** This plugin works around a limitation in the Godot engine that prevents RigidBodies from being scaled (see [GitHub Issue #5734](https://github.com/godotengine/godot/issues/5734)). If this issue gets resolved in a future version, this plugin becomes obsolete.

Minimum Godot version: 4.0

### Features

- Fire-and-forget: just add this plugin to your project and scaled rigidbodies will _just work_.
- Works with both `RigidBody2D` and `RigidBody3D` nodes.
- Will correctly inherit parent scale and fix collision shape offsets, too.

### How does it work?

This plugin installs a global autoload script that listens for new nodes entering the active scene tree. When it encounters a rigidbody node with a scale applied, it will automatically reset its scale back to `1`, and instead apply the original scale to each of its children.

Both spawning new rigidbodies at runtime and applying a scale to them as well as creating scaled rigidbodies in the editor will _just work_; in the latter case, the editor will still display the little warning triangle in the scene tree, but you can safely ignore it.

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
