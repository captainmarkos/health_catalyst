### Notes

From the `Setup` in README.md

1. Run the following and ensure they execute successfully:
    1. `bundle install`
    1. `bundle install rspec`
    1. `ruby runner.rb`

```
> bundle install rspec
ERROR: "bundle install" was called with arguments ["rspec"]
Usage: "bundle install [OPTIONS]"
```
Did you mean run `bundle exec rspec`?


## Code Coverage Report

The `simplecov` gem is used to produce a code coverage report.  To generate and
view the code coverage report:
```
bundle exec rspec

open coverage/index.html
```

Here's a [screenshot](https://www.screencast.com/t/AgklsJcKGDg) of latest code
coverage report.
