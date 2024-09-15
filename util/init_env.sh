##!/usr/bin/env bash
# original setup file is upadated to accommodate both bash and zsh

# Start with oh-my-zsh
# oh my zsh - note that the following requires active internet connection!!!
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
sed -i 's/robbyrussell/fino-time-bug/g' ~/.zshrc
sed -i 's/(git)/(git zsh-autosuggestions themes)/g' ~/.zshrc

# zsh-autosuggestion settings
echo 'ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#009999"' >> ~/.zshrc


echo "RC file updates started"

#let ros rule
echo "source /opt/ros/humble/setup.zsh" >> ~/.zshrc
echo "source /opt/ros/humble/setup.bash" >> ~/.bashrc

cd /home/me461/mnt/labs_ws
colcon build --symlink-install
# and there is gazebo
echo "source /usr/share/gazebo/setup.sh" >> ~/.zshrc
echo "source /usr/share/gazebo/setup.sh" >> ~/.bashrc

# setup local stuff
echo "source /home/me461/mnt/labs_ws/install/setup.zsh" >> ~/.zshrc
echo "source /home/me461/mnt/labs_ws/install/setup.bash" >> ~/.bashrc

echo "export GAZEBO_MODEL_PATH=\${GAZEBO_MODEL_PATH}:/opt/ros/humble/share/humble_gazebo/models" >> ~/.zshrc
echo "export GAZEBO_MODEL_PATH=\${GAZEBO_MODEL_PATH}:/opt/ros/humble/share/humble_gazebo/models" >> ~/.bashrc

echo "export TURTLEBOT3_MODEL=waffle" >> ~/.zshrc
echo "export TURTLEBOT3_MODEL=waffle" >> ~/.bashrc

# add custom aliases and functions for convenience
echo "source /home/me461/mnt/util/.functions.zsh" >> ~/.zshrc
echo "source /home/me461/mnt/util/.functions.zsh" >> ~/.bashrc

echo "source /home/me461/mnt/util/.bug_init.zsh" >> ~/.zshrc
echo "source /home/me461/mnt/util/.bug_init.zsh" >> ~/.bashrc
#echo 'done with zsh udpates...'

echo "source ~/mnt/util/.oh/zsh-vim-mode.plugin.zsh" >> /home/me461/.zshrc

echo "alias testros='ros2 launch turtlebot3_gazebo turtlebot3_world.launch.py'" >> ~/.zshrc
echo "alias testros='ros2 launch turtlebot3_gazebo turtlebot3_world.launch.py'" >> ~/.bashrc

#echo "plugins=(zsh-autosuggestions)" >>~/.zshrc
# also add a shortcut for the plugins
echo "generate symbolic links for vim and zsh"
ln -vnsf /home/me461/mnt/util/.oh/zsh-autosuggestions /home/me461/.oh-my-zsh/custom/plugins/zsh-autosuggestions >/dev/null 2>&1
ln -vnsf /home/me461/mnt/util/.oh/zsh-vim-mode.plugin.zsh /home/me461/.oh-my-zsh/custom/plugins/zsh-vim-mode.plguin.zsh >/dev/null 2>&1
ln -vnsf /home/me461/mnt/util/.oh/fino-time-bug.zsh-theme /home/me461/.oh-my-zsh/custom/themes/fino-time-bug.zsh-theme >/dev/null 2>&1
mkdir /home/me461/.config
ln -vnsf /home/me461/mnt/util/.nvim /home/me461/.config/nvim >/dev/null 2>&1
# adjust local time to Turkiye so that ROS clock and computer clock is in sync.
# remember that you have to adjsut this if you are not in Istanbul time zone for time critical apps
sudo ln -vnsf /usr/share/zoneinfo/Turkey /etc/localtime >/dev/null 2>&1

echo 'bindkey "  " autosuggest-accept' >> ~/.zshrc
