const express = require('express');
const router = express.Router();

const catchAsync = require('../utils/catchAsync.js');

router.get('/:uid', catchAsync(async (req, res) => {
  // Get user info
  res.send(`GET for user ${req.params.uid}`);
}));

router.post('/:uid', catchAsync(async (req, res) => {
  // Create user profile
  res.send(`POST for user ${req.params.uid}`);
}));

router.put('/:uid', catchAsync(async (req, res) => {
  // Update user info
  res.send(`PUT for user ${req.params.uid}`);
}));

router.delete('/:uid', catchAsync(async (req, res) => {
  // Delete user profile
  res.send(`DELETE for user ${req.params.uid}`);
}));

module.exports = router;