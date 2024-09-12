#!/usr/bin/env bash

echo "source /opt/ros/humble/setup.bash" >>~/.bashrc

cd /home/me461/mnt/labs_ws
colcon build --symlink-install
echo "source /usr/share/gazebo/setup.sh" >>~/.bashrc
echo "source /home/me461/mnt/labs_ws/install/setup.bash" >>~/.bashrc
echo "export GAZEBO_MODEL_PATH=\${GAZEBO_MODEL_PATH}:/opt/ros/humble/share/humble_gazebo/models" >>~/.bashrc
echo "export TURTLEBOT3_MODEL=waffle" >>~/.bashrc
echo "source /home/me461/mnt/labs_ws/.bug_init" >>~/.bashrc

# oh my zsh - note that the following requires active internet connection!!!
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
sed -i 's/robbyrussell/fino-time-bug/g' ~/.zshrc
sed -i 's/(git)/(git zsh-autosuggestions themes)/g' ~/.zshrc
#echo "plugins=(zsh-autosuggestions)" >>~/.zshrc
# also add a shortcut for the plugins
echo "generate symbolic links for vim and zsh"
ln -vnsf /home/me461/mnt/util/.oh/zsh-autosuggestions /home/me461/.oh-my-zsh/custom/plugins/zsh-autosuggestions >/dev/null 2>&1
ln -vnsf /home/me461/mnt/util/.oh/zsh-vim-mode.plugin.zsh /home/me461/.oh-my-zsh/custom/plugins/zsh-vim-mode.plguin.zsh >/dev/null 2>&1
ln -vnsf /home/me461/mnt/util/.oh/fino-time-bug.zsh-theme /home/me461/.oh-my-zsh/custom/themes/fino-time-bug.zsh-theme >/dev/null 2>&1
mkdir /home/me461/.config
ln -vnsf /home/me461/mnt/util/.nvim /home/me461/.config/nvim >/dev/null 2>&1

echo "source /home/me461/mnt/util/.functions.zsh" >>~/.zshrc
echo "source /home/me461/mnt/util/.bug_init.zsh" >>~/.zshrc
