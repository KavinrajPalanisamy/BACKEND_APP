const Sequelize = require('sequelize');

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
    console.log('Models to Database Successfully...!');
}).catch(err => {
    console.log('Error Models Connecting to Database : ' + err.message);
});

module.exports = connection;