FROM --platform=linux/arm64 node:current
WORKDIR /opt
ADD . /opt
RUN npm install
ENTRYPOINT npm run start
