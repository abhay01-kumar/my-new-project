FROM node:20-alpine

WORKDIR /app

LABEL org.opencontainers.image.title="my-new-project"
LABEL org.opencontainers.image.description="Express backend container image for Jenkins and CI/CD demos"

COPY package*.json ./

RUN npm install --omit=dev

COPY . .

ENV PORT=3000

EXPOSE 3000

CMD ["node", "index.js"]
