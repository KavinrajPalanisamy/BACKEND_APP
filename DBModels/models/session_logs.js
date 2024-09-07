const { sequelize, DataTypes } = require("sequelize");

var schema = {
    user_id: {
        type: DataTypes.STRING,
        primaryKey: true,
        allowNull: false
    },
    email: {
        type: DataTypes.STRING,
        primaryKey: true,
        allowNull: false
    },
    session_id: {
        type: DataTypes.NUMBER,
        primaryKey: true,
        allowNull: false
    },
    session_token: {
        type: DataTypes.STRING,
        allowNull: true
    },
    created_time: {
        type: DataTypes.DATE,
        allowNull: true
    },
    updated_time: {
        type: DataTypes.DATE,
        allowNull: true
    },
    login_time: {
        type: DataTypes.DATE,
        allowNull: true
    },
    logout_time: {
        type: DataTypes.DATE,
        allowNull: true
    },
    session_active: {
        type: DataTypes.CHAR(1),
        allowNull: true
    },
    device: {
        type: DataTypes.STRING,
        allowNull: true
    },
    platform: {
        type: DataTypes.STRING,
        allowNull: true
    }
}

module.exports.schema = schema;