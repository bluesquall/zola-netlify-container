FROM node:22-alpine
MAINTAINER https://github.com/bluesquall/zola-netlify-container/issues

RUN apk update && apk upgrade && apk add \
  shadow \
  zola \
  && apk cache clean --purge

RUN npm install netlify-cli -g

WORKDIR /site
