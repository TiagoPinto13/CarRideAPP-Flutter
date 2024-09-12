# _UniRideShare App_ Development Report

Welcome to the documentation pages of the _UniRideShare App_!

You can find here details about the _UniRideShare App_, from a high-level vision to low-level implementation decisions, a kind of Software Development Report, organized by type of activities: 


* [Business modeling](#business-modelling) 
  * [Product Vision](#product-vision)
  * [Features and Assumptions](#features-and-assumptions)
  * [Elevator Pitch](#elevator-pitch)
* [Requirements](#requirements)
  * [Domain model](#domain-model)
* [Architecture and Design](#architecture-and-design)
  * [Logical architecture](#logical-architecture)
  * [Physical architecture](#physical-architecture)
  * [Vertical prototype](#vertical-prototype)
* [Project management](#project-management)
* [Sprint 1](#sprint-1)
  * [Iteration backlog](#iteration-backlog-1)
  * [Retrospective](#retrospective-1)
  * [Improvement Strategy](#improvement-strategy-1)
  * [Product Owner Feedback](#product-owner-feedback-1)
  * [Work Distribution](#work-distribution-1)
* [Sprint 2](#sprint-2)
  * [Iteration backlog](#iteration-backlog-2)
  * [Retrospective](#retrospective-2)
  * [Improvement Strategy](#improvement-strategy-2)
  * [Product Owner Feedback](#product-owner-feedback-2)
  * [Work Distribution](#work-distribution-2)
* [Sprint 3](#sprint-3)
  * [Iteration backlog](#iteration-backlog-3)
  * [Retrospective](#retrospective-3)
  * [Improvement Strategy](#improvement-strategy-3)
  * [Product Owner Feedback](#product-owner-feedback-3)
  * [Work Distribution](#work-distribution-3)

Contributions are expected to be made exclusively by the initial team, but we may open them to the community, after the course, in all areas and topics: requirements, technologies, development, experimentation, testing, etc.

Please contact us!

Thank you!

### Group Members
Nelson Neto - 202108117 - up202108117@up.pt <br />
Paulo Fidalgo - 201806603 - up201806603@up.pt <br />
Simão Neri - 202206370 - up202206370@up.pt <br />
Tiago Pinto - 202206280 - 202206280@up.pt <br />
Wagner Pedrosa - 201908556 - 201908556@up.pt <br />

---
## Business Modelling

### Product Vision

Given the expenses and environmental effects associated with private transportation, we've opted to set up a sustainable transportation network at FEUP with a Carpooling System app. This platform encourages students to share rides, cutting down on traffic, carbon emissions, and transportation costs, while also promoting social equality.

### Features and Assumptions
#### Main Features:
* **User Registration:** Students will create profiles containing their personal information and vehicles they may use when giving rides
* **Scheduling trips:** Users can schedule trips, ensuring timely and efficient transportation arrangements for their commute
* **Communication Tools:** Built-in messaging and notification systems will enable users to coordinate logistics and communicate with their carpooling group
* **Sustainability Metrics:** Users will have access to metrics tracking their environmental impact, including carbon emissions saved and kilometers traveled via shared rides
* **Rating System:** Users will have the possibility to rate drivers, ensuring safety and accountability for all passengers


#### Extra Features:
* **Cost Sharing:** The app will provide information about transportation costs, such as fuel expenses, ensuring fair and equitable sharing among participants
* **Language and View options:** The app will offer language options (PT/EN and others), Light and Dark modes, and a simple, efficient design, ensuring ease of use for all users, regardless of technological proficiency
* **Disability Compatibility:** The app will offer the possibility to see which users' cars meet the requirements to travel with a disabled person.


### Elevator Pitch

Imagine a scenario where the FEUP students can share rides in a simple and efficient way, reduce traffic congestion, cut carbon emissions and save money. With the Carpooling App, this vision becomes a reality.  We encourage a culture of colaboration and sustainability on campus, embracing the principles of Circular Economy and promoting social equity. This is not only a way to innovate in trasportation, but to mold a more connected and environmentally conscious society. Join in this journey to create a happier and greener future for FEUP!

## Requirements

### Domain model

   Users can either be Unregistered or Registered. Unregistered users can become Registered Users through register. Registered Users can interact with other
Registered Users through messages, that contain a specific content. These Users can also rate other users, that they have previously shared a ride with. A Registered User can also create a ride, or join an existing ride.
  In each ride that the User participates, he can see the sustainability metrics of that ride.

Example:
 <p align="center" justify="center">
  <img src="https://github.com/FEUP-LEIC-ES-2023-24/2LEIC02T4/blob/main/docs/Domain_Model.drawio.png"/>
</p>


## Architecture and Design
The architecture of a software system encompasses the set of key decisions about its overall organization. 

A well written architecture document is brief but reduces the amount of time it takes new programmers to a project to understand the code to feel able to make modifications and enhancements.

To document the architecture requires describing the decomposition of the system in their parts (high-level components) and the key behaviors and collaborations between them. 

In this section you should start by briefly describing the overall components of the project and their interrelations. You should also describe how you solved typical problems you may have encountered, pointing to well-known architectural and design patterns, if applicable.

### Logical architecture
The purpose of this subsection is to document the high-level logical structure of the code (Logical View), using a UML diagram with logical packages, without the worry of allocating to components, processes or machines.

It can be beneficial to present the system in a horizontal decomposition, defining layers and implementation concepts, such as the user interface, business logic and concepts.

  
The logical view of the Carpooling App encompasses the User Interface, which allows users to interact with the various features of the application. These features are implemented within the app's logic, where the functionality is developed and executed.

For features requiring location input from users, the app utilizes Google Maps APIs. Specifically, the Places API is employed to convert latitude and longitude coordinates into corresponding location names and vice versa. Additionally, it provides autocomplete functionality for location names. The Directions API is utilized to calculate routes between two points, along with estimating travel time and distance based on default configurations.

Firebase serves as the online database for the app, where data is both accessed and stored. Within Firebase, the Authentication API is utilized for user authentication, while the Cloud Firestore API is employed to store persistent data.

To accurately describe the app's structure and functionality, various tools such as UML diagrams, Figma, and others may be used to create a comprehensive schema. These tools help in visually representing the architecture and flow of the Carpooling App.

![LogicalView](https://github.com/FEUP-LEIC-ES-2023-24/2LEIC02T4/blob/main/docs/Logical_architecture.drawio.png)

### Physical architecture
The goal of this subsection is to document the high-level physical structure of the software system (machines, connections, software components installed, and their dependencies) using UML deployment diagrams (Deployment View) or component diagrams (Implementation View), separate or integrated, showing the physical structure of the system.

It should describe also the technologies considered and justify the selections made. Examples of technologies relevant for ESOF are, for example, frameworks for mobile applications (such as Flutter).

 The diagram depicts a deployment view of a carpooling system, where a user interacts with the UniRideShare App on their smartphone. 
The App provides a user interface for creating and listing ride offers, connecting to logical services for processing. 
Ride offers are stored in an active rides database. Additionally, the system utilizes localization functionalities, accessing a localization API for obtaining location data.

![DeploymentView](https://github.com/FEUP-LEIC-ES-2023-24/2LEIC02T4/blob/main/docs/Physical_Architecture.drawio.png)

### Vertical prototype 

We have started implementing the login page to assure that we can fully utilize all techonologies, that is, flutter and Firebase. Login will require an email and password, which need to be verified. There'll also be an option to recover your password if forgotten.

Example:
 <p align="center" justify="center">
  <img src="https://github.com/FEUP-LEIC-ES-2023-24/2LEIC02T4/blob/main/docs/login.png"/>
</p>

The first version of the Search Page was also created in Flutter. On this page, users can search for the trip that best suits their needs, based on their desired starting point, destination, date, and the number of passengers for the trip. The result is presented in the following image.

Search Page:
 <p align="center" justify="center">
  <img width=330 src="https://github.com/FEUP-LEIC-ES-2023-24/2LEIC02T4/blob/main/docs/search_page.png"/>
</p>


To ensure consistency on future development, we started to design the main components of our screens, namely buttons, including dark mode and light mode colors, an app bar and a navigation bar. We have also defined and implemented in flutter the collor pallette that is to be utilized on both app themes and the different text styles.

Example:
 <p align="center" justify="center">
  <img src="https://github.com/FEUP-LEIC-ES-2023-24/2LEIC02T4/blob/main/docs/example.png"/>
</p>

### Sprint 1

#### <a id="iteration-backlog-1"> Iteration Backlog
The following board shows the iteration backlog for the first sprint. The estimatation of this spring is 15, starting with the user stories with higher priority.

Sprint 1 - Iteration Backlog - Start:
 <p align="center" justify="center">
  <img src="https://github.com/FEUP-LEIC-ES-2023-24/2LEIC02T4/blob/main/docs/backlog.png"/>
</p>

Sprint 1 - Product Done - End:
 <p align="center" justify="center">
  <img src="https://github.com/FEUP-LEIC-ES-2023-24/2LEIC02T4/blob/main/docs/Sprint1-end_backlog.png"/>
</p>

#### <a id="retrospective-1"> Retroespective
##### Start 
* Planning the future sprint, taking into account not only the priority of the features, but also the developing precedence.
* Thinking more about the user experience while devoloping.
##### Stop
* Spliting the work unevenly.
##### Continue
* The developing pace.
* Communication between the team.
* The good team-building
  
##### <a id="improvement-strategy-1"> Improvement Strategy
* Create a list of user-stories dependencies and before distributing work in each sprint, have the dependencies in mind, in order to avoid doing more that one issue at the same time.
* While developing, stop and ask team-members to test the feature and listen to it's experience. Keep developing in order to make it's experience even better.
* Ensure every team-member isn't loaded with too much work. Holding regular meetings to check in on everyone's progress and distribute better work if needed.
  
#### <a id="product-owner-feedback-1"> Product Owner Feedback
* Create a way for a driver and passager to comunicate
* Only show what is fully implemented, dont show in the app unfinished features
* Give more feedback to the end-user, with popups that can easily be seen

#### <a id="work-distribution-1"> Work Distribution
* Nelson Neto - Registered users need to be able to log in.
* Wagner Pedrosa - Unregistered users need to be able to register in the app.
* Paulo Fidalgo - Registered users need to be able to schedule trips; registered users need to be able to access sustainability metrics; and unregistered users need to be able to see existing rides.
* Simão Neri - Registered users need to be able to schedule trips; and unregistered users need to be able to see existing rides.
* Tiago Pinto - Registered users need to be able to access sustainability metrics.

### Sprint 2

#### <a id="iteration-backlog-2"> Iteration Backlog
The following board shows the iteration backlog for the second sprint. The estimatation of this spring is 13.

Sprint 2 - Iteration Backlog - Start:
 <p align="center" justify="center">
  <img src="https://github.com/FEUP-LEIC-ES-2023-24/2LEIC02T4/blob/main/docs/Sprint2-start_backlog.png"/>
</p>

Sprint 2 - Product Done - End:
 <p align="center" justify="center">
  <img src="https://github.com/FEUP-LEIC-ES-2023-24/2LEIC02T4/blob/main/docs/Sprint2-end_backlog.png"/>
</p>


#### <a id="retrospective-2"> Retroespective
##### Start 
* Planning the future sprint, taking into account not only the priority of the features, but also the developing precedence (there's still place for improvement).
* Develop stronger tests for the implemented features.
##### Stop
* Stop splitting the workload unevenly throughout the sprint, timewise.
##### Continue
* The developing pace.
* Communication between the team.
* The good team-building.
  
#### <a id="improvement-strategy-2"> Improvement Strategy
* Better the current user-stories dependencies list and be more carefull during sprint planning.
* Give more attention to testing. Better the coverage and hold regular test review in order to maintain a good testing strategy.
* Better the current time estimation and capacity planning having in mind the experience gained during the other sprints.
* Improve the meetings, so each team-member, knows everyone's work load, work plan and can give feedback.
  
#### <a id="product-owner-feedback-2"> Product Owner Feedback
* Show the number of seats in a ride
* Add a brand logo or the name of the app on the main page
* Change the Chat to Real Time Messaging of the Firebase
* Specify the functionality of each page in the app with a small sentence
* After joining or creating a ride, redirect the user to the schedule page, in order to show that the ride was successfully scheduled
  
#### <a id="work-distribution-2"> Work Distribution
* Nelson Neto - Registered users need to receive notifications; registered users need to be able to join existing trips.
* Wagner Pedrosa - Registered users need to be able to communicate with other users.
* Paulo Fidalgo - Registered users need to receive notifications; registered users need to be able to communicate with other users.
* Simão Neri - Registered users need to be able to join existing trips.
* Tiago Pinto - Registered users need to be able to access sustainability metrics.

### Sprint 3

#### <a id="iteration-backlog-3"> Iteration Backlog
The following board shows the iteration backlog for the third sprint. The estimatation of this spring is 15.

Sprint 3 - Iteration Backlog - Start:
 <p align="center" justify="center">
  <img src="https://github.com/FEUP-LEIC-ES-2023-24/2LEIC02T4/blob/main/docs/Sprint3-start_backlog.png"/>
</p>

Sprint 3 - Product Done - End:
 <p align="center" justify="center">
  <img src="https://github.com/FEUP-LEIC-ES-2023-24/2LEIC02T4/blob/main/docs/Sprint3-end_backlog.png"/>
</p>


#### <a id="retrospective-3"> Retroespective
##### Start 
* Tacking into account unpredictable app behaviour and extreme scenarios, and prepare accordingly.
* Making the user-experience perfect instead of acceptable.
##### Stop
* Making tests only at the sprint end.
##### Continue
* The good work rithm.
* The good communication between the team.
* The good planning.
  
#### <a id="improvement-strategy-3"> Improvement Strategy
* Brainstorm different scenarios and put the app under extreme situations to test it's performance. Stress testing and failure mode.
* Get non team-members to test the app and get their feedback, even in-app surveys.
* Implement incremental test practices. Testing needs to be part of the definition of done.
* Keep upgrading and adapting team meetings to the current necessities, with focus on the well being of the team and the quality of the work done.
  
#### <a id="work-distribution-3"> Work Distribution
* Nelson Neto - Drivers need to be able to rate passengers after a trip.
* Wagner Pedrosa - The app should be able to inform which cars are able to accommodate disabled people.
* Paulo Fidalgo - International users need to be able to choose different language options, and registered users need to be able to choose different visualization options.
* Simão Neri - Passengers need to be able to rate drivers after a trip.
* Tiago Pinto - Registered users need to be informed of the trip cost division.

  
