# Varsity Tutors Rails challenge

App where you can signup for the SOLEPOP beverage. Enjoy!



### Before Installation
Download the latest:
- Rails
- Ruby
- Mysql server
- *Set the environmental variable DB_PASSWORD so Rails can run migrations on your database.

*If you have any trouble connecting with your database, delete and include your own database.yml file that has your credentials.

### Installation

Clone the project from github:

```sh
git clone git@github.com:sbrmnn/varsity_tutor_app.git
```
Change directory to the root of the project.
```sh
cd varsity_tutor_app
```
Run migration on database
```sh
rake db:setup
```
Run bundle install
```sh
bundle install
```
Start the server
```sh
rails s
```

Go to localhost:3000 in your browser and then violia!

### Sidenote:
If you want to simulate the pusher element, run the rails server and visit localhost:3000 in your browser. Then open another terminal session and then change the directory to the varsity_tutor_app.

```sh
cd varsity_tutor_app
```
and then run
```sh
rake purchase_order:create
```
You should see pusher updating the purchaser table along with the purchase count.

#### Thanks for looking at the app :-)
