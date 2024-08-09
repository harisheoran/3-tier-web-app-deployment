FROM node:20.16.0-bookworm-slim AS build

WORKDIR /app

COPY --chown=node:node package.json .

RUN npm install --only=production

ENV PATH /app/node_modules/.bin:$PATH

COPY --chown=node:node . .

RUN npm run build

FROM nginx:1.27.0-alpine3.19 AS prod

COPY --from=build /app/dist /usr/share/nginx/html

RUN rm /etc/nginx/conf.d/default.conf

#COPY ./nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 3000

ENTRYPOINT ["nginx", "-g", "daemon off;"]