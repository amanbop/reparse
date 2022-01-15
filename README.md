# Reparse

A simple gem to parse a text file. The output is a hash containing the words along with their frequency count.


Run `bin/console` for an interactive prompt.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'reparse'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install reparse

## Usage

```ruby
parser = Reparse.new
parser.input_text = 'Our customer is an important agtech startup looking for developers to join their journey to change farming.

Requirements:

Good English skills (spoken and written)

Good experience with Ruby On Rails for backend use.

React and state management libraries like Mobx, MST or recoil.

Writing HTML, CSS, and JavaScript (and Ideally Typescript). Being up on latest practices is a must, e.g., HTML5, CSS3, and ECMAScript 6 (minimum)

Database design and management, including being up on the latest practices. Especially the use of PostgresSQL.

Server management and deployment for the relevant environment and basic Linux skills.

Familiarity with CSS preprocessors, frameworks, bundlers, and associated languages/syntaxes/libraries (e.g., Sass, Tailwindcss..)

Experience implementing testing platforms and unit tests

Proficiency with Git and the Github Flow.

Understanding of the concept of CI/CD pipelines.

Appreciation for clean, simple and well documented code. Understanding of the KISS concept.

You know what a Kanban is and how to use it.';

parser.word_scrub_list = ['use']
parser.punctuation_scrub_list = ['|']

parsed_text = parser.parse

puts parsed_text


=================

{"management"=>3, "concept"=>2, "Understanding"=>2, "eg"=>2, "practices"=>2, "latest"=>2, "up"=>2, "CSS"=>2, "skills"=>2, "Good"=>2, "it"=>1, "how"=>1, "Kanban"=>1, "what"=>1, "know"=>1, "You"=>1, "KISS"=>1, "code"=>1, "documented"=>1, "well"=>1, "simple"=>1, "clean"=>1, "Appreciation"=>1, "pipelines"=>1, "CI/CD"=>1, "Flow"=>1, "Github"=>1, "Git"=>1, "Proficiency"=>1, "tests"=>1, "unit"=>1, "platforms"=>1, "testing"=>1, "implementing"=>1, "Experience"=>1, "Tailwindcss"=>1, "Sass"=>1, "languages/syntaxes/libraries"=>1, "associated"=>1, "bundlers"=>1, "frameworks"=>1, "preprocessors"=>1, "Familiarity"=>1, "Linux"=>1, "basic"=>1, "environment"=>1, "relevant"=>1, "deployment"=>1, "Server"=>1, "PostgresSQL"=>1, "Especially"=>1, "being"=>1, "including"=>1, "design"=>1, "Database"=>1, "minimum"=>1, "6"=>1, "ECMAScript"=>1, "CSS3"=>1, "HTML5"=>1, "must"=>1, "Being"=>1, "Typescript"=>1, "Ideally"=>1, "JavaScript"=>1, "HTML"=>1, "Writing"=>1, "recoil"=>1, "or"=>1, "MST"=>1, "Mobx"=>1, "like"=>1, "libraries"=>1, "state"=>1, "React"=>1, "backend"=>1, "Rails"=>1, "Ruby"=>1, "experience"=>1, "written"=>1, "spoken"=>1, "English"=>1, "Requirements"=>1, "farming"=>1, "change"=>1, "journey"=>1, "their"=>1, "join"=>1, "developers"=>1, "looking"=>1, "startup"=>1, "agtech"=>1, "important"=>1, "customer"=>1}
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/reparse. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/reparse/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Reparse project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/reparse/blob/master/CODE_OF_CONDUCT.md).
