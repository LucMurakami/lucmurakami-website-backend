FROM node:12-alpine

WORKDIR /app

ENV PATH /app/node_modles/.bin:$PATH

COPY package.json ./
COPY yarn.lock ./
RUN yarn install
RUN yarn install react-scripts@3.4.1 -g

COPY . ./

CMD ["yarn", "start"]