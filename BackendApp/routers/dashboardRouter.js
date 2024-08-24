const route = require('express').Router();
const dashboadController = require('../controllers/dashboardController');
const middleware = require('../middleware/session-manager');

route.get('/get-info', middleware.verifySession, dashboadController.getInfo);
route.post('/save-image', dashboadController.validateSaveImage);

module.exports = route;