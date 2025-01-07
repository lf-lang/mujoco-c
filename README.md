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

2. Download a prebuilt version of Mujoco v3.2.6 and install it to `/opt/mujoco`. The following works for x86, for aarch64, change the download path accordingly (https://github.com/google-deepmind/mujoco/releases/tag/3.2.6)
```sh
wget https://github.com/google-deepmind/mujoco/releases/download/3.2.6/mujoco-3.2.6-linux-x86_64.tar.gz
tar xvf mujoco-*
sudo mv mujoco-3.2.6 /opt/mujoco
```


### macOS
1. Install GLFW, a graphics library used by MuJoCo

```sh
brew install glfw
```

2. Build Mujoco v3.2.6 from source and install to `/opt/mujoco`

```sh
git clone git@github.com:google-deepmind/mujoco.git -b 3.2.6
cd mujoco
mkdir build
cd build
cmake .. -DCMAKE_INSTALL_PREFIX=/opt/mujoco
cmake --build .
sudo cmake --install .

```

### All platforms

If mujoco is installed to a different location the
[mujoco.cmake](src/include/mujoco.cmake) must be updated accordingly.

## Demos

* [MuJoCoBasicDemo](src/MuJoCoBasicDemo.lf): Rectangular object that falls to the floor.
* [MuJoCoCarDemo](src/MuJoCoCarDemo.lf): Simple drivable car.
