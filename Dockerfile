# docker build -t reecepbcups/justjoe-app:0.0.1 .
# docker run --rm --name=justjoe-app -p 6001:6001 reecepbcups/justjoe-app:0.0.1

FROM node:19-alpine AS build

WORKDIR /app

COPY package.json ./
COPY package-lock.json ./

RUN npm install
COPY . ./
RUN npm run build

# FROM nginx:1.19-alpine
# COPY --from=build /app/public /usr/share/nginx/html

#  run npm rum preview
ENTRYPOINT [ "npm", "run", "preview" ]