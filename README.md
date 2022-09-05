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

To start the development server using foreman, issue `bin/dev` and navigate to http://0.0.0.0:5000:

```shell
bin/dev
```

[asdf]: https://github.com/asdf-vm/asdf
