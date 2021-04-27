# Digital_twin

## Environment

- Hardware
  - CPU -
  - GPU -
  - RAM -
- Software
  - Windows 10
    - SolidWorks 2019_SP0
    - SolidWorks to URDF Exporter 1.5.1 [[github]](https://github.com/ros/solidworks_urdf_exporter/releases)
  - Ubuntu 20.04.1
    - Docker version - 20.10.3
    - NVIDIA-driver - 460.39
    - Cuda version - 11.2

## Installation

### Docker

1. [Install Docker](https://docs.docker.com/engine/install/ubuntu/)
2. [Post-installation steps for Linux](https://docs.docker.com/engine/install/linux-postinstall/)

### NVIDIA container runtime

**This step is only applicable to NVIDIA GPU**,if you don't have a GPU, please skip it
~~I don't know how to handle AMD GPU~~

```shell
$ curl -s -L https://nvidia.github.io/nvidia-container-runtime/gpgkey | \
  sudo apt-key add -
$ distribution=$(. /etc/os-release;echo $ID$VERSION_ID)
$ curl -s -L https://nvidia.github.io/nvidia-container-runtime/$distribution/nvidia-container-runtime.list | \
  sudo tee /etc/apt/sources.list.d/nvidia-container-runtime.list
$ sudo apt-get update && sudo apt install nvidia-container-runtime
$ sudo systemctl restart docker.service
```

[Install NVIDIA container runtime](https://nvidia.github.io/nvidia-container-runtime/), I use **Debian-based distributions**

I reference chikuta/chikuta-dockerfiles [github](https://github.com/chikuta/chikuta-dockerfiles)

## 使用方法

還沒有喇
ros_master_uri 要手動調整
命令值 >= 100 會爆炸
rostopic pub -1 /omwr/wheel1/command std_msgs/Float64 "data: 50.0"


## USB rules

```shell
$ sudo udevadm control --reload-rules ; udevadm trigger
```

# ros arduino

```shell
$ sudo apt-get install ros-noetic-rosserial-arduino ros-noetic-rosserial
```


  <link name="world"/>
  <joint name="world_joint" type="fixed">
     <parent link="world"/>
     <child link="base_link"/>
   </joint>

<!-- TODO : simulator and real motor sync mode-->
