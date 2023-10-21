const nodemailer = require('nodemailer');

const transporter = nodemailer.createTransport({
    service: "gmail",
    auth: {
        user: "temporary171842@gmail.com",
        pass: "vwhrdrzfmncjswbj"
    }
});

const mailOptions = {
    from: "temporary171842@gmail.com",
    to: "zunaidulalam@iut-dhaka.edu",
    subject: "Testing from nodejs",
    text: "If this works then the next phase begins"
};



function sendMail(recipient, subject, message)
{
    mailOptions.to = recipient;
    mailOptions.subject = subject;
    mailOptions.text = message;

    let success = true;
    transporter.sendMail(mailOptions, function(error, info){
        if(error){
            if (error.code === "ENOTFOUND") {
                console.log("Recipient email does not exist.");
            }
            console.log(error);
            success = false;
        } else{
            console.log("Email sent: " + info.response);
        }
    });

    return success;
}

function generateOTP(){
    let otp = "";
    let OTPsize = 4;
    for(let i = 0 ; i < OTPsize ; i++){
        otp += Math.floor(Math.random() * 10);
    }
    return otp;
}

module.exports = {
    sendMail,
    generateOTP,
};

/*
        String myAccountEmail = "temporary171842@gmail.com";
        String myAccountPassword = "fnmgjkppbluhkqjm"; // easypassword
*/