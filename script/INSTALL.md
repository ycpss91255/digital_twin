# Install

1. Download the Github repository.

    ```shell
    $ git clone -b software https://github.com/ycpss91255/digital_twin \
        digital_twin_ws/src
    # or
    $ git clone git@github.com:ycpss91255/digital_twin.git
    ```

2. install Docker steps. **(only do it once)**
    - If there is an error when run **install_docker.sh**, please check the official Docker website.
    -

    ```shell
    $ cd digital_twin_ws/src/scripts
    $ ./install_docker.sh
    $ ./
    ```

3. computer and raspberry PI open docker

    ```bash
    # computer is x86_64, PI is arrch64
    $ ./<path to docker>/build_docker_image.sh
    $ ./<path to docker>/run_docker_container.sh
    ```

    <!-- a. install docker steps

        ```bash
        ``` -->
