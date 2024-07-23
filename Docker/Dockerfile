
FROM node:18 AS builder
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
ARG ENV=dev
RUN npm run build:$ENV
FROM nginx:alpine
COPY --from=builder /app/dist/$ENV /usr/share/nginx/html
CMD ["nginx", "-g", "daemon off;"]
