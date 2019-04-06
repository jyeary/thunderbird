# Mozilla Thunderbird Email Client

This is the Docker repository for the Mozilla Thunderbird Email Client on Ubuntu.

## Usage

```
docker run -d name thunderbird \
   -v ~/.thunderbird:/root/.thunderbird \
   -e DISPLAY=`ifconfig en0 | grep inet | awk '$1=="inet" {print $2}'`:0 \
   jyeary/thunderbird:1.0.0
```

You must use **xhost** to allow the client to talk to the local machine, e.g. ```xhost +``` will allow any client to connect. You should limit this to the host machine IP address for security.

The default usage above sets the storage of the Mozilla Thunderbird configuration to the user's home directory **.thunderbird**, you should configure the storage to your personal preferences such as **~/Documents/docker/thunderbird**.

The script below will start the container on the localhost for better security.

```bash
#!/bin/bash

# Allow access from localhost
xhost + 127.0.0.1

# Run Mozilla Thunderbird with X11 forwarding and keep running until
# the container exits
docker run -e DISPLAY=host.docker.internal:0 \
-v ~/Documents/Docker/thunderbird:/root/.thunderbird \
jyeary/thunderbird:1.0.0
```

## Mac OS X

If you are using a Mac, you need to install *XQuartz* which can be found [here](https://www.xquartz.org/).
