const express = require('express')
const app = express()
const bodyParser = require('body-parser');
const cors = require('cors');
const mongoose = require('mongoose');
const snowRoutes = express.Router();

const PORT = process.env.PORT || 4000;

var path = require('path');

app.use(cors());
app.use(bodyParser.json());


snowRoutes.route('/:id').get(function(req, res) {
    let id = req.params.id;
    console.log('find id',id);
    res.json({foo: 'bar'});
});

app.use('/snow', snowRoutes);

app.use(express.static("./proj2/build/web")); 
app.get("*", (req, res) => {
    res.sendFile(path.resolve(__dirname, "./proj2", "build/web", "index.html"));
});

app.listen(PORT, function() {
    console.log("Server is running on Port..: " + PORT);
});

