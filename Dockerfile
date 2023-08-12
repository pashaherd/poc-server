#Set node base image
FROM node:16

#Set working directory to /app
WORKDIR /app

#Copy json files to cwd
COPY package*.json ./ 

#Install dependencies
RUN npm install

#Copy source code to cwd except local node_modules defined in dockerignore 
COPY . .

#Change mode execute waitforit
RUN chmod +x wait-for-it.sh

#Expose port
EXPOSE 8080

#Command to run
CMD npm start

