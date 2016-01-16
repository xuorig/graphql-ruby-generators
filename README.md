# Graphql-Ruby Generators

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'graphql-ruby-generators'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install graphql-ruby-generators

## Usage

To create a single GraphQL Type, use rails generate `graphql:type attributes[:type]`.

For example, to create a `PostType` run the generator this way:

```
  rails generate Post "A blog post" id:Id title:String body:String comments:[CommentType]
```

This should generate the file `app/graph/post_type.rb` with this content:
```ruby
PostType = GraphQL::ObjectType.define do
  name "Post"
  description "A blog post"

  field :id, !types.ID
  field :title, !types.String
  field :body, !types.String
  field :comments, types[!CommentType]
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/xuorig/graphql-ruby-generators. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

