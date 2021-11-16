const express = require('express');
const routes = express.Router();
const Escola = require('./controllers/Escola');
const Familia = require('./controllers/Familia');
const Item = require('./controllers/Item');
const Livro = require('./controllers/Livro');
const Brinquedo = require('./controllers/Brinquedo');
const Fralda = require('./controllers/Fralda');
const Roupa = require('./controllers/Roupa');
const Sapato = require('./controllers/Sapato');

routes.get('/', (req, res) => {
  res.setHeader('Access-Control-Allow-Origin', '*');
  return res.status(200).json('Rota inicial');
});

/***************************************************************************/
/***************************       ESCOLA      *****************************/
/***************************************************************************/

routes.post('/escola/login', (req, res) => {
    Escola.login(req.body,(err, rows) => {
        if (err) {
            res.json(err);
        }
        else {
            res.json(rows);
        }
    });
});

routes.get('/escola/list', (req, res) => {
  if(!req.body.cod_escola){
      Escola.getAll((err, rows) => {
          if (err) {
              res.json(err);
          }
          else {
              res.json(rows);
          }
      });
  }else {
        Escola.getByCodigo(req.body.cod_escola, (err, rows) => {
            if (err) {
                res.json(err);
            }
            else {
                res.json(rows);
            }
        });
  }
});

routes.post('/escola/create', (req, res, next) => {
    Escola.add(req.body, (err) => {
        if (err) {
            res.json(err);
        }
        else {
            res.json(req.body);
        }
    });
});

routes.delete('/escola/delete', (req, res, next) => {
    Escola.delete(req.body.cod_escola, (err, count) => {
        if (err) {
            res.json(err);
        }
        else {
            res.json(count);
        }
    });
});

routes.put('/escola/update', (req, res, next) => {
    Escola.update( req.body, (err, rows) => {
        if (err) {
            res.json(err);
        }
        else {
            res.json(rows);
        }
    });
});

/***************************************************************************/
/***************************       FAMILIA      ****************************/
/***************************************************************************/
routes.get('/familia/list', (req, res) => {
  if(!req.body.cod_familia){
      Familia.getAll((err, rows) => {
          if (err) {
              res.json(err);
          }
          else {
              res.json(rows);
          }
      });
  }else {
      Familia.getByCodigo(req.body.cod_familia, (err, rows) => {
          if (err) {
              res.json(err);
          }
          else {
              res.json(rows);
          }
      });
  }
});

routes.post('/familia/create', (req, res, next) => {
  Familia.add(req.body, (err) => {
      if (err) {
          res.json(err);
      }
      else {
          res.json(req.body);
      }
  });
});

routes.delete('/familia/delete', (req, res, next) => {
  Familia.delete(req.query.cod_familia, (err, count) => {
      if (err) {
          res.json(err);
      }
      else {
          res.json(count);
      }
  });
});

routes.put('/familia/update', (req, res, next) => {
  Familia.update( req.body, (err, rows) => {
      if (err) {
          res.json(err);
      }
      else {
          res.json(rows);
      }
  });
});

/***************************************************************************/
/****************************       ITEM      *****************************/
/***************************************************************************/

routes.get('/item/list', (req, res) => {
    if(!req.body.cod_item){
        Item.getAll((err, rows) => {
            if (err) {
                res.json(err);
            }
            else {
                res.json(rows);
            }
        });
    }else {
        Item.getByCodigo(req.body.cod_item, (err, rows) => {
            if (err) {
                res.json(err);
            }
            else {
                res.json(rows);
            }
        });
    }
  });
  
  routes.post('/item/create', (req, res, next) => {
    Item.add(req.body, (err) => {
        if (err) {
            res.json(err);
        }
        else {
            res.json(req.body);
        }
    });
  });
  
  routes.put('/item/update', (req, res, next) => {
    Item.update( req.body, (err, rows) => {
        if (err) {
            res.json(err);
        }
        else {
            res.json(rows);
        }
    });
  });


/***************************************************************************/
/****************************       LIVRO      *****************************/
/***************************************************************************/

routes.get('/livro/list', (req, res) => {
    if(!req.body.cod_item){
        Livro.getAll((err, rows) => {
            if (err) {
                res.json(err);
            }
            else {
                res.json(rows);
            }
        });
    }else {
        Livro.getByCodigo(req.body, (err, rows) => {
            if (err) {
                res.json(err);
            }
            else {
                res.json(rows);
            }
        });
    }
  });
  
  routes.post('/livro/create', (req, res, next) => {
    Livro.add(req.body, (err) => {
        if (err) {
            res.json(err);
        }
        else {
            res.json(req.body);
        }
    });
  });
  
  routes.delete('/livro/delete', (req, res, next) => {
    Livro.delete(req.query.cod_item, (err, count) => {
        if (err) {
            res.json(err);
        }
        else {
            res.json(count);
        }
    });
  });
  
  routes.put('/livro/update', (req, res, next) => {
    Livro.update( req.body, (err, rows) => {
        if (err) {
            res.json(err);
        }
        else {
            res.json(rows);
        }
    });
  });

