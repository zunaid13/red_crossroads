const express = require("express");
const mongoose = require("mongoose");

const globalVars = {
    port : 2000,
    // mongoose_url : 'mongodb+srv://temporary171842:easypassword@cluster0.xxj2vns.mongodb.net/?retryWrites=true&w=majority'
    mongoose_url : 'mongodb+srv://temporary171842:easypassword@cluster0.xxj2vns.mongodb.net/flutter', //! flutter is the db name

    welcome_message : 'Welcome to our app, Red Crossroads.',
    welcome_subject : 'Welcome!!!',
    otp_subject : 'OTP',
    otp_message : 'Your new OTP is : ',
};

const app = express();
 
//! importing the sendmail and user files
const user = require('./users');
const mail = require('./sendmail');


app.use(express.json());

app.use(express.urlencoded({
    extended : true
}));

mongoose
  .connect(globalVars.mongoose_url, {
    useNewUrlParser: true,
    useUnifiedTopology: true,
  })
  .then(() => {
    console.log('Connected to MongoDB');


    // upload single user data to MongoDB
    app.post("/api/add_user", async (req, res) => {
      console.log('Server received user to add', req.body);
      const data = new user(req.body);

      try {
        const dataToStore = await data.save();
        console.log('Stored data' , dataToStore);
        await mail.sendMail(req.body.username, globalVars.welcome_subject, globalVars.welcome_message);
        res.status(200).json(dataToStore);
      } catch (err) {
        res.status(400).json({
          'status': err.message
        });
      }
    });

    // Load all datas from the database
    app.get("/api/get_user", async (req, res) => {
        
        try {
            let data = await user.find();
            // print(res.body);
            res.status(200).json(data);
        } catch (err) {
            res.status(500).json(err.message);
        }
    });

    // sending otp
    app.get("/api/send_otp/:email", async (req, res) => {
        
      try {
          let otp = mail.generateOTP();
          console.log(otp.toString() + " Sending mail now");
          await mail.sendMail(req.params.email, globalVars.otp_subject, globalVars.otp_message + otp.toString());
          res.status(200).send(otp.toString());
          // console.log(res.body);
      } catch (err) {
          res.status(500).json(err.message);
      }
  });

    // Update an user
    app.post("/api/update/:email", async (req, res) => {
        let email = req.params.email;
        let updatedData = req.body;
        let options = {new : true};
        console.log(req.body);
        console.log(updatedData);
        try {
            const data = await user.findOneAndUpdate({ username: email }, updatedData, options);
            if (data) {
              res.status(200).send(data);
            } else {
              res.status(404).send("User not found");
            }
        } catch (error) {
            res.status(500).send(error.message);
        }
    });

    // delete an user
    app.delete("/api/delete/:id", async (req, res) => {

        let id = req.params.id;
        try {
            const data = await user.findByIdAndDelete(id);
            res.json({
                'status' : "Successfully deleted user"
            });
        } catch (error) {
            res.json(error.message);
        }
    });

  })
  .catch((error) => {
    console.log(error.message);
  });
//! here we use .then promise because newer version does not support callback functions


// start server
app.listen(globalVars.port, () => {
    console.log("Listening on port " + globalVars.port);
})

//! use npm start command for nodemon