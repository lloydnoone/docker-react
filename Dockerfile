FROM node:alpine

WORKDIR '/app'

#updated to ./ instead of .
COPY package*.json ./
RUN npm install

# create built minified app
COPY . .
RUN npm run build
 
# copy built minified app into nginx
FROM nginx
EXPOSE 80
# cannot use named so 0 to refer to alpine instead
COPY --from=0 /app/build /usr/share/nginx/html