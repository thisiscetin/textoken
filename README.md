# [Textoken](//github.com/manorie/textoken)

[![Build Status](https://travis-ci.org/manorie/textoken.svg?branch=development)](https://travis-ci.org/manorie/textoken?branch=development)
[![Coverage Status](https://coveralls.io/repos/manorie/textoken/badge.svg?branch=development&service=github)](https://coveralls.io/github/manorie/textoken?branch=development)
[![Code Climate](https://codeclimate.com/github/manorie/textoken/badges/gpa.svg)](https://codeclimate.com/github/manorie/textoken)
[![Dependency Status](https://gemnasium.com/manorie/textoken.svg)](https://gemnasium.com/manorie/textoken)

Textoken is a Ruby library for text tokenization. This gem extracts words from text with many customizations. It can be used in many fields like crawling and Natural Language Processing.

## Basic Usage

```ruby
require 'textoken'

Textoken('Software is like sex: it\'s better when it\'s free. \'Linus Tolvards\'').tokens
# => ["Software", "is", "like", "sex", ":", "it", "'", "s", "better", "when", "it", "'", "s", "free", ".", "'", "Linus", "Tolvards", "'"]

Textoken('Oh, no! Alfa is at home.').tokens
# => ["Oh", ",", "no", "!", "Alfa", "is", "at", "home", "."]

Textoken('Oh, no! Alfa is at home.').words
# => ["Oh,", "no!", "Alfa", "is", "at", "home."]
```

## Customization

```ruby
require 'textoken'

Textoken('Oh, no! Alfa is at home.', only: 'punctuations').tokens
# => ["Oh", ",", "no", "!", "home", "."]

Textoken('Oh, no! Alfa is at home.', only: 'punctuations', more_than: 3).tokens
# => ["home", "."]

Textoken('Oh, no! Alfa is at 01/01/2000.', only: 'dates, numerics').words
# => ["01/01/2000."]
```

You can combine all options.
Options support multiple option values like only: 'punctuations, dates, numerics'

## Current Options

only:       accepts any regexp defined in option_values.yml.
exclude:    accepts any regexp defined in option_values.yml.
less_than:  accepts any integer bigger than 1
more_than:  accepts any positive integer

only_regexp, exclude_regexp and part-of-speech options are on the agenda.

## Installation

Add this line to your application's Gemfile:

    gem 'textoken'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install textoken


## Supported Ruby Versions

This library aims to support and is tested against the following Ruby
implementations:

* Ruby 1.9.3
* Ruby 2.0.0
* Ruby 2.1
* Ruby 2.2

If something doesn't work on one of these versions, it's a bug.
This library may also work (or seem to work) on other Ruby versions or implementations, however support will only be provided for the implementations listed above.

## Contributing

Feel free to add any regepx to lib/regexps/option_values.yml but please add a simple test to 'single options' part at textoken_spec.rb

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
