
**App URL** ​ - ​[https://graph-it-live.herokuapp.com/](https://graph-it-live.herokuapp.com/)
Demo credentials:
Email: ​demo@demo.com
Password: demo

Stack - Ruby on Rails, Javascript

Database - Postgres

Background Jobs - Resque

Memory store - Redis

Storage - AWS S3 

Server - Heroku (Ruby + ffmpeg builpacks)

Mailer - SendGrid

Dropzone for file drag and drop

3rd party APIs used
- Google maps Javascript API for location autocomplete and for fetching latitude, longitude
coordinates
- TinyGraphs - for randomized user profile pictures

Screenshots here : https://docs.google.com/document/d/1muk4VsvnzgIsao4TR09QWoLhD2yNk9EEeW0ID5ngraM/edit?usp=sharing

-----
- You can also sign up for a new account. (You should verify your email through a confirmation link
for account confirmation)
- User authentication - Sign in , sign up, Email verification , Edit profile, Cancel account. Randomly generated user avatars using TinyGraphs
-  Images and videos are initially uploaded to S3. Later background workers process and resize the images and videos. Images to 1200 x 600 , 600 x 300 (for thumbnails). Videos to 480x and 240px. Original uploads are also preserved.
-  ‘My stories’ section displays users' own stories. ‘Explore’ section displays stories by other users
-  Each story has the following field - Title, description, location (along with latitude, longitude), type(image/video), attachment, timestamps
- Stories can be created, updated, deleted.
-  Redis + resque for background image and video processing .Resque dashboard can be accessed here -
[https://graph-it-live.herokuapp.com/resque_web](https://graph-it-live.herokuapp.com/resque_web)
- Tests - basic controller and model tests using Rspec + FactoryBot

------


