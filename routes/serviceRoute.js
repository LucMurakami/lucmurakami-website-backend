const express = require('express');
const serviceController = require('../controllers/serviceController');
const router = express.Router();

router.get('/', serviceController.testAPI);

router.get('/motivation', serviceController.getMotivation);

module.exports = router