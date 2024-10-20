const sequelize = require('../dbconfig/seqConfig');
const bcrypt = require('bcryptjs');

// const session_id = require('uuid').v4();
// console.log(session_id);


module.exports.authenticateReq = async (req) => {
    try {
        var [user_data] = await sequelize.query(`select * from user_auth_credentials uac where email =:email_id`, {
            replacements: { email_id: req.body.email_id },
            type: sequelize.QueryTypes.SELECT
        });
        // var is_valid = await bcrypt.compare(req.body.password, user_data.password);
        if (user_data.email) {
            return true;
        } else {
            return false;
        }
    } catch (error) {
        throw error;
    }
}