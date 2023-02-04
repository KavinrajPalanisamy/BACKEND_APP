const sequelize = require('../dbconfig/seqConfig');
const bcrypt = require('bcryptjs')

module.exports.authenticateReq = async (req) => {
    try {
        var [user_data] = await sequelize.query(`select * from user_login_credentials ulc where email_id =:email_id`, {
            replacements: { email_id: req.body.email_id },
            type: sequelize.QueryTypes.SELECT
        });
        var is_valid = await bcrypt.compare(req.body.password, user_data.password);
        if (is_valid) {
            return user_data;
        } else {
            return false;
        }
    } catch (error) {
        throw error;
    }
}