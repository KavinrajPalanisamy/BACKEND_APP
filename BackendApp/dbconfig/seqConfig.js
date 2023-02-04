const Sequelize = require('sequelize');
const models = require('db_models');

const connection = new Sequelize(process.env.DB, process.env.USER, process.env.PASSWORD, {
    host: process.env.HOST,
    logging: false,
    timezone:"Asia/Kolkata",
    dialect: 'postgres',
    pool: {
        autocommit:false,
        max: 5,
        min: 0,
        acquire: 30000,
        idle: 10000
    }
});

connection.authenticate().then(() => {
    console.log('Connected to Database Successfully...!');
}).catch(err => {
    console.log('Error Connecting to Database : ' + err.message);
});

module.exports = connection;