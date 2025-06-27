FROM ghcr.io/rocm/therock_build_manylinux_x86_64:main

# download ollama rocm manually so that you don't have to redownload when building
# - download manually
# - extract with tar -zxf <file>.tgz and 
# - copy ./lib and ./bin to /usr
# copying the directories gives me some weird errors...
# COPY bin /usr
# COPY lib /usr
# If your internet is fast, you can just do this:
# RUN curl -L https://ollama.com/download/ollama-linux-amd64.tgz -o ollama-linux-amd64.tgz
# RUN curl -L https://ollama.com/download/ollama-linux-amd64-rocm.tgz -o ollama-linux-amd64-rocm.tgz
COPY ollama-linux-amd64-rocm.tgz .
COPY ollama-linux-amd64.tgz .
RUN tar -C /usr -xzf ollama-linux-amd64.tgz
RUN tar -C /usr -xzf ollama-linux-amd64-rocm.tgz

# in case you want to access the api from outside of the docker container
ENV OLLAMA_HOST 0.0.0.0

CMD ollama serve
