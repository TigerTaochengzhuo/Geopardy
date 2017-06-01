var config = require('../config');
var mysql = require('mysql');

var database = {
    connection: null
};

database.connect = function() {
    this.connectionParams = config.database;
    
    if (!this.connectionParams) {
        this.connectionParams = {
            host: 'localhost',
            user: 'adedoyinfamuyiwa',
            password: '',
            database: 'geopardy'
        };
    }
    
    this.connection = mysql.createConnection(this.connectionParams);
    this.connection.connect();
}


exports = module.exports = database;