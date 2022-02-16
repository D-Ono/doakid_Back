const db = require('../connectDB');

module.exports = {
    getAll:(callback) => { 
        return db.query("Select * from item inner join brinquedo ON brinquedo.cod_item = item.cod_item",callback);
    },

    getByCodigo:(dt,callback) => {
        return db.query("Select * from item inner join brinquedo where item.cod_item=? AND brinquedo.cod_brinquedo=?",[dt.cod_item, dt.cod_brinquedo],callback);
    },

    add:( dt ,callback) => {
        return db.query("call AddToys (?, ?, ?, ?, ?, ?, ?, ?);", [ dt.codigoItem, dt.nome, dt.url,dt.descricao, dt.data, dt.codigoGeral, dt.info, dt.cod_Usuario],callback);
    },
    delete:(cod_item,callback) => {
        return db.query("delete item, livro from item inner join livro where item.cod_item=livro.cod_item",[cod_item],callback);
    }/*,
    update:( dt ,callback ) => {
        return db.query("update livro set email_familia=?, nome=?, sobrenome=? where cod_item=?", [ dt.email_familia, dt.nome,dt.sobrenome, dt.cod_familia], callback);
    }*/
 
};

