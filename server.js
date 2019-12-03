var express = require("express");
var app = express();
var bodyParser = require("body-parser");
var mysql = require("mysql");

var dbConnection = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "Calidad1",
  database: "homedelivery"
});

dbConnection.connect();

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

//default route
app.get("/", function(req, res) {
  return res.send({ error: "true", message: "Hello" });
});

app.get("/city", function(req, res) {
  dbConnection.query("SELECT * FROM City", function(err, results, fields) {
    if (err) res.send(err.message);
    else
      return res.send({
        data: results
      });
  });
});

app.get("/plant_service", function(req, res) {
  dbConnection.query("call list_plant_service();", function(
    err,
    results,
    fields
  ) {
    if (err) res.send(err.message);
    else return res.send({ data: results });
  });
});

app.listen(3002, function() {
  console.log("app running on port 3002");
});

module.exports = app;