/***************************************************************************/
/*************************       BRINQUEDO      ****************************/
/***************************************************************************/

routes.get('/brinquedo/list', (req, res) => {
    if(!req.body.cod_item){
        Brinquedo.getAll((err, rows) => {
            if (err) {
                res.json(err);
            }
            else {
                res.json(rows);
            }
        });
    }else {
        Brinquedo.getByCodigo(req.body.cod_item, (err, rows) => {
            if (err) {
                res.json(err);
            }
            else {
                res.json(rows);
            }
        });
    }
  });
  
  routes.post('/brinquedo/create', (req, res, next) => {
    Brinquedo.add(req.body, (err) => {
        if (err) {
            res.json(err);
        }
        else {
            res.json(req.body);
        }
    });
  });
  
  routes.delete('/brinquedo/delete', (req, res, next) => {
    Brinquedo.delete(req.query.cod_item, (err, count) => {
        if (err) {
            res.json(err);
        }
        else {
            res.json(count);
        }
    });
  });
  
  routes.put('/brinquedo/update', (req, res, next) => {
    Brinquedo.update( req.body, (err, rows) => {
        if (err) {
            res.json(err);
        }
        else {
            res.json(rows);
        }
    });
  });

/***************************************************************************/
/****************************       FRALDA      ****************************/
/***************************************************************************/

routes.get('/fralda/list', (req, res) => {
    if(!req.body.cod_item){
        Fralda.getAll((err, rows) => {
            if (err) {
                res.json(err);
            }
            else {
                res.json(rows);
            }
        });
    }else {
        Fralda.getByCodigo(req.body.cod_item, (err, rows) => {
            if (err) {
                res.json(err);
            }
            else {
                res.json(rows);
            }
        });
    }
  });
  
  routes.post('/fralda/create', (req, res, next) => {
    Fralda.add(req.body, (err) => {
        if (err) {
            res.json(err);
        }
        else {
            res.json(req.body);
        }
    });
  });
  
  routes.delete('/fralda/delete', (req, res, next) => {
    Fralda.delete(req.query.cod_item, (err, count) => {
        if (err) {
            res.json(err);
        }
        else {
            res.json(count);
        }
    });
  });
  
  routes.put('/fralda/update', (req, res, next) => {
    Fralda.update( req.body, (err, rows) => {
        if (err) {
            res.json(err);
        }
        else {
            res.json(rows);
        }
    });
  });

/***************************************************************************/
/****************************       ROUPA      *****************************/
/***************************************************************************/

routes.get('/roupa/list', (req, res) => {
    if(!req.body.cod_item){
        Roupa.getAll((err, rows) => {
            if (err) {
                res.json(err);
            }
            else {
                res.json(rows);
            }
        });
    }else {
        Roupa.getByCodigo(req.body.cod_item, (err, rows) => {
            if (err) {
                res.json(err);
            }
            else {
                res.json(rows);
            }
        });
    }
});
  
routes.post('/roupa/create', (req, res, next) => {
Roupa.add(req.body, (err) => {
    if (err) {
        res.json(err);
    }
    else {
        res.json(req.body);
    }
});
});
  
routes.delete('/roupa/delete', (req, res, next) => {
    Roupa.delete(req.query.cod_item, (err, count) => {
        if (err) {
            res.json(err);
        }
        else {
            res.json(count);
        }
    });
});
  
  routes.put('/roupa/update', (req, res, next) => {
        Roupa.update( req.body, (err, rows) => {
            if (err) {
                res.json(err);
            }
            else {
                res.json(rows);
            }
        });
  });

/***************************************************************************/
/***************************       SAPATO      *****************************/
/***************************************************************************/

routes.get('/sapato/list', (req, res) => {
    if(!req.body.cod_item){
        Sapato.getAll((err, rows) => {
            if (err) {
                res.json(err);
            }
            else {
                res.json(rows);
            }
        });
    }else {
        Sapato.getByCodigo(req.body.cod_item, (err, rows) => {
            if (err) {
                res.json(err);
            }
            else {
                res.json(rows);
            }
        });
    }
  });
  
  routes.post('/sapato/create', (req, res, next) => {
    Sapato.add(req.body, (err) => {
        if (err) {
            res.json(err);
        }
        else {
            res.json(req.body);
        }
    });
  });
  
  routes.delete('/sapato/delete', (req, res, next) => {
    Sapato.delete(req.query.cod_item, (err, count) => {
        if (err) {
            res.json(err);
        }
        else {
            res.json(count);
        }
    });
  });
  
  routes.put('/sapato/update', (req, res, next) => {
    Sapato.update( req.body, (err, rows) => {
        if (err) {
            res.json(err);
        }
        else {
            res.json(rows);
        }
    });
  });


module.exports = routes;