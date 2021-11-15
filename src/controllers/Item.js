const db = require('../connectDB');

module.exports = {
    getAll:(callback) => { 
        return db.query("Select * from item",callback);
    },

    getByCodigo:(nome_item,callback) => {
        return db.query("Select * from item where nome_item=?",[nome_item],callback);
    },

    add:( dt ,callback) => {
        return db.query("Insert into escola values(?,?,?,?)", [ dt.cod_familia, dt.email_familia, dt.nome,dt.sobrenome],callback);
    },
    delete:(cod_familia,callback) => {
        return db.query("delete from familia where cod_familia=?",[cod_familia],callback);
    },

    update:( dt ,callback ) => {
        return db.query("update familia set email_familia=?, nome=?, sobrenome=? where cod_familia=?", [ dt.email_familia, dt.nome,dt.sobrenome, dt.cod_familia], callback);
    }
 
};

