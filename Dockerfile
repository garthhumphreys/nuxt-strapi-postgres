# Dockerfile
FROM node:12.20.2-alpine as base

WORKDIR /app

COPY package*.json /
EXPOSE 3000

FROM base as production
ENV NODE_ENV=production
RUN yarn install --frozen-lockfile --ignore-engines
COPY . /
CMD [ "yarn", "start" ]

FROM base as dev
ENV NODE_ENV=development
RUN yarn install --ignore-engines
COPY . /
CMD [ "yarn", "dev" ]