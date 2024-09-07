const sequelize = require('../dbconfig/seqConfig');
const models = require('db_models');
const moment = require('../utilities/moment');
const uuid = require('uuid');

var sessionLogsModel = sequelize.define('session_logs', models.session_logs, {
    freezeTableName: true,
    createdAt: false,
    updatedAt: false
});

module.exports.getToken = async (req, user_data) => {
    try {
        var keep_active = req?.body?.keep_active || false;
        var tokenOptions = keep_active ? { algorithm: 'HS512' } : { algorithm: 'HS512', expiresIn: '60s' };
        var token = jwt.sign(user_data, process.env.SECRET_KEY, tokenOptions);
        if (token) {
            var validateLogSession = new sessionLogsModel({
                session_id: uuid(),
                user_id: user_data.user_id,
                email: user_data.email,
                session_token: token,
                created_time: moment.getCurrentDateTime(),
                login_time: moment.getCurrentDateTime(),
                session_active: 'Y'
            });
            if (validateLogSession) {
                var createdResponse = await validateLogSession.save({ returning: true });
                if (!createdResponse) {
                    throw new Error('Unable to save the session');
                }
                return token;
            }
        } else {
            throw new Error('Unable to generate token');
        }
    } catch (error) {
        res.status(500).json({ status_code: res.statusCode, message: 'sucess' });
    }
}