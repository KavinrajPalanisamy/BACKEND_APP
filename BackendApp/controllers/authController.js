const sequelize = require('../dbconfig/seqConfig');
const authModel = require('../models/authModel');

module.exports.authLogin = async (req, res) => {
    try {
        var [user_data] = await sequelize.query(`select * from user_auth_credentials auc where email =:email_id`, {
            replacements: { email_id: req.body.email_id },
            type: sequelize.QueryTypes.SELECT
        });
        if (user_data?.password && user_data?.user_name) {
            let is_valid = await bcrypt.compare(req.body.password, user_data.password);
            if (!is_valid) {
                throw new Error('Invalid Login Credentials');
            }
            const authResponse = authModel.getToken(user_data);
            if (authResponse) {
                res.setHeader('session-token', authResponse);
                return authResponse;
            } else {
                throw new Error('Unable to get token');
            }
        }
        else {
            throw new Error('User ID not Found.');
        }
    } catch (error) {
        res.status(500).json({ status_code: res.statusCode, message: error.message });
    }
}

module.exports.getLogout = async (req, res) => {
    try {

    } catch (error) {
        res.status(500).json({ status_code: res.statusCode, message: error.message });
    }
}
