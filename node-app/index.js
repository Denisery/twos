// Install express by running `npm install express`
const express = require('express');
const app = express();
const port = 3000;

app.get('/', (req, res) => {
  res.send('Hello from Node.js!');
});
app.get('/login', (req, res) => {
  res.send('Hello from Node.js! login page');
});

app.listen(port, () => {
  console.log(`Node app listening at http://localhost:${port}`);
});
