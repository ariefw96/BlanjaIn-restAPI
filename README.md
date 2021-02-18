# blanja-REST-API

- [About Project](#about-project)
- [Requirements](#requirements)
- [Getting started](#getting-started)
- [Related Project](#related-project)
- 
## About project

this project is a simple implementation of RESTful API using *framework* ExpressJS and MySQL *database* made for for <a href="blanja-proto.netlify.app">BlanjaIn</a> website

## Requirements

- npm [Node.js](https://nodejs.org/en/download/)
  

- ExpressJS,  MySQL, Morgan, Bcrypt, JWT, Fs, NodeMailer, OTP-Generator, Socket.io
  

```
npm install express mysql morgan bcrypt jsonwebtoken fs nodemailer otp-generator socket.io@2.3.0
```
**OR**
```
yarn add express mysql morgan bcrypt jsonwebtoken fs nodemailer otp-generator socket.io@2.3.0
```

## Getting started

### Installation

1. Clone repository
  
  ```
  git clone https://github.com/ariefw96/blanja-restAPI.git
  ```
  
2. Install dependencies from package.json
  
  - npm
    
  
  ```
  npm install
  ```
  
  - yarn
    
  
  ```
  yarn install
  ```
  
3. Config database, you can set the configuration according to config folder
  
  ```
  const conn = mysql.createConnection({
    host: process.env.MYSQL_HOST,
    user: process.env.MYSQL_USERNAME,
    password: process.env.MYSQL_PASSWORD,
    database: process.env.MYSQL_DATABASE
  });
  ```
4. .env example

  ```
  MYSQL_HOST = "host"
  MYSQL_USER = "username"
  MYSQL_PASSWORD = "password"
  MYSQL_DATABASE = "database"
  USER_EMAIL = your_smtp_email@mail.com
  PASS_EMAIL = your_password
  SECRET_KEY = "VERY_SECRET_KEY"
  ```
  
5. Dont forget to turn on server for MySQL database
6. Type `yarn start` or `npm start` to run this project
7. Happy coding!

## Related Project

Some Project that using this **restful-API**

React Native

[`BlanjaIn-React-Native`](https://github.com/ariefw96/BlanjaIn-React-Native)

React Js

[`BlanjaIn-ReactJs`](https://github.com/ariefw96/BlanjaIn-React)

For more information about documentation, check it out below ! 

[POSTMAN DOCUMENTATION](https://documenter.getpostman.com/view/13530339/TW76Cj2E)
