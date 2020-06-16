const fetch = require('node-fetch');

exports.testAPI = (req, res, next) => {
  res.send("This is a test!")
}

exports.getMotivation = (req, res, next) => {
  fetch("https://api.reddit.com/r/GetMotivated/top.json?t=day&raw_json=1")
  .then(response => response.json())
  .then(data => {
    const json = {
      title: data.data.children[0].data.title,
      image: data.data.children[0].data.preview.images[0].source.url,
      upvotes: data.data.children[0].data.ups,
      permalink: data.data.children[0].data.permalink,
    }
    res.send(json)
  })
  .catch(() => {
    res.status(500).send("Error");
  })
}