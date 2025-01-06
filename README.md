# mujoco-c

[MuJoCo](https://mujoco.org) (Multi-Joint dynamics with Contact) is a physics-based simulation engine with graphics and animation for the C target.
This repo defines a base reactor and some example derived reactors.  The [MuJoCoBase](src/lib/MuJoCoBase.lf) reactor provides a single simulator with graphical animation.
The derived reactors customize this base class for particular MuJoCo model files.

## Prerequisites

### Linux (Ubuntu)

Install GLFW, a graphics library used by MuJoCo

```sh
apt install libglfw3-dev
```

### macOS
Install GLFW, a graphics library used by MuJoCo

```sh
brew install glfw
```

### All platforms
Build Mujoco v3.2.6 from source and install to `/opt/mujoco`

```sh
git clone git@github.com:google-deepmind/mujoco.git -b 3.2.6
cd mujoco
mkdir build
cd build
cmake .. -DCMAKE_INSTALL_PREFIX=/opt/mujoco
cmake --build .
sudo cmake --install .

```

If mujoco is installed to a different location the
[mujoco.cmake](src/include/mujoco.cmake) must be updated accordingly.

## Demos

* [MuJoCoBasicDemo](src/MuJoCoBasicDemo.lf): Rectangular object that falls to the floor.
* [MuJoCoCarDemo](src/MuJoCoCarDemo.lf): Simple drivable car.
