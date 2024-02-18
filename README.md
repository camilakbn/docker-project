Steps:

- Create a folder with a name you want;
- Open terminal on folder;
- Type: 'npm init -y' to create the package.json file;
- Open folder with VSCode;
- Open terminal on VSCode and type 'npm i json-server', this will create a package-lock.json file;
- Add any packages dependencies you will use on your project by typing on terminal, example: 'npm install jest --save-dev', this will create a node_modules folder;
- Create an API (db.json);
- On the VSCode terminal, type npx json-server --watch db.json', to create the API;
- Change script specifications on package.json to:   
  "scripts": {
    "server":"json-server --watch db.json --host 0.0.0.0 --port 80",
    "test": "echo \"Error: no test specified\" && exit 1"
  },;
- On the VSCode terminal, type 'npm run server', to run the API;

- Create a Dockerfile (to create an image);
- On VSCode terminal, type 'docker pull node', to download the image you are going to use on the project (you can also download any image you want, not only node);
- Finish creating the Dockerfile;

- To run the server, type 'npm run server';
- To build and name the image, type 'docker build . -t ImageName';
- To see the images name, type 'docker images';
- To run the image, type 'docker run -d ImageName;
- To map the 80 door from the computer to the container, type 'docker run -d -p 80:80 ImageName';

- Do tests on Postman with this API;

- Then, install newman on the VSCode terminal, typing 'npm install newman', and if you wish to install newman on your computer, type 'npm install -g newman;
- On postman, export your collection and your environment to the project folder;
- To run newman on your terminal, type 'newman run YourCollection.json -e YourEnvironment.json';

- Change script specifications on package.json to:   
  "scripts": {
    "server":"json-server --watch db.json",
    "test:api": "newman run products.postman_collection.json -e local.postman_environment.json"
  },;
- Changes Dockerfile specifications to:
FROM node

WORKDIR /app

COPY . .

RUN npm ci

RUN npm install newman

RUN npm run server &

CMD ["npm", "run", "test:api"]

- Create a github repository and push your project to the repository;
- Create a Node.js on Github Actions with the following specifications: 