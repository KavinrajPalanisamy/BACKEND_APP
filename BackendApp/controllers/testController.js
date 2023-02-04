const dashboardModel = require('../models/dashboardModel')

module.exports.testresponse = async (req, res) => {
    try {
        res.json({ status_code: res.statusCode, message: 'Success'});
        
    } catch (error) {
        res.status(500).json({ status_code: res.statusCode, message: error.message });
    }
}