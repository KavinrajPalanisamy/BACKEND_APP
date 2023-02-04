const {sequelize, DataTypes} = require("sequelize");

var schema = {
    user_id: {
        type: DataTypes.STRING,
        primaryKey: true,
        allowNull: false
    },
    password: {
        type: DataTypes.STRING,
        allowNull: false
    },
    email_id: {
        type: DataTypes.STRING,
        primaryKey: true,
        allowNull: false
    },
    last_signed_in: {
        type: DataTypes.DATE,
        allowNull: true
    },
    last_sign_out: {
        type: DataTypes.DATE,
        allowNull: true
    },
    invalid_attempts: {
        type: DataTypes.NUMBER,
        allowNull: true
    },
    password_old_1: {
        type: DataTypes.STRING,
        allowNull: true
    },
    password_old_2: {
        type: DataTypes.STRING,
        allowNull: true
    },
    last_modified_password: {
        type: DataTypes.DATE,
        allowNull: true
    },
    created_date: {
        type: DataTypes.DATE,
        allowNull: true
    },
    mobile_number: {
        type: DataTypes.STRING,
        allowNull: true
    },
    is_active: {
        type: DataTypes.CHAR(1),
        allowNull: true
    }
}

module.exports.schema = schema;