# mujoco-c

[MuJoCo](https://mujoco.org) (Multi-Joint dynamics with Contact) is a physics-based simulation engine with graphics and animation for the C target.
This repo defines a base reactor and some example derived reactors.  The [MuJoCoBase](src/lib/MuJoCoBase.lf) reactor provides a single simulator with graphical animation.
The derived reactors customize this base class for particular MuJoCo model files.

## Prerequisites


### Linux (Ubuntu)

1. Install GLFW, a graphics library used by MuJoCo

```sh
apt install libglfw3-dev
```

2. Download pre-built Mujoco v3.2.6 binaries from [here](https://github.com/google-deepmind/mujoco/releases/tag/3.2.6).
```sh
wget wget https://github.com/google-deepmind/mujoco/releases/download/3.2.6/mujoco-3.2.6-linux-x86_64.tar.gz
```

3. Install to `/opt` 
```sh
sudo mkdir -p /opt/mujoco-3.2.6-linux-x86_64/
tar xvf mujoco-3.2.6-linux-x86_64.tar.gz --directory /opt/mujoco-3.2.6-linux-x86_64/
```
### macOS

MuJoCo depends on [GLFW](https://www.glfw.org), a graphics library that you must install. On macOS:

```sh
brew install glfw
```

2. Download the Mujoco v3.2.6 DMG disk image from [here](https://github.com/google-deepmind/mujoco/releases/tag/3.2.6).
```sh
wget wget https://github.com/google-deepmind/mujoco/releases/download/3.2.6/mujoco-3.2.6-macos-universal2.dmg
```

3. Install to `/Application` by double-clicking the DMG and dragging MuJoCo.app into `/Applications` 


### All platforms

If another version of mujoco is installed, or if it is placed in a different location
the [mujoco.cmake](src/include/mujoco.cmake) must be updated accordingly.

## Demos

* [MuJoCoBasicDemo](src/MuJoCoBasicDemo.lf): Rectangular object that falls to the floor.
* [MuJoCoCarDemo](src/MuJoCoCarDemo.lf): Simple drivable car.
