# Use Ollama with ROCM on gfx1151

Radeon 8060S have missing kernels or are not supporten in current ROCM versions. This container uses TheRock bleeding edge versions of ROCM that have support.

You will have to edit the docker file slightly in order to get get this running.


use
```bash
docker compose up --build
```
to spin up a `ollama` server inside the container. User either from the commandline 
```bash
docker compose exec ollama ollama run model
```
or through the API, an `ollama` api endpoint is exposed at `127.0.0.1:11434`.

It also maps  ~/.ollama from your current machine. Currently the container writes as root and you may have to change ownership manually if you want to use ~/.ollama outside of the container

