const express = require('express');
const router = express.Router();

const axios = require('axios');
// const httpStatus = require('http-status');
const catchAsync = require('../utils/catchAsync.js');

const API_KEY = require('../configs/credentials.js').API_KEY;

// TODO: Filter results by game parameters; add optional offset to limit results
router.get('/', catchAsync(async (req, res) => {
  let nameLookup = await axios.get(`https://api.api-ninjas.com/v1/celebrity?name=${req.query.queryString}`, {headers: {'X-Api-Key': API_KEY}});
  res.send(JSON.stringify(nameLookup.data));
}));

module.exports = router;