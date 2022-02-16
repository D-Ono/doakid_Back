const db = require('../connectDB');

module.exports = {
    getAll:(callback) => { 
        return db.query("Select * from roupa inner join item ON roupa.cod_item = item.cod_item",callback);
    },

    getByCodigo:(dt,callback) => {
        return db.query("Select * from item inner join roupa where item.cod_item=? AND roupa.cod_roupa=?",[dt.cod_item, dt.cod_roupa],callback);
    },

    add:( dt ,callback) => {
        return db.query("call AddClothes (?, ?, ?, ?, ?, ?, ?, ?)", [ dt.codigoGeral, dt.nome, dt.url,dt.descricao, dt.data, dt.codigoItem, dt.info, dt.cod_Usuario],callback);
    },
    delete:(cod_item,callback) => {
        return db.query("delete from roupa where cod_item=?",[cod_item],callback);
    },

    update:( dt ,callback ) => {
        return db.query("update roupa set email_familia=?, nome=?, sobrenome=? where cod_item=?", [ dt.email_familia, dt.nome,dt.sobrenome, dt.cod_familia], callback);
    }
 
};

