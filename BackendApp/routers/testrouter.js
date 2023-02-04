const route = require('express').Router();
const testcontoller = require('../controllers/testController');

route.get('/', testcontoller.testresponse);
module.exports=route;