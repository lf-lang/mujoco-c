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

Alternatively, Mujoco can be built from source as explained under the section for MacOS below.

### macOS
1. Install GLFW, a graphics library used by MuJoCo

```sh
brew install glfw
```

2. Build Mujoco v3.2.6 from source and install to `/opt/mujoco`

```sh
git clone https://github.com/google-deepmind/mujoco.git -b 3.2.6
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

## Library Reactors

* [MuJoCoBase](src/lib/MuJoCoBase.lf): Base class providing navigation of the view and methods to update the scene and advance the simulator. This is not meant to be directly instantiated.
* [MuJoCoAdvance](src/lib/MuJoCoAdvance.lf) extends [MuJoCoBase](src/lib/MuJoCoBase.lf): Base class providing an `advance` input to advance the simulation to the logical time and update the scene. This refers to the [hello](src/models/hello.xml) basic demo model, which has a box and a floor.
* [MuJoCoAuto](src/lib/MuJoCoAuto.lf) extends [MuJoCoBase](src/lib/MuJoCoBase.lf): Base class that automatically advances the simulation and outputs a tick for each step. This separates the updating of the scene, which is driven by a periodic timer. This refers to the [hello](src/models/hello.xml) basic demo model, which has a box and a floor.
* [MuJoCoCar](src/lib/MuJoCoCar.lf) extends [MuJoCoAdvance](src/lib/MuJoCoAdvance.lf): Simulator for the [car](src/models/car.xml) basic demo model, providing a two-wheel vehicle and keyboard controlled driving. This version actively controls the simulator advance. 
* [MuJoCoCarAuto](src/lib/MuJoCoCarAuto.lf) extends [MuJoCoAuto](src/lib/MuJoCoAuto.lf): Simulator for the [car](src/models/car.xml) basic demo model, providing a two-wheel vehicle and keyboard controlled driving. This version lets the simulator advance automatically.

## Demos

* [MuJoCoBasicDemo](src/MuJoCoBasicDemo.lf): Rectangular object that falls to the floor.
* [MuJoCoCarDemo](src/MuJoCoCarDemo.lf): Simple drivable car.
* [MuJoCoCarAutoDemo](src/MuJoCoCarAutoDemo.lf): Simple drivable car.
