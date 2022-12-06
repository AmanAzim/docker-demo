FROM node:13-alpine
# name of the main image the server is based on in this case node:13-alpin. It will install nodeJs inside the image so when we build this image into container and open a terminal there we will be able to run nodeJs commands

ENV MONGO_DB_USERNAME=admin \
    MONGO_DB_PWD=password
# env can be define here but not recomended because in case we update the env the image needs to be rebuild but if we have env in side docker-compose then updating env will be just overwritting.

RUN mkdir -p /home/app
# Linux command: This will create directories home > app inside this docker container.

COPY ./app /home/app
# Linux command: This command actually runs on the host itself not inside the container and copies everything from the root "./app" => "/home/app" inside the container

WORKDIR /home/app
# set default dir so that next commands executes in /home/app dir

RUN npm install
# will execute npm install in /home/app because of WORKDIR

CMD ["node", "/home/app/server.js"]
# Entry Point command: This will execute the nodeJs command (avaialble due to node:13-alpine) "node server.js" to start the server. need for /home/app/server.js because of WORKDIR
