const express=require('express');
const bodyParser = require("body-parser");
const ejs = require("ejs");
const mongoose = require("mongoose");
const session = require('express-session');
const passport = require("passport");
const passportLocalMongoose = require("passport-local-mongoose");
const GoogleStrategy = require('passport-google-oauth20').Strategy;
const findOrCreate = require('mongoose-findorcreate');

const app =express();

app.use(express.static("public"));
app.set('view engine', 'ejs');
app.use(bodyParser.urlencoded({
  extended: true
}));


app.get("/", function(req,res){
	res.render("index");
});

app.get("/contact", function(req,res){
	res.render("contact");
});

app.get("/employee", function(req,res){
	res.render("employee");
});

app.get("/signup", function(req,res){
	res.render("signup");
});

app.listen(5000, function(){
	console.log("Server is listening at Port 5000..");
});


