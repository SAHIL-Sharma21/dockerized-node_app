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
COPY index.js index.js

# run npm i to insatll node modules in our image 
RUN npm install

# running our app with below cmd as our entrypoint 
ENTRYPOINT [ "node", "index.js" ]