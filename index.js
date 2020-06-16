const express = require('express');
const app = express();

const cors = require('cors');
const options = {
  origin: true,
  methods: "GET,HEAD,PUT,PATCH,POST,DELETE",
  credentials: true,
  exposedHeaders: ["x-auth-token"]
};

app.use(cors(options));

const serviceRoutes = require('./routes/serviceRoute');
app.use(serviceRoutes);

const port = process.env.PORT || 5000;
app.listen(port);

console.log(`Website backend listening on ${port}`);