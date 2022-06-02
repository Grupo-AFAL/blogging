# Blogging
Blogging will help you easily add blog functionality to your Rails application.

# Prerequisites
- Install `vips` (https://www.libvips.org/install.html)
- `ActionText` must be configured (https://edgeguides.rubyonrails.org/action_text_overview.html)
- `Mobility` (https://github.com/shioyama/mobility) 
- `Friendly Id` (https://github.com/norman/friendly_id/)
- `Friendly Id mobility` (https://github.com/shioyama/friendly_id-mobility)
- A `Post` belongs to an `author`. So, host application must provide a model to use as an `author`. Default model is `User`.

# Installation
Add this line to your application's Gemfile:

```ruby
gem "blogging"
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install blogging
```

Generate migration files:
```bash
$ rails blogging:install:migrations
```

Run migrations:
```bash
$ rails db:migrate
```

Add this line to your applications's routes file (`routes.rb`):
```ruby
mount Blogging::Engine => '/blog'
```

# Configure Author model
Add an initializer to your Rails application, i.e. `config/initializers/blogging.rb`
```ruby
Blogging.config do |config|
  config.author_class = 'Person'
  config.authors = -> { Person.all }
  config.author_name = lambda { |author| author.name }
end
```

# Overwrite admin controllers permissions
- Create `app/policies/blogging/post_policy.rb`
- Then add your own rules:
```ruby
module Blogging
  class PostPolicy < ApplicationPolicy
    def index?
      # Custom rule
    end

    def show?
      # Custom rule
    end

    def create?
      # Custom rule
    end

    def new?
      # Custom rule
    end

    def update?
      # Custom rule
    end

    def edit?
      # Custom rule
    end

    def destroy?
      # Custom rule
    end
  end
end
```

- Create `app/policies/blogging/tag_policy.rb`
- Then add your own rules:
```ruby
module Blogging
  class PostPolicy < ApplicationPolicy
    def index?
      # Custom rule
    end

    def show?
      # Custom rule
    end

    def create?
      # Custom rule
    end

    def new?
      # Custom rule
    end

    def update?
      # Custom rule
    end

    def edit?
      # Custom rule
    end

    def destroy?
      # Custom rule
    end
  end
end
```

# License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
