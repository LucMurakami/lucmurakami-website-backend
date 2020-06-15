const express = require('express');
const cors = require('cors');

const app = express();
const options = {
  origin: true,
  methods: "GET,HEAD,PUT,PATCH,POST,DELETE",
  credentials: true,
  exposedHeaders: ["x-auth-token"]
};

app.use(cors(options));

app.get('/', (req, res) => {
  res.send({text:"This is the homepage!"});
});

app.get('/test', (req, res) => {
  res.send({text:"Testing with travis"});
});

const port = process.env.PORT || 5000;
app.listen(port);

console.log(`Website backend listening on ${port}`);