# ME461_LABS

This repository contains a self-contained environment for me461 students to learn the basics of ROS2 and Gazebo without having to worry about any installations or dependencies. It also provides the possibility to expand upon the environment in an easy distributable fashion.

## Recommended Work Flow

For the best team work experience, create a Github Organization account and create your own fork of the repo. This way you will be able to collaborate in an online fashion and share your work easily with other team members. You will also be able to push changes to your own forked repo. 

## Prerequisites

1. [Install Docker Engine using the convience script](https://docs.docker.com/engine/install/ubuntu/#install-using-the-convenience-script) 

2. [Manage Docker as a non-root user](https://docs.docker.com/engine/install/linux-postinstall/#manage-docker-as-a-non-root-user)

3. [Configure Docker to start on boot](https://docs.docker.com/engine/install/linux-postinstall/#configure-docker-to-start-on-boot-with-systemd)

4. Clone or fork the repo to any desired location on your linux computer. For simplicity, a directory named ```me461``` on your desktop is not a bad idea:

Note that this repo itself if forked from an earlier ```ME462 class project repo```. 
If you want to try the vanilla version punch in:
```  
git clone https://github.com/RobotDegilim/ME461_LABS.git ~/Desktop/me461
```  

or you can try my spiced up version:
```  
git clone https://github.com/bugrakoku/ME461_LABS.git ~/Desktop/me461
```  

After cloning the directory structure should look similar to the following:

```
Desktop - or the folder you clonded the repo
└── me461
    ├── .devcontainer
    ├── labs_ws
    └── util
```

You can check this using the ```tree``` command in linux.  If it is not installed on your system, by now you should know what to do.  

Note that this repo (as mentioned to be the spiced up version of the original) is what I am using in class. It also support ```zsh``` as well as ```bash``` which comes with autocomplete suggestions and many more nice utilities.

Also note that this beefed up version has ```neovim``` installed and configured for avarage text editing. Who does not love ```VIM```?  



## Enabling Nvidia Acceleration

(For PCs with NVIDIA GPUs) make sure you are using official NVIDIA drivers and install [NVIDIA Container Toolkit.](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html) Test your installation with:  
```
sudo docker run --rm --runtime=nvidia --gpus all ubuntu nvidia-smi
```

NOTE: If your computer doesn't have an NVIDIA GPU remove the ```--gpus all``` run arg from *.devcontainer/devcontainer.json*


## UID for your user  
Check out your user ID number associated with your user name:
```
echo $UID
```
If it is _1000_ move on. If it is not, most probably there are more than one user on your linux machine, or you may be using MacOS, anyway:  
Open file ```.devcontainer/labs.Dockerfile``` and edit update _1000_ with your UID in the line that should be as follows:  
```
ARG USER_UID = 1000
```
Open file ```util/build_container_instance.sh``` and similarly update the number _1000_ on the line that reads:
```
    -u 1000
```

If you compile without updating your UID, you will have a crappy image.  


## Conventient First-Time Installation 

For maximum convenience:
 
1. Use [VSCode](https://code.visualstudio.com/docs/setup/linux)
  
2. Install the _Remote Development_ extension in VSCode.

3. Open VSCode's command pallete (CTRL + SHIFT + P) and run 
```
Dev Containers: Rebuild and Reopen in Container
```

4. Wait for the building process to finish. The building process might take upwards of 10-15 mins depending on your internet connection. 

5. Check your installation by running any ros2 or gazebo command. A good candidate is 
```
ros2 launch turtlebot3_gazebo turtlebot3_world.launch.py
```
since it requires all major components to be functioning properly (ROS2, Gazebo, and X11 server)

6. After building once, run ```Dev Containers: Reopen in Container``` in the command pallete to resume working on the labs.


## Building Using DOCKER CLI

ME461 students generally prefer to use the convenience method (a.k.a. _lazy_ VSCoder) as outlined above.  
Curious students however, are encouraged to read the docker file, understand it, and then do everything through the terminal.

- To build the docker container (create an image) navigate to .devcontainer directory and run 
```
docker build -t me461_labs -f ./labs.Dockerfile .
```  
Read this file carefully, if you need other programs, you can add them before you built the docker file. Once it is compiled, you will have to live with it.  
Note that this is a good thing, since, if  you mess up anything, you will be able to create a fresh instance of you docker iamge.

- To run the docker container (instantiate and image) run the ```build_container_instance.sh```.  Let's assume that you are within me461 directory, then simply run 
```
./util/build_container_instance.sh
```
You are also recommended to read this file, and the files referenced from this file, and so on...  

Note that RUNNING a docker image, creates and instance as defined by RUN parameters. Once you RUN an image, it will be alive, and you will be able to connect and disconnect to that instant as many times as you need. You only need to STOP the instance, remove it and RUN a new one, in case you mess things up, or change the build file to meet your taste. If you develop deeper tastes, which you are encouared to, you will start editing with build file first, then the RUN files. Enjoy the ride...  
Well, once you instantiate a docker image by running it, you can check and see that it is up by:
```
docker ps -a
```

Even though it is up, you are not connected to it. To get a intearactive terminal connection type:
```
docker container exec -it me461_labs bin/bash
```
or if you are like me, and prefer the richer ```zsh``` environemnt with ```oh-my-zsh``` over ```bash```, try:
```
docker container exec -it me461_labs bin/zsh
```

To check your installation is ok, similar to what is given above you can type: 
```
ros2 launch turtlebot3_gazebo turtlebot3_world.launch.py
```
yet, if nothing went wrong, an alias named ```testros``` should have been created, and typing it on the command line should run the test case given above.  


> **NOTE**: Don't forget to run
```
xhost +local:docker
```
in the host/base machine's terminal in order to allow Docker to run GUIs.

## Launching the Game

- To spawn a turtlebot and a camera in Gazebo run 
```
ros2 launch sokoban gazebo_launch.py world:="<world_name>.world"
``` 

The camera stream is published on the topic `world_cam/image_raw`

- Note that the world argument defaults to empty.world. The following worlds are available as of currently:
    1. empty.world
    2. easymode_v1.world
    3. model1_v1.world
    4. model2_v1.world

- To spawn objects in the already launched gazebo server: 
    1. Change the PARAMs in ```spawn_objects/launch/spawn_params.yaml```. Current PARAMs:
        - is_random: specifies whether the objects are spawned at random locations 
        - spawn_box: whether to spawn boxes or not. Setting this to *False* ignores all other box params
        - num_box: num of boxes to spawn if spawn_box is *True*
        - spawn_target: whether to spawn targets or not. Setting this to *False* ignores all other targert params
        - target_type: chooses target to spawn. Possible Targets: 'donut', 'square', 'triangle', 'eight'
        - num_target:  num of targets to spawn if spawn_target is *True*
    2. 
```
ros2 launch spawn_objects spawn_objects.launch.py
```


