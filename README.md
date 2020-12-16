# CardGame
This was completed for the class Software Engineering Languages and Tools at the University of Iowa with simulated scrum group of 5.

This is a copy of our team GitHub Repository

Here are a few of our Wikis

## PivotalTracker: https://www.pivotaltracker.com/n/projects/2474438

## Website: https://team4-selt2020-3.herokuapp.com/

## Background:
The Pandemic has left many of us quarantining at home looking for ways to interact with our family members and friends without being in the same room. A deck of cards has many different games that can be played so it is perfect for a website.

## Overview of Project:
In simple terms, we will create a functional deck of cards. This deck will be able to play many card games such as War and Go Fish. The rules of the games will not be implemented, but all the actions necessary to play them will be. The project is done in three sprints. The sprints will each have a subset of the overall goals that need to be achieved. To view each of the sprints and the work done for them you can access the below-shown links.

#### Sprints
[SPRINT 1](https://github.com/UIOWAjohnsonhj/Team4_SELT2020/wiki/SPRINT1Summary)\
[SPRINT 2](https://github.com/UIOWAjohnsonhj/Team4_SELT2020/wiki/SPRINT2Summary)\
[SPRINT 3](https://github.com/UIOWAjohnsonhj/Team4_SELT2020/wiki/SPRINT3Summary)

## Capabilities of Project:
### Some initial ideas on the approach of the above-mentioned deck of cards are:
- A single deck is 52 cards, the playing table can be played with one, two, or even three of such decks depending on the game.
- The playing table can also be reduced to as few cards as necessary, with the remaining cards being discarded. This might be necessary for some games that do not use the entire deck
- Any user should be free to randomly draw/discard a specific amount of cards.
- The users are creating the rules so they have to keep themselves accountable for picking the right amount of cards for any given game.
- The initial deck dictates how many cards are available within a specific game session.
- You can add the joker cards for games that are necessary.
- There will be the capability to pass cards to players, like passing in a game like Hearts.
- There will be a discard deck for each player so you can reuse the deck, for games like War.
- There will be a shuffle button so you can either shuffle a deck before picking up cards and a shuffle for the discard pile. In games like war, you can then play with a shuffled deck. 
- Give the players the capacity to show and hide player hands.
- Allow for cards to be communally drawn to the center of the table like in some types of poker.

## Process
The project is all about iterations. We as developers need to have the most viable products at the end of 2-week sprints. As this is an Agile project change is happening all the time, but the vision of what the product has to look like remains the same for the most part. The customers need to be presented with this most viable product in a way that is to give them an indication of what the final product will look like. 

While some changes can happen to the procedure of steps being completed in this project, the process for each individual sprint usually goes like this:

1. Access the current status of the team and application
2. Create/Review requirements for iteration and beyond
3. Assign features to everyone within the team 
4. Develop code for all relevant features
5. Test all the code for individual features
6. Merge through pull requests all the different features of the iteration
7. Ensure functionality of all combined features in the main branch
8. Release the most viable product by deployment to Heroku
 
## BackEnd / Platform
As far as the backend of this application goes Ruby on Rails is being used. This means that the heavy-duty background code is written in the Ruby language by using the Rails framework. The version of Ruby being used in the backend is 2.6.6, while the version of Rails being used is 4.12.3. The Ruby on Rails backend is a very popular framework that has many benefits. It is not too difficult but is also very robust.

## Database
For this sprint, we have 3 database tables (shown in the diagram at the end). We have one that we use to store cards and different attributes about them such as the type of card(1 of spades, 2 of spades, etc), the face of the card, location of the card, the status of the card, and what table it is at. We also have a users table that stores the name of the user and a hashed version of their password. Lastly, we have a table it is used to connect the user table and the cards table. Currently, we don't use it in our execution but will in a later iteration. 


## Initial Lo-Fi sketches
#### A welcome page as it is important to properly introduce yourself to your users
![1](https://user-images.githubusercontent.com/41241522/97904547-45069280-1d06-11eb-97e7-9a544194f907.JPG)

#### Main lobby - It is important to allow many games to be played all at once, we are to manage sessions within a lobby. A session can be created, or simply just joined. One does need to have some credentials to be able to access someone else's session.
![2](https://user-images.githubusercontent.com/41241522/97904611-5e0f4380-1d06-11eb-8f1a-c29f33b3a6e1.JPG)

#### A session when created can be ended only by the session owner. The screen is split into 4 to allow up to 4 users. Your screen is top left and allows you to change draw cards, ask for cards etc.
![3](https://user-images.githubusercontent.com/41241522/97904655-6ff0e680-1d06-11eb-89c8-d94775edd649.JPG)

#### A user who joined someone else's session, should not be able to end that session
![4](https://user-images.githubusercontent.com/41241522/97904666-73846d80-1d06-11eb-9d85-dfe7b7a5e2d3.JPG)

## Low-Fi sketches in Sprint 3
#### First a welcome page. The user is able to Login or Sign Up. It is important for everyone to be recognizable within our system.
![S3-1](https://user-images.githubusercontent.com/41241522/101848850-1dcc8d80-3b1c-11eb-9e6e-f0cfebcf582f.JPG)

#### When an account is created the user needs to log in again to confirm the account creation and to actually be allowed inside of the application.
![S3-2](https://user-images.githubusercontent.com/41241522/101848894-3046c700-3b1c-11eb-80b9-cadbb9092473.JPG)

#### The user can join one of the many games that can be available within our system. Once joined the user can be greeted by other users and jump into their game.
![S3-3](https://user-images.githubusercontent.com/41241522/101848897-32108a80-3b1c-11eb-9010-d2439a0d8340.JPG)

## Demonstration of Application
#### Login/Sign Up page
<img width="2878" alt="Screen Shot 2020-12-11 at 3 49 24 PM" src="https://user-images.githubusercontent.com/41241522/101958979-0a77fb80-3bca-11eb-8fdf-e24fa0546807.png">

#### Sign Up page
<img width="2877" alt="Screen Shot 2020-12-11 at 3 49 43 PM" src="https://user-images.githubusercontent.com/41241522/101959004-1b287180-3bca-11eb-923e-f9e6db6a7685.png">

#### Lobby
<img width="2879" alt="Screen Shot 2020-12-11 at 3 50 01 PM" src="https://user-images.githubusercontent.com/41241522/101959136-5aef5900-3bca-11eb-8c7c-5ffa28e35575.png">

#### Create Table
<img width="2876" alt="Screen Shot 2020-12-11 at 4 02 07 PM" src="https://user-images.githubusercontent.com/41241522/101959082-427f3e80-3bca-11eb-8f37-40d21a4f28b1.png">

#### Game Board #1
<img width="2878" alt="Screen Shot 2020-12-11 at 3 52 22 PM" src="https://user-images.githubusercontent.com/41241522/101959156-6773b180-3bca-11eb-8368-c0d30b3dc2b4.png">

#### Game Board #2
<img width="2877" alt="Screen Shot 2020-12-11 at 3 52 42 PM" src="https://user-images.githubusercontent.com/41241522/101959192-76f2fa80-3bca-11eb-8302-2872278283d6.png">

#### Game Board #3
<img width="2878" alt="Screen Shot 2020-12-11 at 3 53 13 PM" src="https://user-images.githubusercontent.com/41241522/101959200-7b1f1800-3bca-11eb-9204-a4e3ab881662.png">

#### The user can play cards and see the cards other users play. The user has a lot of freedom to make decisions. A lot of features implemented are there to cover a wide variety of card games one could play. A user can log out to return back to the login/signup page.
![S3-4](https://user-images.githubusercontent.com/41241522/101848903-3472e480-3b1c-11eb-82d9-25b3563130c4.JPG)



## Introduction
For the 3rd and final sprint, the idea was to finish up the remaining code as soon as possible and polish as much of it before the deadline when done so. We can proudly say that we have achieved this. The application is in its final stages, with minor cosmetics yet to be finalized. Everything works and is, for the most part, implemented as imagined at the start of the project. The features needed for this sprint are all complete at this point and part of the application. Once a presentation is made for this project, the product will be deliverable.

## Process
In hindsight now, after completing the majority of the project one can take a look at how it all went procedure-wise. The project was indeed all about iterations. We as developers had to make changes relatively often, improvements or adjustments were made from iteration to iteration to bring us to this point of having an almost complete product. The agile development of this application allowed us to be fluid and adaptable, never dwelling on anything for too long. Things need to move forward consistently for everything to be finished in time.

With the project almost complete it might be a good time to bring up the process used for each sprint and how Sprint 3 is different. The below-shown talking points all refer to the overall procedure we went through on each sprint.

1. Access the current status of the team and application
2. Create/Review requirements for iteration and beyond
3. Assign features to everyone within the team 
4. Develop code for all relevant features
5. Test all the code for individual features
6. Merge through pull requests all the different features of the iteration
7. Ensure functionality of all combined features in the main branch
8. Release the most viable product by deployment to Heroku

The biggest addition and/or difference for the final sprint being the amount of time spent on testing and ensuring all features integrate together seamlessly. We needed to have higher standards for this iteration due to this being the iteration before the final product is due. As such we have had people test things to their breaking point many times over in an effort to remove any bugs that might occur. Testing through the RSpec and Cucumber was not enough for this iteration as we needed human feedback on how specific features feel before we could confidently make this a releasable product.
 
## BackEnd / Platform
Same information as for Sprint 2, not much has changed on this end. The backend and platform used are Ruby on Rails. This means that the heavy-duty background code is written in the Ruby language on the Rails framework. The version of Ruby being used in the backend is 2.6.6, while the version of Rails being used is 4.12.3. The Ruby on Rails backend is a very popular framework that has many benefits. It is not too difficult but is also very robust. Everyone on the team feels comfortable using this framework which makes it the ideal choice for this project.

## Database
Same information as for Sprint 2, not much has changed on this end. We have 3 database tables (shown in the diagram at the end). We have one that we use to store cards and different attributes about them such as the type of card(1 of spades, 2 of spades, etc), the face of the card, location of the card, the status of the card, and what table it is at. We also have a users table that stores the name of the user and a hashed version of their password. Lastly, we have a table it is used to connect the user table and the cards table. Currently, we don't use it in our execution but will in a later iteration. 

## Reflection of Features Completed

#### Lobby
The lobby was a very important feature coming into Sprint 3. We had an idea on how to implement it but did not have a lot of code for it. As such this feature was one that was worked on almost immediately after Thanksgiving break. We had one playable game that we under all circumstances needed to extend to multiple games. Having a lobby meant that this was going to possible. Working on it initially proved to be somewhat challenging, as working with the database as we had it was not very intuitive. Eventually, however, a few of our teammates managed to make this work so that we know have a lobby and an application that can host more than just one game.

#### New Game
Along with the lobby we needed to allow a user to create a game. The user should be able to create a new game and play with friends/family when so desired. This was just a matter to our database anytime a new game is created and removing from the database at any point a game is deleted. This feature works as expected and not many issues were encountered with it.

#### Opponent Hands
One of the things that we somewhat overlooked and pushed off in the initial stages of the project was the opponent and their cards. By the end of Sprint 2, we did not have a way for the user to see the opponent's cards or the amount of them. This was fixed in this sprint making the application much more appealing and usable. The application as it is now is fairly intuitive and this feature alongside all of the HTML work done has a lot to do with that. This feature is implemented and working great.

#### Select a Card
The Select a Card feature while implemented in the second sprint was finalized and implemented in this sprint. This feature allows people to whatever card they need from anywhere on the table. It is important to be able to pick a specific for special circumstance and that is exactly was this feature is doing. This feature is fully complete now.

#### Limit deck size
When creating a deck it is important to be able to limit its size. Not all games are played with the full deck, and sometimes it is necessary to play with a smaller deck. We have implemented this feature in an attempt to cover as much ground as possible with what the users want to do when playing a game of cards. This feature was implemented to be accessed whenever a new game is created. This feature works as expected.

#### The general CSS/HTML
This sprint required a lot of polishing to make our application look as needed. A lot of our time was spent on improving and modifying the CSS/HTML to fully represent all our ideas. This was not a feature so to say but was something that a lot of our time went into this sprint. While our views were not broken or bad before this sprint, we have used this sprint to improve upon them significantly. The CSS/HTML currently in our project is very close to what we expect to have for our final product.

## Problems/Issues faced in Sprint 3
Surprisingly enough Sprint 3 was the sprint we have had the least amount of trouble with. As things have started slowly coming together most of the hard work was done previously. Having said this we still faced minor issues with the lobby or the CSS, yet these were the issues we were able to resolve rather quickly. The further the project went along the more confident we became in our product, as such it not super surprising that this is the sprint with which we had the least amount of trouble with. The project proved to be a success in our opinion.

## SimpleCov Test coverage
For this project, we prided ourselves on having very high coverage. For most of the project, we tried to keep this coverage above 90%. To end things off we realized that we can get super close to 100% if we tried very hard. That said the coverage we managed to get this time around is above 99%. We ended up missing 2 lines, but in general most everything should be appropriately tested.

![MicrosoftTeams-image](https://user-images.githubusercontent.com/41241522/101999526-b4778680-3ca3-11eb-81c6-d1b0c665d5c2.png)

## Low-Fi Diagrams
### Update to match current progress. Will more closely match the final product
#### First a welcome page. The user is able to Login or Sign Up. It is important for everyone to be recognizable within our system.
![S3-1](https://user-images.githubusercontent.com/41241522/101848850-1dcc8d80-3b1c-11eb-9e6e-f0cfebcf582f.JPG)

#### When an account is created the user needs to log in again to confirm the account creation and to actually be allowed inside of the application.
![S3-2](https://user-images.githubusercontent.com/41241522/101848894-3046c700-3b1c-11eb-80b9-cadbb9092473.JPG)

#### The user can join one of the many games that can be available within our system. Once joined the user can be greeted by other users and jump into their game.
![S3-3](https://user-images.githubusercontent.com/41241522/101848897-32108a80-3b1c-11eb-9010-d2439a0d8340.JPG)

#### The user can play cards and see the cards other users play. The user has a lot of freedom to make decisions. A lot of features implemented are there to cover a wide variety of card games one could play. A user can log out to return back to the login/signup page.
![S3-4](https://user-images.githubusercontent.com/41241522/101848903-3472e480-3b1c-11eb-82d9-25b3563130c4.JPG)

## Demonstration of Application at end of Sprint 3 (Small visual changes notwithstanding)
#### Login/Sign Up page
<img width="2878" alt="Screen Shot 2020-12-11 at 3 49 24 PM" src="https://user-images.githubusercontent.com/41241522/101958979-0a77fb80-3bca-11eb-8fdf-e24fa0546807.png">

#### Sign Up page
<img width="2877" alt="Screen Shot 2020-12-11 at 3 49 43 PM" src="https://user-images.githubusercontent.com/41241522/101959004-1b287180-3bca-11eb-923e-f9e6db6a7685.png">

#### Lobby
<img width="2879" alt="Screen Shot 2020-12-11 at 3 50 01 PM" src="https://user-images.githubusercontent.com/41241522/101959136-5aef5900-3bca-11eb-8c7c-5ffa28e35575.png">

#### Create Table
<img width="2876" alt="Screen Shot 2020-12-11 at 4 02 07 PM" src="https://user-images.githubusercontent.com/41241522/101959082-427f3e80-3bca-11eb-8f37-40d21a4f28b1.png">

#### Game Board #1
<img width="2878" alt="Screen Shot 2020-12-11 at 3 52 22 PM" src="https://user-images.githubusercontent.com/41241522/101959156-6773b180-3bca-11eb-8368-c0d30b3dc2b4.png">

#### Game Board #2
<img width="2877" alt="Screen Shot 2020-12-11 at 3 52 42 PM" src="https://user-images.githubusercontent.com/41241522/101959192-76f2fa80-3bca-11eb-8302-2872278283d6.png">

#### Game Board #3
<img width="2878" alt="Screen Shot 2020-12-11 at 3 53 13 PM" src="https://user-images.githubusercontent.com/41241522/101959200-7b1f1800-3bca-11eb-9204-a4e3ab881662.png">

## Diagrams
#### Database diagram showcasing database tables and structure. This structure has not changed much or at all since our last sprint. The diagram is not affected by all the changes made in Sprint 3.
![image](https://user-images.githubusercontent.com/55667725/99748821-3d3b4200-2aab-11eb-8032-a7212ef81b4d.png)
