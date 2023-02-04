require('dotenv').config();
var env = require('my_environments');

var customEnv = env[process.env.NODE_ENV_CONF];

createCustomEnv = async (value) => {
    if (value) {
        Object.keys(value).forEach((iteration, i) => {
            var env_Value = Object.values(value)[i]
            process.env[iteration] = env_Value;
            counts = i;
        });
    }
}
createCustomEnv(customEnv);
require('./server');