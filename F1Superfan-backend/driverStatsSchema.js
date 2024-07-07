var mongoose = require("mongoose")
var Schema = mongoose.Schema

var driverStats = new Schema({
    name: String,
    wdcs: Number,
    wins: Number,
    podiums: Number,
    poles: Number
})

const Data = mongoose.model("data", driverStats)
module.exports = Data