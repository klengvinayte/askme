# AskMe

Ruby on Rails AskMe. An application where you can ask questions and get answers.

* Ruby version: 3.1.2
* Ruby on Rails version: 7.0.4
* Database adapter: SQLite3

Before starting, run:

```
$ bundle
```

Next you need to configure `.env`


Then run the commands:

```
$ rails db:migrate
```

Run app:

```
$ rails s
```

### Production

In the production environment, add to `.env`:

```
database_username: #Your databse username
database_password: #Your datatbase password
```
