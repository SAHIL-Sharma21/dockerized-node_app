# choosing baseImage as ubuntu 
FROM ubuntu

# instaling nodejs and curl o our image 
RUN apt-get update
RUN apt-get install -y curl
RUN curl -sL https://deb.nodesource.com/setup_18.x | bash -
RUN apt-get upgrade -y
RUN apt-get install -y nodejs

# copying our local code to in image s source and destination 
COPY package.json package.json
COPY package-lock.json package-lock.json

# run npm i to insatll node modules in our image >> when there is change in package.json or package-lock.json
RUN npm install

COPY index.js index.js
#we can also use copy . . if we have bigger files


# running our app with below cmd as our entrypoint 
ENTRYPOINT [ "node", "index.js" ]