const { sequelize, DataTypes } = require("sequelize");

var schema = {
    ref_no: {
        type: DataTypes.NUMBER,
        primaryKey: true,
        allowNull: true
    },
    email: {
        type: DataTypes.STRING,
        primaryKey: true,
        allowNull: true
    },
    image_type: {
        type: DataTypes.CHAR(1),
        primaryKey: true,
        allowNull: true
    },
    content_type: {
        type: DataTypes.STRING,
        allowNull: true
    },
    file_content: {
        type: DataTypes.BLOB('long'),
        allowNull: true
    },
    created_date: {
        type: DataTypes.DATE,
        allowNull: true
    },
    updated_date: {
        type: DataTypes.DATE,
        allowNull: true
    },
    file_name: {
        type: DataTypes.STRING,
        allowNull: true
    }
}

module.exports.schema = schema;