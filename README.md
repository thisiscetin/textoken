# [Textoken](//github.com/manorie/textoken)

[![Build Status](https://travis-ci.org/manorie/textoken.svg?branch=development)](https://travis-ci.org/manorie/textoken?branch=development)
[![Coverage Status](https://coveralls.io/repos/manorie/textoken/badge.svg?branch=development&service=github)](https://coveralls.io/github/manorie/textoken?branch=development)
[![Code Climate](https://codeclimate.com/github/manorie/textoken/badges/gpa.svg)](https://codeclimate.com/github/manorie/textoken)
[![Dependency Status](https://gemnasium.com/manorie/textoken.svg)](https://gemnasium.com/manorie/textoken)
[![Gem Version](https://badge.fury.io/rb/textoken.svg)](http://badge.fury.io/rb/textoken)

Textoken is a Ruby library for text tokenization. This gem extracts words from text with many customizations. It can be used in many fields like Web Crawling and Natural Language Processing.

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

Textoken('Oh, no! Alfa is at home.', exclude: 'punctuations', more_than: 3).tokens
# => ["Alfa"]

Textoken('Oh, no! Alfa is at 01/01/2000 with $1000.', only: 'dates, numerics').words
# => ["01/01/2000", "$1000."]

Textoken('Oh, no! Alfa 2000 is at home.', only_regexp: '^[0-9]*$').tokens
# => ["2000"]
```

You can combine all options. 'Only' and 'Exclude' Options support multiple option values like **only: 'punctuations, dates, numerics'**

Public interface of Textoken presents two methods, **tokens** & **words**

```ruby
Textoken('Alfa.').tokens
# => ["Alfa", "."]
# => splits punctuations by default whereas,

Textoken('Alfa.').words
# => ["Alfa."]
# => does not split punctuations.
```

## Current Options

- **only:** Accepts any regexp defined in [option_values.yml](//github.com/manorie/textoken/blob/development/lib/textoken/regexps/option_values.yml)

- **only_regexp:** Accepts any regexp but only one regexp can be given.

- **exclude:** Accepts any regexp defined in [option_values.yml](https://github.com/manorie/textoken/blob/development/lib/textoken/regexps/option_values.yml)

- **exclude_regexp** Accepts any regexp but only one regexp can be given.

- **less_than:** Accepts any integer bigger than 1.

- **more_than:** Accepts any positive integer.

## Option Meanings

- **only:** If a word in text consist of a regexp or regexps, only option includes it in result.

- **only_regexp:** If a word in text consist of user given regexp, only_regexp option includes it in result.

- **exclude:** If a word in text does not have a regexp at some part, exclude option excludes it from result. Opposite of only.

- **exclude_regexp:** If a word in text does not have user given regexp at some part, exclude option excludes it from result. Opposite of only_regexp.

- **less_than:** Filters result by the word length less than the option value given.

- **more_than:** Filters result by the word length bigger than the option value given.


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

* Ruby 2.0.0
* Ruby 2.1
* Ruby 2.2.5
* Ruby 2.3.1
* [JRuby](http://jruby.org/)

If something doesn't work on one of these versions, it's a bug.
This library may also work (or seem to work) on other Ruby versions or implementations, however support will only be provided for the implementations listed above.

## Contributing

Feel free to add any regepx to lib/regexps/option_values.yml but please add a simple test to 'single options' part at textoken_spec.rb

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
