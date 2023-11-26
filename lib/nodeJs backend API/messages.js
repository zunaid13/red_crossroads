const mongoose = require("mongoose");

let messageSchema = new mongoose.Schema({
  id: {
    required: true,
    type: Date, // Change the type to Date
  },
  sender: {
    required: true,
    type: String,
  },
  message: {
    required: true,
    type: String,
  },
  receiver: {
    required: true,
    type: String,
  },
});

module.exports = mongoose.model("message_schema", messageSchema);
