FROM node:10.16.1-alpine as builder
WORKDIR '/app'
COPY /reactapp/package*.json ./
RUN npm install
COPY . .
RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx