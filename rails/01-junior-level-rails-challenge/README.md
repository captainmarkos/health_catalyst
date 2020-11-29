# Create a CRUD application

## Introduction
At Health Catalyst, we handle a lot of healthcare data for partners and customers. A partner could be a large healthcare association or system. A customer can be as small as a single provider practice and as large as a regional or national hospital system.

All of our customers have patients, and all of our partners are made up of one or many customers.

In this challenge, update a skeleton rails application to allow create, update, and read operations on partners and customers. The patient records should not have any write operations from the web application (patient data is provided in a seed file), and when viewed they should be scoped on a partner or customer.

Additionally, the patient records should be exportable (as a CSV) a record should be kept of those exports, including this information:
- When the export started, ended, and its duration
- If the export succeeded, failed, or if it is still running
- The number of lines/records in the export

The data tracked for the exports (listed above) should be viewable in the web application as well.

## Details
- A partner has a name and location and many customers
- A customer has a name and a location and many patients
- The patient data is provided in a CSV file, and running `rails db:seed` will load this data into the database
- An export should have a start time, end time, duration, status, and the associated customer or partner (that the export was created for)

The CSV data for patients includes a `customer_external_id` field. Use this to map/associate patient records to a customer record (which is NOT provided in the seed file - create those on your own and add to the `db:seed` process).

There are some things in these requirements that are not 100% defined. This is representative of what you are likely to experience on the job. Use discretion and make decisions to fill in any requirements gaps. There is not one right answer to this implementation.

## Setup
1. Ensure that `ruby` and `bundler` are installed on your machine
1. Inside the `patient-app` directory, execute the following commands and ensure each one succeeds (and does not report failures/errors):
   1. `bundle install`
   1. `bundle exec rails db:setup`
   1. `bundle exec rails db:seed`
   1. `bundle exec rspec`
1. Run `bundle exec rails s` then goto http://localhost:3000/ to ensure the server is running
1. Run `bundle exec rails c` to ensure you can run a rails console
   1. Inside the console execute `Patient.first` to ensure the database setup worked correctly and you see a patient instance returned (not `nil` or an error)

## Challenge
1. Update the existing rails web application (in `patient-app` subdirectory) that meets the requirements listed above
1. Create at least one model test and at least one request test in RSpec for the application
1. Write code that executes with `rails db:seed` that will enable someone to test your application without needing to create additional data for partners, customers, or patients
1. Optionally, leave notes and feedback (in `notes.md` and `feedback.md`)
1. Commit your changes, and include a commit message as if this was production code
