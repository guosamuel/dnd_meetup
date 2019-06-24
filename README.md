## NY DND
Dungeons and Dragons is a role-playing game played in person, in groups of four to six players (although group sizes may vary). NY DND is a web app that allows users to create and RSVP for game meetups in the greater New York City area. When a users RSVP to a meetups they indicate which character they will play in the campaign. If a user creates a new campaign, he will be assigned the role of Dungeon Master for all associated meetups. All of a user's upcoming meetups and information about her corresponding characters are conviently displayed on the profile page. It should be noted that the application does not currently include any geolocation functionality and the choice to focus on the local area was made to keep the scope of the project small.

## Background
NY DND was created as a part of the immersive web development program at Flatiron School in 2019 by John Agens and Sam Guo. We saw a need for players to be able to both arrange meetups as well as keep track of relevant game information at the same time.
 
## Screenshots
![image](https://user-images.githubusercontent.com/19267312/60039894-c6b3ce00-9685-11e9-8b83-d1dbe04c2477.png)

![image](https://user-images.githubusercontent.com/19267312/60040044-1a261c00-9686-11e9-9379-86a610c58b1b.png)

## Tech/framework used

<b>Built with</b>
- [Ruby on Rails](https://rubyonrails.org/)

## Important Features
* Custom validations for models to ensure that the application would mirror the game’s rules.
* Used Bootstrap 4 and custom CSS to make a mobile-responsive user interface.

## Installation
Clone down the responsitory in your terminal.

`$ git clone <project url>`
Navigate into the directory.

`$ cd dnd_meetup/`

Run `$ bundle install`

To setup the database run `$ rails db:setup`

To migrate the schema run `$ rails db:migrate`

## Tests
I wrote some model tests for the project in the **spec/models** directory on the <b>rspec-tests</b> branch. You should be able to run the tests with the `$ rspec` command. If they don't work try running `$ rails db:setup` and `$ rails db:migrate`. I the project was initially built using an SQLite3 database, but I had to reconfigure it to use Postgres in order to [depoly](https://safe-hollows-92302.herokuapp.com/login) the project to Heroku. So be aware there may be some configuration misalignments remaining if you choose to clone down this repo.

Here's a [blog post](https://medium.com/@johntagens/writing-model-tests-for-my-rails-app-f1380b0965c0) I made about my experience writing the tests.
