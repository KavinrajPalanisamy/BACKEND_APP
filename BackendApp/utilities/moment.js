const moment = require('moment');

module.exports.getCurrentDateTime = ()=> {
    return moment().format('YYYY-MM-DD HH:mm:ss');
}

module.exports.getCurrentDate = ()=> {
    return moment().format('YYYY-MM-DD');
}