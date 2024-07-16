# Ubuntu with Tools
Get an Ubuntu container with tools from any folder inside your home folder.

Great for running Non-NixOS native binaries on NixOS. `nix-ld` works for alot of things, but not all software respects environment variables (in which case, they can't read `NIX_LD_LIBRARY_PATH`).

## Overview

This repository is aimed at providing an easy way to set up a Dockerized Ubuntu environment loaded with useful tools. The setup process is simplified using a shell script, and you can start the container from anywhere within your home directory. The container has your home whole folder shared with it. When you run the container using `ubuntu-with-tools.sh`, you'll be dropped into the folder you ran it from inside the container. For example

```
➜  ~ cd ~/projects/tunnelmole-client # Entering the tunnelmole-client folder on my host. Tunnelmole (https://tunnelmole.com) is an open source tunneling tool
➜  tunnelmole-client git:(main) ✗ ubuntu-with-tools.sh
ubuntu@e95dee9218ea:~/projects/tunnelmole-client$ # Automatically dropped into the same folder I was working in 
ubuntu@e95dee9218ea:~/projects/tunnelmole-client$ npm run build-linux-bin # Now, I can build linux binaries with Vercel pkg, which wont run under nix-ld due to how it handles environment variables
```

## Repository Structure
- `build.sh`: A script to build the Docker image.
- `Dockerfile`: The Dockerfile containing the instructions to build the Docker image with Ubuntu and the desired tools.
- `README.md`: This file, containing instructions and information about the project.
- `ubuntu-with-tools.sh`: A script to start the Docker container with the tools and interactive shell.

## Getting Started

### Prerequisites

Ensure you have Docker installed on your system. You can follow the installation guide for Docker [here](https://docs.docker.com/get-docker/).

### Building the Docker Image

1. Clone this repository to your local machine.
   ```sh
   git clone <repository_url>
   cd ubuntu-with-tools
   ```

2. Run the `build.sh` script to build the Docker image.
   ```sh
   ./build.sh
   ```
   This will execute the Docker build using the instructions in the `Dockerfile`.

### Symlink start.sh somewhere handy in your PATH. 
For example
```
sudo ln -s start.sh /usr/bin/ubuntu-with-tools.sh
```

### Using the Container

To easily start a shell session within the Dockerized environment, you'll need to symlink the `ubuntu-with-tools.sh` script to a directory that's in your PATH.

1. Create a symlink to `ubuntu-with-tools.sh`:
   ```sh
   ln -s $(pwd)/ubuntu-with-tools.sh /usr/local/bin/start-ubuntu-with-tools
   ```

2. From anywhere in your home directory, run:
   ```sh
   start-ubuntu-with-tools
   ```
   This will drop you into an interactive shell within the Docker container, with all the tools ready to use.

### Add extra packages
Edit the `Dockerfile` and add your desired packages under the `RUN apt-get install -y` line.

## Contributing

Feel free to submit issues or pull requests if you have any suggestions or improvements. Contributions are always welcome!

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for detail