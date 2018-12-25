# in_time
[![Gitter chat](https://badges.gitter.im/gitterHQ/gitter.png)](https://gitter.im/in_time/Lobby)

### Note: The project is in its very initial stage

#### A cross platform mobile application to be always in time.
The app will help students to get all the work done in time and track his activities
The students will be notified about their timetable, classes to attend, other todos to be done.
It will help the student keep track of the number of class he/she has missed.
It will also show motiviational quotes with todos to be done so that the student stays motivated.

![img](./assets/img/wire.png)


## TODOS:
* Create login using firebase
* Create page to edit routine
* Create page to edit todos
* Store the data in firebase
* Push notifications for each class and todos
* Register wheather the class is attended or not

## Contributing Guide:

* Fork the repository
* Clone the repoository
`git clone https://github.com/<YOUR_USERNAME>/in-time`
replace <YOUR_USERNAME> with your username
* Make Firebase Project
    -Create new Project 
    -Add Firebase to your app
        -Enter Package name as `com.example.intime`
        -Add your SHA-1 key (Very Important)
        -Download Config file `google.services.json`
    -Add the config file into Android => App =>(Paste it here)      
* run the app `flutter run` 
