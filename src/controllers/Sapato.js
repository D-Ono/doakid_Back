const db = require('../connectDB');

module.exports = {
    getAll:(callback) => { 
        return db.query("Select * from item inner join sapato ON sapato.cod_item = item.cod_item",callback);
    },

    getByCodigo:(dt,callback) => {
        return db.query("Select * from item inner join sapato where item.cod_item=? AND sapato.cod_sapato=?",[dt.cod_item, dt.cod_sapato],callback);
    },

    add:( dt ,callback) => {
        return db.query("Insert into livro values(?,?,?,?)", [ dt.cod_item, dt.email_familia, dt.nome,dt.sobrenome],callback);
    },
    delete:(cod_item,callback) => {
        return db.query("delete from livro where cod_item=?",[cod_item],callback);
    },

    update:( dt ,callback ) => {
        return db.query("update livro set email_familia=?, nome=?, sobrenome=? where cod_item=?", [ dt.email_familia, dt.nome,dt.sobrenome, dt.cod_familia], callback);
    }
 
};

