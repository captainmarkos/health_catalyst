# README

### Ruby version

ruby-2.6.3


### Database

Install and initialize postgres (if needed).
```
brew install postgres

postgres --version
postgres (PostgreSQL) 11.5

initdb /usr/local/var/postgres
```

Manually start postgres.
```
pg_ctl -D /usr/local/var/postgres start
```

Create development and test databases
```
createdb data_import_app_development
createdb data_import_app_test

```

Install pg driver:
```
gem install pg -- --with-pg-config=/usr/local/bin/pg_config
```

References:
https://www.robinwieruch.de/postgres-sql-macos-setup

### Configuration

```
bundle install
```

Run database migrations.
```
rails db:migrate
```

Seed the database with mock data.
```
rails db:seed
```

Connect to postgres via command line and view seed data.
```
psql data_import_app_development

data_import_app_development=# select * from partners;
data_import_app_development=# select * from customers;
data_import_app_development=# select * from imports;
```

### Linter / Tests

Run the rubocop linter.
```
rubocop
```

Run all the tests.
```
bundle exec rspec
```

### Run the application
```
rails server
```

List of imports:
http://0.0.0.0:3000/imports

List of Customers:
http://0.0.0.0:3000/customers
