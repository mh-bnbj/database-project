const http = require('http') ;
const port = 5000 ;
var mysql = require('mysql');


// const server = http.createServer (function(req , res) {
//     console.log(req.body);
//     res.writeHead (200 , { 'Content-Type' : 'text/html' } ) ;
//     res.write (' Hello world ');
//     res.end () ;
// });

// server.listen (port, function (error) {
//     console.log (error);
//     if (error) {
//         throw new Error (error.message) ;
//     }
//     else {
//         console.log (' listening on port ' + port);
//     }
// })


var con = mysql.createConnection({
  host: "localhost",
  user: "mohamad",
  password: "mhBINABAJY1379",
  database: "mydb"
});
 
con.connect(function(err) {
  if (err) throw err;
  console.log("Connected!");
  var sql = "SELECT * from customer";
  con.query(sql, function (err, result) {
    if (err) throw err;
    console.log(result);
  });
});


// var con = mysql.createConnection({
//   host: "localhost",
//   user: "root",
//   password: "mhBINABAJY1379"
// });

// con.connect(function(err) {
//   if (err) throw err;
//   console.log("Connected!");
// });