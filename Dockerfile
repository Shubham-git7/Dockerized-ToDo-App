From node:15-alpine AS builder
WORKDIR /app
COPY . .
RUN npm install 

FROM node:15-alpine
WORKDIR /app
COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app /app

EXPOSE 3001
CMD ["node","todoServer.js"]
