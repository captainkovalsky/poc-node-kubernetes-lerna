FROM node:slim

WORKDIR /usr/src/app

COPY package*.json ./ 
COPY lerna.json ./ 
COPY ./api ./api 
COPY ./entrypoint.sh ./

RUN npm i -g lerna

# will be cached
RUN lerna bootstrap --hoist -- --production --no-optional

RUN chmod u+x ./entrypoint.sh

EXPOSE 8080
ENTRYPOINT [ "./entrypoint.sh" ]


