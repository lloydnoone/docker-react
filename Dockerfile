FROM node:alpine

WORKDIR '/app'

#updated to ./ instead of .
COPY package*.json ./
RUN npm install

COPY . .
RUN npm run build
 
FROM nginx
EXPOSE 80
# cannot use named so 0 to refer to alpine instead
COPY --from=0 /app/build /usr/share/nginx/html