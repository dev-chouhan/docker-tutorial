# FROM ubuntu as build

# RUN apt-get update
# RUN apt-get install -y curl
# RUN curl -sL https://deb.nodesource.com/setup_18.x | bash -
# RUN apt-get upgrade -y
# RUN apt-get install -y nodejs

FROM node as build

WORKDIR /app
# Whatever code benith above line will be executed at this path "/app/" only

COPY package.json package.json
COPY package-lock.json package_lock.json

RUN cd app && npm install 
# If typescript, then 
RUN tsc -p . 

# COPY index.js index.js
# COPY . .





FROM node as runner

WORKDIR /app

COPY --from=build /app .

ENTRYPOINT [ "node", "index.js" ]


# Using multi-stage build