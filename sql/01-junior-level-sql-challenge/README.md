# Patients and Providers

## Introduction
At Health Catalyst we handle data for patients and providers. In this challenge, you will create some SQL queries to answer various questions about the patient and provider data included.

The link between the columns that link the tables are: `patients.provider_external_id` and `providers.external_id`.

## Setup
1. Ensure you have postgresql installed on your machine (version 12 is preferred but the challenge should work with versions 10-12)
1. Create a database to use, or use the default for you postgresql install
1. Run `psql -d <name_of_your_database> -f patients_and_providers_dump.sql`
1. Make sure the following queries return results:
  1. `SELECT * FROM patients;`
  1. `SELECT * FROM providers;`

## Challenge
1. Write SQL queries that return the sets of data listed below and record in `queries.sql`
   1. All patients, and the family name of their provider
   1. All providers and the count of their patients
   1. All providers that don't have any patients
   1. All providers and a count of all their patients over 55 years of age
1. Optionally, leave notes and/or feedback (in `notes.md` and `feedback.md`)
1. Commit your changes, and include a commit message as if this was production code
