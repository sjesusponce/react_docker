FROM node:10.16.1-alpine as builder
WORKDIR '/app'
COPY /reactapp/package*.json ./
RUN npm install
COPY ./reactapp/ .
RUN npm run build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx