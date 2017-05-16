var mysql = require('mysql');

var database = {
    connection: null
};

database.connect = function() {
    this.connection = mysql.createConnection({
        host: 'localhost',
        user: 'adedoyinfamuyiwa',
        password: '',
        database: 'geopardy'
    });
    this.connection.connect();
}


exports = module.exports = database;