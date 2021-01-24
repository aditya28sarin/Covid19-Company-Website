

def imageUpload():
    import pyrebase

    config = {
        "apiKey": "AIzaSyBV4dYPVUfhBTHj42ulq7UwNJkasNvbZDs",
        "authDomain": "covid-company-auth.firebaseapp.com",
        "databaseURL":"https://covid-company-auth-default-rtdb.firebaseio.com/",
        "projectId": "covid-company-auth",
        "storageBucket": "covid-company-auth.appspot.com",
        "messagingSenderId": "189470145750",
        "appId": "1:189470145750:web:391fd2201350bb68999d77",
        "measurementId": "G-DPVDS1WM0G"
    }

    firebase=pyrebase.initialize_app(config)
    storage = firebase.storage()

    path_on_cloud = "images/img1.jpg"
    path_local="E:\ADITYA SARIN\Aditya\Programming\Software Dev\WebDev\Covid19_Company_Website\company\python\img1.jpg"
    storage.child(path_on_cloud).put(path_local)