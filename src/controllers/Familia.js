const db = require('../connectDB');

module.exports = {
    login:(dt, callback) => {
        return db.query("SELECT * FROM familia where email_familia=? AND senha=?", [dt.email_familia, dt.senha], callback);
    },
    getAll:(callback) => { 
        return db.query("Select * from familia inner join telefoneFamilia on familia.cod_familia = telefoneFamilia.cod_familia",callback);
    },

    getByCodigo:(cod_familia,callback) => {
        return db.query("Select * from familia inner join telefoneFamilia where cod_familia=?",[cod_familia],callback);
    },

    add:( dt ,callback) => {
        return db.query("call AddUser (?, ?, ?, ?, ?, ?)", [ dt.cod_familia, dt.nome, dt.sobrenome, dt.email_familia, ,dt.senha, dt.numero],callback);
    },
    delete:(cod_familia,callback) => {
        return db.query("delete from familia where cod_familia=?",[cod_familia],callback);
    },

    update:( dt ,callback ) => {
        return db.query("update familia set email_familia=?, nome=?, sobrenome=? where cod_familia=?", [ dt.email_familia, dt.nome,dt.sobrenome, dt.cod_familia], callback);
    }
 
};

