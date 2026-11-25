FROM node:18-alpine

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install --omit=dev

COPY . .

ENV PORT=3000
ENV STATIC_DIR="./client"

EXPOSE 3000

CMD ["node", "server.js"]