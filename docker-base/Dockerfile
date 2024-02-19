FROM node:18 AS my-nodejs-base-image

WORKDIR /instana

COPY package.json ./

# install the collector
RUN npm install