FROM node:13-alpine as builder

WORKDIR /app

COPY package.json .
RUN npm install

COPY . .

RUN npm run build

# Second step

FROM nginx

COPY --from=builder /app/build /usr/share/nginx/html