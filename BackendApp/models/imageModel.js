var sequelize = require('../dbconfig/seqConfig');
const schema = require('db_models');
const date = require('../utilities/moment');

const image_data_model = sequelize.define('image_data', schema.image_data, {
    timestamps: false
});

module.exports.saveImage = async (req, res) => {
    try {
        let base64 = req.file_content.split('base64,');
        const buffer = Buffer.from(base64[1], 'base64')

        var transaction = new image_data_model({
            email: 'default@default.com',
            image_type: 'P',
            content_type: req.content_type,
            file_content: buffer,
            created_date: date.getCurrentDateTime(),
            updated_date: date.getCurrentDateTime(),
            file_name: req.file_name
        })
        await transaction.save();

        return req.body;
    } catch (error) {
        console.log(error);
        
        res.status(500).json({ status_code: res.statusCode, message: 'sucess' });
    }
}