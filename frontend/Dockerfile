# build
FROM node:12-alpine AS build
WORKDIR /app
COPY package*.json ./
RUN npm install --silent
RUN npm install --silent rxjs@6.3.3 rxjs-compat@6.3.3 --no-save
COPY . .
RUN npm run build -- --aot=false --build-optimizer=false

# runtime
FROM nginx:1.27-alpine
RUN rm -rf /usr/share/nginx/html && mkdir -p /usr/share/nginx/html
COPY --from=build /app/dist/frontend/ /usr/share/nginx/html
EXPOSE 80
CMD ["nginx","-g","daemon off;"]