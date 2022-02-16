const db = require('../connectDB');

module.exports = {
    getAll:(callback) => { 
        return db.query("Select * from item",callback);
    },
    getAllOpen:(callback) => { 
        return db.query("SELECT * FROM item where disponivel=true",callback);
    },
    getAllOpenAdmin:(callback) => { 
        return db.query("SELECT nome,cod_item, nome_item, url, data_registro  FROM item inner join familia ON item.cod_Usuario=familia.cod_familia  where disponivel=1 UNION SELECT nome_escola, cod_item, nome_item, url, data_registro FROM item inner join escola ON item.cod_Usuario=escola.cod_escola where disponivel=1",callback);
    },
    getAllClose:(callback) => { 
        return db.query("SELECT nome,cod_item, nome_item, url, data_registro, descricao_item, cod_Usuario, data_doacao FROM item inner join familia ON item.cod_Usuario=familia.cod_familia AND item.disponivel=false UNION SELECT nome_escola, cod_item, nome_item, url, data_registro, descricao_item, cod_Usuario, data_doacao FROM item inner join escola ON item.cod_Usuario=escola.cod_escola where disponivel=false",callback);
    },
    getAllCloseWithoutUser:(callback) => { 
        return db.query("SELECT * FROM item where disponivel=false",callback);
    },
    getByCodigo:(nome_item,callback) => {
        return db.query("Select * from item where nome_item=?",[nome_item],callback);
    },

    add:( dt ,callback) => {
        return db.query("Insert into escola values(?,?,?,?)", [ dt.cod_familia, dt.email_familia, dt.nome,dt.sobrenome],callback);
    },
    delete:(cod_item,callback) => {
        return db.query("delete from item where cod_item=?",[cod_item],callback);
    },

    update:( dt ,callback ) => {
        return db.query("update familia set email_familia=?, nome=?, sobrenome=? where cod_familia=?", [ dt.email_familia, dt.nome,dt.sobrenome, dt.cod_familia], callback);
    },

    donateItem:( dt ,callback ) => {
        return db.query("UPDATE item set disponivel=0, data_doacao=? where cod_item=?", [ dt.data_doacao, dt.cod_item], callback);
    }
 
};

