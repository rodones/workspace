# scripts

This repository contains custom scripts, docker files, etc. 

## Documents

- [COLMAP container](docs/container-colmap.md)
- [PoissonRecon container](docs/container-poisson-recon.md)
- [Nexus container](docs/container-nexus.md)
- [Video to Image Convertion](docs/converting-video-to-images.md)
- [Executing s4cmd commands parallel](docs/s4cmd-parallel-parallel-execution.md)
- [Uploading Images to S3 Compatible Service](docs/uploading-images.md)

## Setup

### Requirements

#### Host System
- Docker Engine
    - [docker](https://docs.docker.com/engine/install/ubuntu/) (If CUDA is not enabled)
    - [nvidia-docker](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/install-guide.html) (If CUDA enabled)

#### Automated Instance Creation
- [ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html?extIdCarryOver=true&sc_cid=701f2000001OH7YAAW)
    - [community.docker](https://docs.ansible.com/ansible/latest/collections/community/docker/index.html)
- [terraform](https://www.terraform.io/downloads)

#### Miscellaneous

##### vid2img.sh
- [ffmpeg](https://ffmpeg.org/download.html)

##### sync.sh
- [s4cmd](https://github.com/bloomreach/s4cmd)

### Configuration
- Create `.env` using [.env.example](./.env.example) and fill. This will be used by  [start.sh](./start.sh) for 
container identification and notification purposes.
- Create `digitalocean.auto.tfvars` using [.env.example](./terraform/digitalocean.auto.example.tfvars). This will be
used for remote server creation on digitalocean.  

## Building and Pulling Images

Building process is described [here](./docker). 

The prebuilt images are published in [Docker Hub](https://hub.docker.com/u/rodones).
- [rodones/colmap](https://hub.docker.com/r/rodones/colmap)
- [rodones/nexus](https://hub.docker.com/r/rodones/nexus)
- [rodones/poisson-recon](https://hub.docker.com/r/rodones/poisson-recon)
