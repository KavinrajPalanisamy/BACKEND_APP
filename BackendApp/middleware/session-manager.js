const encrypterDecrypter = require('./encrypt-decrypt');
const auth = require('./auth');

module.exports.createSession = async (req, res, next) => {
    try {
        if (!req || !req.body || !req.body.email_id || !req.body.password) {
            throw new Error('Request body data not found');
        }
        var user_data = await auth.authenticateReq(req);
        if (!user_data) {
            throw new Error('Invalid User Credentials');
        }
        if (user_data) {
            var token = await encrypterDecrypter.generateToken(user_data, req);
            if (token) {
                res.setHeader('session-token', token);
                req.user = user_data;
                next();
            } else {
                throw new Error('Unable to get token');
            }
        }
    } catch (error) {
        throw error;
    }
}

module.exports.verifySession = async (req, res, next) => {
    try {
        if (!req || !req.headers || !req.headers['session-token']) {
            throw new Error('Request headers not found');
        }
        var session_token = req.headers['session-token'];
        if (session_token) {
            var decrypted_data = await encrypterDecrypter.verifyToken(session_token, res);
            if (decrypted_data) {
                req.user = decrypted_data;
                next();
            }
        }
    } catch (error) {
        throw error;
    }
}