const { sequelize, DataTypes } = require("sequelize");

var schema = {
    user_id: {
        type: DataTypes.STRING,
        primaryKey: true,
        allowNull: true
    },
    email: {
        type: DataTypes.STRING,
        primaryKey: true,
        allowNull: true
    },
    session_token: {
        type: DataTypes.STRING,
        primaryKey: true,
        allowNull: true
    },
    created_time: {
        type: DataTypes.DATE,
        allowNull: true
    }
}

module.exports.schema = schema;