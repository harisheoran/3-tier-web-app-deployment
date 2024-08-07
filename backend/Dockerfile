FROM node:20.16.0-bookworm-slim

ENV NODE_ENV=production

WORKDIR /app

COPY --chown=node:node package.json .

RUN npm install --only=production

COPY --chown=node:node . .

EXPOSE 8000

USER node
CMD [ "node", "index.js" ]