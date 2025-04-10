FROM node:22-alpine
MAINTAINER https://github.com/bluesquall/zola-netlify-container/issues

ARG USERNAME=muir
ARG USER_UID=1838
ARG USER_GID=${USER_UID}

RUN apk update && apk upgrade && apk add \
  shadow \
  zola \
  && apk cache clean --purge

RUN groupadd --gid ${USER_GID} ${USERNAME} \
 && useradd --uid ${USER_UID} --gid ${USER_GID} --shell /bin/sh --create-home ${USERNAME} \
 && mkdir -p /etc/sudoers.d \
 && echo ${USERNAME} ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/${USERNAME} \
 && chmod 0440 /etc/sudoers.d/${USERNAME}

RUN npm install netlify-cli -g

USER ${USERNAME}
WORKDIR /site



USER root
