const jwt = require('jsonwebtoken');
const sequelize = require('../dbconfig/seqConfig');
const models = require('db_models');
const moment = require('../utilities/moment');

var sessionLogsModel = sequelize.define('session_logs', models.session_logs, {
    freezeTableName: true,
    createdAt: false,
    updatedAt: false
});

module.exports.decrypt = async (user_data, req) => {
    try {

    } catch (error) {
        throw error;
    }
}

module.exports.verifyToken = async (sessionToken, res) => {
    try {
        var decrypted_data = jwt.decode(sessionToken, process.env.SECRET_KEY);
        if (decrypted_data) {
            var exp = decrypted_data.exp * 1000;
            var expTimeDiff = (new Date(exp) - new Date()) / 1000;
            if (expTimeDiff <= 300) {
                delete decrypted_data.iat;
                delete decrypted_data.exp;
                await refreshToken(decrypted_data, res, sessionToken);
            }
            return decrypted_data;
        } else {
            throw new Error('Unable to decrypt token');
        }
    } catch (error) {
        throw error;
    }
}

module.exports.generateToken = async (user_data, req) => {
    try {
        var keep_active = req.body.keep_active;
        var tokenOptions = keep_active ? { algorithm: 'HS512' } : { algorithm: 'HS512', expiresIn: '60s' };
        var token = jwt.sign(user_data, process.env.SECRET_KEY, tokenOptions);
        if (token) {
            var validateLogSession = new sessionLogsModel({
                user_id: user_data.user_id,
                email: user_data.email_id,
                session_token: token,
                created_time: moment.getCurrentDateTime()
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
        throw error;
    }
}

async function refreshToken(decodedData, res, old_session_tokens) {
    try {
        var token = jwt.sign(decodedData, process.env.SECRET_KEY, { algorithm: 'HS512', expiresIn: '60s' });
        await sessionLogsModel.update({
            session_token: token
        }, {
            where: {
                user_id: decodedData.user_id,
                session_token: old_session_tokens
            }
        });
        res.setHeader('session-token', token);
        return token;
    } catch (error) {
        throw error;
    }
}
