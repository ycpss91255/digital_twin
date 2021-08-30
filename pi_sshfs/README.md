# SSHFS script

1. Install ssh and sshfs

    ```bash
    $ sudo apt install ssh sshfs -y
    ```

2. edit `mount_file.sh`, modify `user` and ip

    ```bash
    $ cd <path to pi_sshfs>
    $ nano ./mount_file.sh
    ```

3. Copy all file to `HOME` directory

    ```bash
    $ mkdir ~/remote_file
    $ cp ./* ~/remote_file
    ```

4. Run `mount_file.sh`

    ```bash
    $ cd ~/remote_file && ./mount_file.sh
    ```

5. Enjoy
