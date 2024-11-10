const express = require('express');
const router = express.Router();

const searchRoutes = require('./search');
const userRoutes = require('./user');

const routes = [ // Search, user, gamestate?, scores?
  {
    path: '/search',
    route: searchRoutes,
  },
  {
    path: '/user',
    route: userRoutes,
  }
];

// if (process.env.NODE_ENV === 'development') {
//   routes = [...routes, ...[]]; // TODO: Add debug/doc routes
// }

routes.forEach((route) => {
  router.use(route.path, route.route);
});

module.exports = router;