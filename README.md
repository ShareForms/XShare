# XShare
XShare

----

## Team Members
* Ivo Paunov
* Chavdar Angelov

----

### An ASP.NET Web Forms Project

----

### Description

This is an application designed to help people to use the car share service.
For building this application it was used Repository pattern for the database layer, 
Services for securing the connection the Web Forms project and the database 
and Dependency Injection with Ninject to have nice and clean code.
Bootstrap is used for making the application good looking

The Data Base Models are as follows:

Users, Car and the affiliated classes Feature, Rating and CarTypes, Resrervation and Accident 

Bellow are listed the main functionalities.

1. There is Public and Private Part of the application and Admin area as well

2. Users after registring are allowed to edit their profile data
 
3. On the about page there is short information about the service and the latest statistics, wich are cashed for 10 minutes

4. The car section allows the user the view all vehicle, which can be reseved (there is a deteid view as well), and to give ratings to the cars. There is an option to add a new car.

5. On the reservation screen are listed the latest reservations. The user can make a new one and than to view the details of his reservation.

6. In case of an accident the user can report it by uploading an image and giving short description and loaction of the accident.
There is an detailed view of the accident as well offering an list of all accidents provided view AJAX in order to avoid refreshing the hole page

7. In the Our Community section there is a brief overview of all user allowing server side sorting and paging.

8. In the Admin Panel there a lot of different options availible. In general there is posibility for delete andediting almost everything availible on this application, even making other users admins !

9. An site map is offered to the users helping them to navigate easely

10. There are 3 ASCX user controls

11. There is data validation on all input fields

12. HTML scripts are escaped and the end user won't have any bad surprices

- - - - 

###### Repo of Team-3-Telerik [Link to GitHub](https://github.com/ShareForms/XShare)

- - - -

###### Telereik-Academy Season 2015-2016 

