# blanja-REST-API
## About project

this project is a simple implementation of RESTful API using *framework* ExpressJS and mySQL *database* made for for [Blanja](blanja-proto.netlify.app) website

## Requirements

- npm [Node.js](https://nodejs.org/en/download/)
  

- ExpressJS,  MySQL, Morgan, Bcrypt, JWT, Fs, NodeMailer, OTP-Generator, Socket.io
  

```
npm install express mysql morgan bcrypt jsonwebtoken fs nodemailer otp-generator socket.io@2.3.0
```

## Getting started

### Installation

1. Clone repository
  
  ```
  git clone https://github.com/ariefw96/blanja-restAPI-backup
  ```
  
2. Install package from package.json
  
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
    host: process.env.HOST,
    user: process.env.USERNAME,
    password: process.env.PASSWORD,
    database: process.env.DATABASE
  });
  ```
4. .env example
  ``
  MYSQL_HOST = "host"
  MYSQL_USER = "username"
  MYSQL_PASSWORD = "password"
  MYSQL_DATABASE = "database"
  USER_EMAIL = your_smtp_email@mail.com
  PASS_EMAIL = your_password
  SECRET_KEY = "VERY_SECRET_KEY"
  ``
  

### Endpoint scheme <STILL UPDATED>

- get all product

```js
GET
/api/products
```

- get product by ID

```js
GET
/api/product/:id
```

- add new product

```js
POST
/api/product/add-product
/api/product/add-stock
```

- edit product

```js
PATCH
/api/product/update/:id
```

- delete product

```js
DELETE
/api/product/delete/:id
```

POSTMAN DOCUMENTATION 
[here](https://documenter.getpostman.com/view/13530339/TVmS9G4V)
