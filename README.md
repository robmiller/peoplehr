# peoplehr

[PeopleHR](http://www.peoplehr.com/) is an online system for managing
your organisation’s HR issues.

It offers an API for manipulating that information — either to pull
information out of it, or to modify what’s there. This can be useful for
things like creating telephone directories, pulling employees’ birthday
dates into a calendar, and lots of other things besides.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'peoplehr'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install peoplehr

## Usage

At the moment, the library can be used only to fetch employee data.

The `Employees` class functions as a repository, with finder methods to
restrict the data returned. Use `Employees#all` to get data for all
employees:

	api = PeopleHR::API.new(api_key: "abc123abc123")
	employees = PeopleHR::Employees.new(api: api)

	employees.all

This returns an array of `Employee` objects, each of which contains the
information stored in PeopleHR for that particular employee. To iterate
over employees, you can just use `Employees#each`:

	employees.each do |employee|
		puts "#{employee.first_name} #{employee.last_name}"
		puts "Birthday: #{employee.date_of_birth}"
	end

This allows the use of `Enumerable` methods to filter employees:

	bob_smith = employees.find { |e| e.first_name == "Bob" && e.last_name == "Smith" }
	
	older_than_50 = employees.select { |e| Date.today - e.date_of_birth > (365*50) }
	
	everyone_but_designers = employees.reject { |e| e.department == "Design" }

## Development

After checking out the repo, run `bin/setup` to install dependencies.
Then, run `rake spec` to run the tests. You can also run `bin/console`
for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake
install`. To release a new version, update the version number in
`version.rb`, and then run `bundle exec rake release`, which will create
a git tag for the version, push git commits and tags, and push the
`.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at
https://github.com/[USERNAME]/peoplehr. This project is intended to be
a safe, welcoming space for collaboration, and contributors are expected
to adhere to the [Contributor Covenant](contributor-covenant.org) code
of conduct.


## License

The gem is available as open source under the terms of the [MIT
License](http://opensource.org/licenses/MIT).

