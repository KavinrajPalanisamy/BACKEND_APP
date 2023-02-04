const sequelize = require('sequelize');

module.exports.getInfo = async (req, res) => {
    try {
        console.log('Get Info Model online');
        return req.body;
    } catch (error) {
        res.status(500).json({ status_code: res.statusCode, message: 'sucess' });
    }
}