FROM ubuntu:latest
EXPOSE 4000

RUN apt-get update
RUN apt-get install -y build-essential wget tar curl

RUN cd /tmp; wget https://github.com/postmodern/ruby-install/releases/download/v0.9.3/ruby-install-0.9.3.tar.gz; tar -xzvf ruby-install-0.9.3.tar.gz; cd ruby-install-0.9.3/; make install

RUN ruby-install ruby 3.1.3

ENV PATH="${PATH}:/opt/rubies/ruby-3.1.3/bin"

RUN ruby --version

RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

RUN export NVM_DIR="$HOME/.nvm"
RUN . "/root/.nvm/nvm.sh" && nvm install --lts
RUN . "/root/.nvm/nvm.sh" && npm install -g yarn
RUN . "/root/.nvm/nvm.sh" && yarn
