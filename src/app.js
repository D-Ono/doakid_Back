const express = require('express');
const cors = require('cors');
const app = express();
const routes = require('./routes');

app.use(express.json());

app.use((req, res, next) => {
    app.use(cors());
    next();
  });
//app.use(cors());
//app.use('/item', escolas);
app.use(routes);

module.exports = app;