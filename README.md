# SurveyHub

## Dependencies

- Ruby 3
- Rails 7
- SQLite
- RSpec

## Installation

To install Ruby and Node versions with [ASDF][]:

```shell
asdf install ruby
asdf install nodejs
```

To install required dependencies and prepare the database:

```shell
bin/setup
```

## Development

To start the development server using foreman, issue `bin/dev` and navigate to
[http://127.0.0.1:5000](http://127.0.0.1:5000):

```shell
bin/dev
```

## Testing

```shell
% PRINT_COVERAGE=t bin/rspec
........................

Finished in 0.77 seconds (files took 3.23 seconds to load)
24 examples, 0 failures


COVERAGE: 100.00% -- 76/76 lines in 9 files
```

[asdf]: https://github.com/asdf-vm/asdf
