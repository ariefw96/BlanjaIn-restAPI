# blanja-REST-API
## About project

this project is a simple implementation of RESTful API using *framework* ExpressJS and mySQL *database* made for for [Blanja](blanja-proto.netlify.app) website

## Requirements

- npm [Node.js](https://nodejs.org/en/download/)
  

- ExpressJS,  MySQL, Morgan
  

```
npm install express mysql morgan
```

## Getting started

### Installation

1. Clone repository
  
  ```
  git clone https://github.com/ariefw96/blanja-restAPI-backup
  ```
  
2. Install additional package
  
  - npm
    
  
  ```
  npm install
  ```
  
  - yarn
    
  
  ```
  yarn add
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
/api/product/delete:id
```

POSTMAN DOCUMENTATION 
[here](https://documenter.getpostman.com/view/13530339/TVmS9G4V)
