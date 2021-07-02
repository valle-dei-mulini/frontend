FROM node:lts-slim AS build
WORKDIR /app
COPY package.json /app
RUN npm install

FROM node:lts-slim
ENV REACT_APP_BASE_URL=http://localhost:5000
ENV NODE_ENV development
USER node
WORKDIR /app
COPY --chown=node:node --from=build /app/node_modules /app/node_modules
COPY --chown=node:node . /app
EXPOSE 3000
CMD npm start