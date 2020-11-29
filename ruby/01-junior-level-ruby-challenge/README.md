# Parsing CSV Headers

## Introduction
In our codebase, we often need to parse CSV headers from a file. Some parts of our code experienced a bug that we did not have an RSpec test for.

The error displayed in our bug tracker was:
```
NoMethodError: undefined method `map' for nil:NilClass
```

## Setup
1. From this directory, run `bundle install`
1. Ensure that `bundle exec rspec` works and reports no failures or errors

## Challenge
1. Add an RSpec test to the that recreates the error
2. Implement a change the fixes the bug
3. Commit your changes, and include a commit message as if this was production code
