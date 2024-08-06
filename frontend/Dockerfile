FROM node:20.16.0-bookworm-slim AS build

ENV NODE_ENV=production

WORKDIR /app

COPY --chown=node:node package.json .

RUN npm install --only=production

COPY --chown=node:node . .

EXPOSE 3000

CMD [ "npm", "run", "dev" ]

##FROM nginx:1.27.0-alpine3.19 AS prod

##COPY ./nginx.conf /etc/nginx/conf.d/default.conf
##COPY --from=build /app/dist /var/www/html/

##EXPOSE 3000

##ENTRYPOINT ["nginx", "-g", "daemon off;"]