const express = require('express');
const router = express.Router();

const axios = require('axios');

const catchAsync = require('../utils/catchAsync.js');
const credentials = require('../configs/credentials.js');

router.get('/names', catchAsync(async (req, res) => {
  let lookup = await axios.get(`https://api.api-ninjas.com/v1/celebrity?name=${encodeURIComponent(req.query.queryString)}`, {headers: {'X-Api-Key': credentials.API_KEY}});
  res.send(JSON.stringify(lookup.data));
}));

module.exports = router;