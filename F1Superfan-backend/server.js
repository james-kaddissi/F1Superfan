const express = require('express')
const mongoose = require('mongoose')
const Data = require('./driverStatsSchema');

var app = express();
var port = 3000;


mongoose.connect("mongodb+srv://jameskaddissi:YLOEM3bqwhHoDZIX@f1superfantest.ealcfz2.mongodb.net/f1superfan?retryWrites=true&w=majority";)
mongoose.connection.once("open", () => {
    console.log("Connection successful.");
}).on("error", (error) => {
    console.log("Connection failed: " + error);
});

app.use(express.json());

app.post("/addDriverStats", (req, res) => {

    const newData = new Data({
        name: req.get("name"),
        wdcs: req.get("wdcs"),
        wins: req.get("wins"),
        podiums: req.get("podiums"),
        poles : req.get("poles")
    });

    newData.save()
        .then(() => res.status(201).send("Data added successfully"))
        .catch((err) => res.status(500).send(err));
});

app.get("/getDriverStats/:name", (req, res) => {
    const driverName = req.params.name;

    Data.findOne({ name: driverName })
        .then((data) => {
            if (!data) {
                return res.status(404).send("Data not found");
            }
            res.json(data);
        })
        .catch((err) => res.status(500).send(err));
});

app.listen(port, () => {
    console.log(`Server running on http://localhost:${port}`);
});