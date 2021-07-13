FROM node:lts-slim AS base
WORKDIR /app
COPY package.json /app
RUN npm install

FROM node:lts-slim as build
USER node
WORKDIR /app
COPY --chown=node:node --from=base /app/node_modules /app/node_modules
COPY --chown=node:node . /app
ARG REACT_APP_BASE_URL=""
RUN npm run build

FROM nginx:latest
COPY --from=build /app/build /usr/share/nginx/html
COPY --from=build /app/nginx/ /etc/nginx/templates
ENV NGINX_URL=http://localhost:5000
EXPOSE 3000