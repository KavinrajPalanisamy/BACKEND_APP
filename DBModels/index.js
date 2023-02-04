var dbconfig = require('./dbconfig/seqConfig');
module.exports.dbconfig = dbconfig;

var image_data = require('./models/image_data');
var user_login_credentials = require('./models/user_login_credentials');
var session_logs = require('./models/session_logs');


module.exports.image_data = image_data.schema;
module.exports.user_login_credentials = user_login_credentials.schema;
module.exports.session_logs = session_logs.schema;


