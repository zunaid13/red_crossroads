const mongoose = require("mongoose");

let messageSchema = new mongoose.Schema({
  id: {
    requred: true,
    type: Number,
  },
  sender: {
    required: true,
    type: String,
  },
  message: {
    required: true,
    type: String,
  },
});

module.exports = mongoose.model("message_schema", messageSchema);
