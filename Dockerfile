FROM node:12
WORKDIR /usr/src/app
COPY package*.json ./
RUN npm install
COPY . .
EXPOSE 8007
CMD [ "node", "chat_server.js" ]
