FROM node:14

# everything is executed from the workdir
WORKDIR /app

COPY package.json /app

# install all dependencies during build
# RUN npm install

COPY . .

ENV PORT 80


EXPOSE $PORT

# executes when docker run is called
CMD ["npm", "start"]

