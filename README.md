# Chop URL :hocho: :sweet_potato:

Chop URL is a URLs shortener web application build in Ruby on Rails under a Rest API architecture.


## Setup

### Required
Make sure that you have installed the next:
- Git
- Ruby Lang
- Ruby on Rails (Framework)
- PostgreSQL
- Postman (Optional)

### Steps

**1) Clone the repo**

    $ git clone https://github.com/Pablo251/chop-url.git

**2) Install dependencies**
Once you have been cloned the repository to your local machine, then move into the project folder and then execute the next command:

    $ bundle install

**3) Run Migrations**
Then we need to create our database and run the migrations that will define the structure of the tables, fields, etc.

    $ rake db:create
    $ rake db:migrate

**4) Bootstraping/Start up**
Now the project is set, for start and run it use the next command:

    $ rails s
## Usage
The API has three endpoints
|VERB|  Endpoint| Definition |
|--|--|--|
|POST| /sites  | Creates a new short URL, and return the shortened URL |
|GET| /top_trending_sites| Returns the 100 most requested URLs to be shortened
|GET| /go/`Shortened_URL_Code` | Redirect you to the shortened URL

## Others
The project includes two postman collection for testing. One for local testing and the other for live testing in Heroku were the application demo is currently running

You can find it in the **PostMan Collections** folder.
