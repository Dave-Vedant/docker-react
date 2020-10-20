FROM node:alpine 
WORKDIR '/app'
COPY package*.json ./         
RUN npm install 
COPY . .
RUN  npm run build 

FROM nginx
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html 


# Explaination:
# here, first we take alpine as base image and make code to run build process (with basic flow)
# then, we take another nginx as second base image, and then copy the build image with dependency and copy to nginx server (code is taken from "https://hub.docker.com/_/nginx - hosting some simple static content")

#NOT: FROM FUTURE - update builder to 0 ,due to AWS proposed change. 
