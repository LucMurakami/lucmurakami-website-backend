const express = require('express');
const path = require('path');

const app = express();

app.get('/', (req, res) => {
  res.send({text:"This is the homepage!"});
});

app.get('/test', (req, res) => {
  res.send({text:"Testing with travis"});
});

app.get('/help', (req, res) => {
  res.send({text:"Help endpoint"});
});

const port = process.env.PORT || 5000;
app.listen(port);

console.log(`Website backend listening on ${port}`);