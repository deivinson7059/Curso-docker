### STAGE 1: Build ###
FROM node:14-alpine as node-build-stage

WORKDIR /app

COPY package.json package-lock.json ./

RUN npm prune
RUN npm install

COPY . .

RUN npm run build:ssr


### STAGE 2: Run ###
FROM nginx:1.23-alpine

COPY ./resources/nginx/nginx.conf /etc/nginx/conf.d/default.conf

# Remove defaul nginx website
RUN rm -rf /usr/share/nginx/html/*

COPY --from=node-build-stage /app/dist/<proyecto/browser /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]
