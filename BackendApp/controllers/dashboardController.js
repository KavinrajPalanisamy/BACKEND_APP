const dashboardModel = require('../models/dashboardModel')

module.exports.getInfo = async (req, res) => {
    try {
        var data = await dashboardModel.getInfo(req);
        if (data) {
            res.status(200).json({ status_code: res.statusCode, message: 'Success', data: req.user });
        }
    } catch (error) {
        res.status(500).json({ status_code: res.statusCode, message: error.message });
    }
}