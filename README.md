> Web application code belongs to this [source](https://github.com/mohammad-taheri1/Book-Store-MERN-Stack)

# Deployment Architecture
![](./img/3-tier.drawio.svg)


---
# Let's start Deploying in Production
We are going to deploy 3 Tier Web application on AWS in production.

Tech Stack
- Frontend: React
- Backend: Node JS
- Database MongoDB

We are deploying this web app in container environment

### Table
- [Containerization]
- [Docker compose]
- [CI Pipeline]
- [CD Pipeline]

## Containerization

### Build Backend Image
We are using Node js in our backend.

```
FROM node:20.16.0-bookworm-slim

ENV NODE_ENV=production

WORKDIR /app

COPY --chown=node:node package.json .

RUN npm install --only=production

COPY --chown=node:node . .

EXPOSE 8000

USER node

CMD [ "node", "index.js" ]
```

- Use Node JS image with specfic tag in prod, don't use latest tag, as if latest tag is new and if a new bug found in latest image, it might break your prod.

- We are not using alpine image, as it contians musl implemenation of C library, if your app's operations need C libraries then it might behave different, use *booksworm* image with slim, it is lightweight in size.

- ENV NODE_ENV=production, it'll make 