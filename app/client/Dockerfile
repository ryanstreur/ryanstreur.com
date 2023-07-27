####
# Stage 1: build site
FROM node:20

WORKDIR /client

COPY . .

RUN npm install
RUN npm run build

VOLUME /client/dist

####
# Stage 2: serve static site with nginx
# https://hub.docker.com/_/nginx/
# FROM nginx
# COPY --from=0 /client/dist /usr/share/nginx/html

# EXPOSE 80