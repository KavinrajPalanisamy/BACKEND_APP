const express = require('express');
const app = express();
const cors = require('cors');
const bodyparser = require('body-parser');
const server = require('http').createServer(app);


app.use(bodyparser.urlencoded({ limit: '50mb', extended: false }));
app.use(bodyparser.json());

// Enable CORS for all routes and origins
app.use(cors());

// IMPORT MODELS
const dashboardRouter = require('./routers/dashboardRouter');
const testRouter = require('./routers/testrouter');




// ASSIGNING PATH
app.use('/user', dashboardRouter);
app.use('/get', testRouter);






const port = process.env.PORT || 1200;
server.listen(port);

console.log('Server Listening to the Port ' + port);