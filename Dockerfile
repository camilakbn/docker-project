FROM node

WORKDIR /app

COPY . .

RUN npm ci

RUN npm install newman

RUN npm run server &

CMD ["npm", "run", "test:api"]