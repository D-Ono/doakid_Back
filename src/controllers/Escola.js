const db = require('../connectDB');

module.exports = {
    getAll:(callback) => { 
        return db.query("Select * from escola inner join telefoneEscola",callback);
    },

    getByCodigo:(cod_escola,callback) => {
        return db.query("Select * from escola inner join telefoneEscola where cod_escola=?",[cod_escola],callback);
    },

    add:( dt ,callback) => {
        db.query("Insert into telefoneEscola values(?,?)", [ dt.numero, dt.cod_escola],callback);
        db.query("Insert into escola values(?,?,?,?,?,?,?,?)", [ dt.cod_escola, dt.nome_escola, dt.email_escola,dt.rua_escola, dt.numero_rua, dt.bairro_escola, dt.horario_funcionamento_inicio, dt.horario_funcionamento_fim],callback);
        return 1;
    },
    delete:(cod_escola,callback) => {
        return db.query("delete telefoneEscola, escola from escola INNER JOIN telefoneEscola where telefoneEscola.cod_escola= escola.cod_escola",[cod_escola],callback);
    },

    update:( dt ,callback ) => {
        db.query("update telefoneEscola set numero=? where cod_escola=?", [ dt.numero, dt.cod_escola], callback);
        db.query("update escola set nome_escola=?, email_escola=?, rua_escola=?, numero_rua=?, bairro_escola=?, horario_funcionamento_inicio=?, horario_funcionamento_fim=? where cod_escola=?", [ dt.nome_escola, dt.email_escola,dt.rua_escola, dt.numero_rua, dt.bairro_escola, dt.horario_funcionamento_inicio, dt.horario_funcionamento_fim, dt.cod_escola], callback);
    }
 
};

