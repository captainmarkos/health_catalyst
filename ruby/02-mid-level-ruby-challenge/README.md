# Detecting new and changed patients

## Introduction
At Health Catalyst we process lots of patient data and healthcare records. One of the things that helps keep the processing efficient is knowing what patients have changed data on any given day.

In this challenge, you will create a change detection process for patient data.

In the `data` folder there are 2 file types `patients` and `clinical_activities`. Each type has 3 files, one for each of 3 days. This is meant to simulate files that would be received sequentially, one day after the other.

The total set of data for a given day should represent the accumulation of each day.

For example:
- Day 1 would represent the data from processing day 1
- Day 2 would represent the data from processing day 1, then day 2
- Day 3 would represent the data from processing day 1, then day 2, then day 3

The `answer-key` directory provides some hints about the records that can be expected for each day. Use that for reference, but have the code process the files in the `data` directory to complete the challenge.

## Setup
1. Run the following and ensure they execute successfully:
    1. `bundle install`
    1. `bundle install rspec`
    1. `ruby runner.rb`

## Challenge
1. Create an application invoked with `ruby runner.rb <day>` (see existing `runner.rb` file)
1. When valid input is provided, output the patient records that are new or changed for a given day
    1. A new or changed patient is defined as having any of the following:
        1. Having a new or changed record in the patients file for the day
        1. Having a record in the clinical_activities file for the day
1. Do not use a database for the implementation (not relational nor NoSQL)
    1. Otherwise, feel free to use gems and any code design you like
1. Optionally, leave notes and feedback (in `notes.md` and `feedback.md`)
1. Commit your changes, and include commit message(s) as if this was production code
