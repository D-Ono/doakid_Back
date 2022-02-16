const db = require('../connectDB');

module.exports = {
    login:(dt, callback) => {
        return db.query("SELECT * FROM escola where email_escola=? AND senha=?", [dt.email_escola, dt.senha], callback);
    },
    getAll:(callback) => { 
        return db.query("Select * from escola inner join telefoneEscola ON escola.cod_escola=telefoneEscola.cod_escola",callback);
    },

    getByCodigo:(cod_escola,callback) => {
        return db.query("Select * from escola, telefoneEscola where telefoneEscola.cod_escola=? AND escola.cod_escola=?",[cod_escola, cod_escola],callback);
    },

    add:( dt ,callback) => {
        return db.query("call AddSchool (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [dt.codigoEscola, dt.nome, dt.email, dt.senha, dt.rua_escolas, dt.numero_rua, dt.bairro, dt.inicio, dt.fim, dt.numeroTelefone] ,callback);
    },
    delete:(cod_escola,callback) => {
        return db.query("call deleteSchool (?) ",[cod_escola],callback);
    },

    update:( dt ,callback ) => {
        return db.query("call UpdateSchool (?, ?, ?, ?, ?, ?, ?, ?, ?)",[dt.nome_escola, dt.email_escola, dt.rua_escola, dt.numero_rua, dt.bairro_escola, dt.horario_funcionamento_inicio, dt.horario_funcionamento_fim, dt.userCode, dt.numero], callback)
    }
 
};

