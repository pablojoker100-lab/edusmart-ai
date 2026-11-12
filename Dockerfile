
FROM node:22-alpine

WORKDIR /app

RUN apk add --no-cache unzip

COPY EduSmart-AI-deployment-ready.zip /tmp/project.zip

RUN unzip -q /tmp/project.zip -d /app \
    && rm /tmp/project.zip

RUN npm install --include=dev --no-audit --no-fund

RUN npm run build

ENV NODE_ENV=production

EXPOSE 3000

CMD ["npm", "run", "start"]
