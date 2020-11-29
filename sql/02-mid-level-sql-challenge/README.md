# SQL Challenge 2
**Pending**
This should be harder than the first challenge, but easier than the last.
Ideas/Potential:
- Database design question(s) (e.g. recreate the measures library ERD given certain requirements)
- Recreate the Active Provider Export performance issue
- Adapt the Active Patient Count performance issue
- Recreate the customer data volumes slowness (on greenway-prod)

## Introduction
At Health Catalyst, we import and analyze data for providers, patients, and laboratory_tests (among many other things). For this challenge, after loading the provided csv data into a postgresql database, you will write SQL queries based on the questions asked in the "Challenge" section below.

There are some things in these requirements that are not 100% defined. This is representative of what you are likely to experience on the job. Use discretion and make decisions to fill in any requirements gaps. There is not one right answer to this implementation.

## Challenge
1. Load the data from the CSVs into database tables in a postgresql database
    1. You can optionally add additional columns, and any database objects you like. If you do, please include the scripts/code used.
1. Write a query that returns rows of all patients without a laboratory test and all laboratory tests without a patient.
1. Write a query that returns rows of all providers that don't have a patient with:
    1. At least one laboratory test.
    1. At least two laboratory tests
    1. At least one laboratory test with a negative result in the last 365 days
1. Write a query that returns all patients with their latest laboratory test result, sort the result set by the laboratory test start_datetime
1. Take the query from the previous step and modify it to filter by a `result` above `7.5`
1. Optionally, leave notes and feedback (in `notes.md` and `feedback.md`)
1. Commit your changes, and include a commit message as if this was production code
