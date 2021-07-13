FROM node:lts-slim AS base
WORKDIR /app
COPY package.json /app
RUN npm install

FROM node:lts-slim as build
USER node
WORKDIR /app
COPY --chown=node:node --from=base /app/node_modules /app/node_modules
COPY --chown=node:node . /app
RUN npm run build

FROM nginx:stable-alpine
ENV REACT_APP_BASE_URL=http://localhost:5000
RUN rm -rf /etc/nginx/conf.d/default.conf
COPY --from=build /app/build /usr/share/nginx/html
COPY --from=build /app/nginx/nginx.conf /etc/nginx/conf.d
EXPOSE 3000