#!/usr/bin/env bash

#### function ####

# $1 = shell type
ShellConfig_fn() {
    SHELL=$(echo ${1} | tr [A-Z] [a-z])
    if [ ${SHELL} == "zsh" ]; then
        echo "alias ll='ls -alF'" >>/home/${USER}/.${SHELL}rc
        echo "alias la='ls -A'" >>/home/${USER}/.${SHELL}rc
        printf "alias l='ls -CF'\n" >>/home/${USER}/.${SHELL}rc

        # zsh theme - Powerlevel10k
        echo "source ~/.powerlevel10k/powerlevel10k.zsh-theme" >>/home/${USER}/.${SHELL}rc
        echo "source ~/.p10k.zsh" >>/home/${USER}/.${SHELL}rc
        mv ./shell/zsh/powerlevel10k /home/${USER}/.powerlevel10k
        mv ./shell/zsh/.p10k.zsh /home/${USER}/
    elif [ ${SHELL} == "bash" ]; then
        # display git branch
        cat ./shell/bash/git_config.sh >>/home/${USER}/.${SHELL}rc
    fi

    echo "alias eb='vim ~/.${SHELL}rc'" >>/home/${USER}/.${SHELL}rc
    echo "alias sb='source ~/.${SHELL}rc'" >>/home/${USER}/.${SHELL}rc
    echo "alias wb='source ./devel/setup.${SHELL}'" >>/home/${USER}/.${SHELL}rc
    chown ${USER}:${GROUP} /home/${USER}/.${SHELL}rc

}
# $1 = shell type $2 = ROS_TYPE $3 = ROS_MASTER_IP $4 = ROS_SLAVE_IP
ROSConfig_fn() {
    SHELL=$(echo ${1} | tr [A-Z] [a-z])
    ROS_TYPE=$(echo ${2} | tr [a-z] [A-Z])
    echo "source /opt/ros/$ROS_DISTRO/setup.${SHELL}" >>/home/$USER/.${SHELL}rc
    echo "export ROS_MASTER_URI=http://${3}:11311" >>/home/$USER/.${SHELL}rc

    if [ ${ROS_TYPE} == "MASTER" ]; then
        echo "export ROS_HOSTNAME=${3}" >>/home/${USER}/.${SHELL}rc
    elif [ ${ROS_TYPE} == "SLAVE" ]; then
        echo "export ROS_HOSTNAME=${4}" >>/home/${USER}/.${SHELL}rc
    fi
}
# $1  = shell type
BybouConfig_fn() {
    echo "set -g default-shell /bin/${1}" >/home/${USER}/.byobu/.tmux.conf
    echo "set -g default-command /bin/${1}" >>/home/${USER}/.byobu/.tmux.conf

}

####main####

# bash
ShellConfig_fn "bash"
ROSConfig_fn "bash" ${ROS_TYPE} ${ROS_MASTER_IP} ${ROS_SLAVE_IP}

# zsh
ShellConfig_fn "zsh"
ROSConfig_fn "zsh" ${ROS_TYPE} ${ROS_MASTER_IP} ${ROS_SLAVE_IP}

# byobu
mkdir -p /home/${USER}/.byobu
BybouConfig_fn "zsh"
chown -R ${USER}:${GROUP} /home/${USER}/.byobu

# terminator
mkdir -p /home/${USER}/.config/
cp -r ./shell/terminator /home/${USER}/.config/
chown -R ${USER}:${GROUP} /home/${USER}/.config
