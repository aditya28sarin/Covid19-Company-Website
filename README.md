# Covid-19 Company Website

- Created a company website using Node.js and Express at the backend with Firebase and Vanilla JS with ReactJs for the front-end that tracks employee behaviour and helps in contact tracing in the company building, using BLE and outside, using GPS; if one catches covid-19.

- Website uses Firebase Auth signUp and SignIn and the Firestore database alongwith Firebase storage for saving employee data. Also, the real time database was used to store sensor data ( Bluetooth, GPS, Temperature and Pulse).

Also added feature of displaying covid-19 statistics in the application and website by fetching foreign API.

## Prerequisites

* [Install Nodejs](https://docs.npmjs.com/downloading-and-installing-node-js-and-npm)
* [Install Express](https://www.npmjs.com/package/express)
* [Install Body Parser](https://www.npmjs.com/package/body-parser)
* [Install EJS](https://www.npmjs.com/package/ejs)
* [Install DOTENV](https://www.npmjs.com/package/dotenv)


## Setup for Covid Website

  ### 1. Clone App
  
 
     $ git clone git@github.com:aditya28sarin/covid19-company-website.git
 
    
 ### 2. Move in Directory
  
     $ cd company
   
    
 ### 3. Install node packages
   ```
   $ npm install 
  ```
  
   ### 4. Run Locally 
   ```
   $ npm start  
  ```
  NOTE: The port by default will be ```http://localhost:5000/```



## Setup for Covid Statistics

  ### 1. Clone App
  
 
     $ git clone git@github.com:aditya28sarin/covid19-company-website.git
 
    
 ### 2. Move in Directory
  
     $ cd covid19_statistics_api
   
    
 ### 3. Install node packages
   ```
   $ npm install 
  ```
  
   ### 4. Run Locally 
   ```
   $ npm run start  
  ```
  NOTE: The port by default will be ```http://localhost:5000/```



## Want to Contribute?

To start contributing, follow the below guidelines: 

**1.**  Fork [this](git@github.com:aditya28sarin/covid19-company-website.git) repository.

**2.**  Clone your forked copy of the project.

     $ git clone https://github.com/<your_user_name>/covid19-company-website.git

     
**3.** Checkout into a new branch 

     $ git checkout -b <branch_name>

**4.** Make your changes

**5.** Add and commit your changes

     $ git add . && git commit -m "<your_message>"
     
**6.** Push Code to Github under your branch 

     $ git push origin <branch_name>   


## Video Link 

### Covid-19 Company Website 

  [![Watch the video](https://img.youtube.com/vi/9EDSI8JlZTw/0.jpg)](https://youtu.be/9EDSI8JlZTw)

### Covid-19 Statistics Webpage

  [![Watch the video](https://img.youtube.com/vi/O9ZCgBhYq2U/0.jpg)](https://youtu.be/O9ZCgBhYq2U)
