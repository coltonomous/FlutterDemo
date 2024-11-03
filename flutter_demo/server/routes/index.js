const express = require('express');
const router = express.Router();

// const config = require('../../configs/config');

const gameRoutes = require('./names');

const defaultRoutes = [
    {
        path: '/names',
        route: gameRoutes,
    },
//   {
//     path: '/auth',
//     route: authRoute,
//   }
];

// const devRoutes = [
//   // routes available only in development mode
//   {
//     path: '/docs',
//     route: docsRoute,
//   },
// ];

defaultRoutes.forEach((route) => {
  router.use(route.path, route.route);
});

// if (config.env === 'development') {
//   devRoutes.forEach((route) => {
//     router.use(route.path, route.route);
//   });
// }

module.exports = router;