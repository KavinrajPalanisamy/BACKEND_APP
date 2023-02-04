const {sequelize, DataTypes} = require("sequelize");

var schema = {
    sl_no: {
        type: DataTypes.NUMBER,
        primaryKey: true,
        allowNull: true
    },
    file_data: {
        type: DataTypes.BLOB,
        allowNull: true
    },
    file_usage: {
        type: DataTypes.STRING,
        allowNull: true
    },
    created_date: {
        type: DataTypes.DATE,
        allowNull: true
    },
    file_type: {
        type: DataTypes.STRING,
        allowNull: true
    },
    file_name: {
        type: DataTypes.STRING,
        allowNull: true
    },
    file_size: {
        type: DataTypes.STRING,
        allowNull: true
    },
    file_extension: {
        type: DataTypes.STRING,
        allowNull: true
    }
}

module.exports.schema = schema;