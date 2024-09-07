const route = require('express').Router();
const middleware = require('../middleware/session-manager');
const authController = require('../controllers/authController');

route.post('/login', middleware.verifySession, authController.authLogin);
route.post('/logout', middleware.verifySession, authController.getLogout);

module.exports = route;