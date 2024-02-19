FROM node:18

COPY --from=localhost:5000/my-nodejs-base-image /instana /instana
ENV NODE_OPTIONS="--require /instana/node_modules/@instana/collector/src/immediate"

WORKDIR /usr/src/app
COPY app ./
RUN npm install
EXPOSE 3001

CMD ["node", "server.js"]