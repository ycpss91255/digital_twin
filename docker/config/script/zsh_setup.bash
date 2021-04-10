#!/bin/bash

mv ./zsh/powerlevel10k /home/${USER}/.powerlevel10k
mv ./zsh/.p10k.zsh /home/${USER}/
cat ./zsh/zshrc/*.sh >> /home/${USER}/.zshrc
