const db = require('../connectDB');

module.exports = {
    getAll:(callback) => { 
        return db.query("Select * from familia inner join telefoneFamilia",callback);
    },

    getByCodigo:(cod_familia,callback) => {
        return db.query("Select * from familia inner join telefoneFamilia where cod_familia=?",[cod_familia],callback);
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

