const express = require('express');

const compression = require('compression');
const cors = require('cors');
const helmet = require('helmet');
const xss = require('xss-clean');
// const mongoSanitize = require('express-mongo-sanitize');

const morgan = require('./utils/morgan');

// const passport = require('passport');
// const { jwtStrategy } = require('./configs/passport');
// const { authLimiter } = require('./middlewares/rateLimiter');

const routes = require('./routes');

const app = express();

if(process.env.NODE_ENV !== 'test') {
  app.use(morgan.successHandler);
  app.use(morgan.errorHandler);
}

// set security HTTP headers
app.use(helmet());

// parse json request body
app.use(express.json());

// parse urlencoded request body
app.use(express.urlencoded({ extended: true }));

// sanitize request data
app.use(xss());
// app.use(mongoSanitize());

// gzip compression
app.use(compression());

// enable cors
app.use(cors());
app.options('*', cors());

// jwt authentication
// app.use(passport.initialize());
// passport.use('jwt', jwtStrategy);

// limit repeated failed requests to auth endpoints
// if (config.env === 'production') {
//   app.use('/v1/auth', authLimiter);
// }

// api routes
app.use('/', routes);

// send back a 404 error for any unknown api request
app.use((req, res) => {
  res.status(404).send('Not Found');
});

let port = process.env.PORT || 3000;
app.listen(port, () => {
  console.log(`Server listening on port ${port}`);  
});

module.exports = app;