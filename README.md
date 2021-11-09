# Need to configure for the first time

Sorry English not completed

1. computer and raspberry PI open docker

    ```bash
    # computer is x86_64, PI is arrch64
    $ ./<path to docker>/build_docker_image.sh
    $ ./<path to docker>/run_docker_container.sh
    ```

2. run catkin build workspace and run roscore

    - computer

        ```bash
        $ cd <path to workspace>
        # use catkin build or catkin_make
        $ catkin build
        $ roscore
        ```

    - PI

        ```bash
        $ cd work
        # use catkin build or catkin_make
        $ catkin build
        ```

3. run code

    - PI

        ```bash
        $ source ~/work/setup.bash

        $ roslaunch motion serial.launch
        ```

    - computer

        ```bash
        $ source ~/work/setup.bash

        $ roslaunch motion motion.launch
        $ rostopic pub /motion/cmd_val geometry_msgs/Twist "linear:
          x: 0.0
          y: 0.0
          z: 0.0
        angular:
          x: 0.0
          y: 0.0
          z: 0.0"

        # or
        $ rostopic pub /motion/motor_speed motion/FourMotorCmd "w1: 0.0
        w2: 0.0
        w3: 0.0
        w4: 0.0"
        ```
