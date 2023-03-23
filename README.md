# AskMe

Ruby on Rails AskMe. An application where you can ask questions and get answers.

* Ruby version: 3.1.2
* Ruby on Rails version: 7.0.4
* Database adapter: SQLite3

Before starting, run:

```
$ bundle
```


Then run the commands:

```
$ rails db:migrate
```

Run app:

```
$ rails s
```

### Database in production

In the `production` environment, you must specify the database login and password in the environment variables `PG_DATABASE`, `PG_USER` and `PG_RASSWORD` or specify explicitly in `.env`

```
production:
  adapter: postgresql
  user: <%= ENV['PG_USER'] %>
  password: <%= ENV['PG_RASSWORD'] %>
  database: <%= ENV['PG_DATABASE'] %>
```