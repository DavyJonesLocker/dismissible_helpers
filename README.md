# DismissibleHelpers #

[![Build Status](https://secure.travis-ci.org/dockyard/dismissible_helpers.png?branch=master)](http://travis-ci.org/dockyard/dismissible_helpers)
[![Code Climate](https://codeclimate.com/badge.png)](https://codeclimate.com/github/dockyard/dismissible_helpers)



## Installation ##

In your Gemfile add the following:

```ruby
gem 'dismissible_helpers'
```

## Usage ##

### Default Behavior ###

By default, DismissibleHelpers will use cookies to track the state of
the dismissed helpers. 

### Using authenticated user ###

DismissibleHelpers will store the dismissed helpers on a model. The
model should have an attribute called `dismissed_helpers` which should
be an array type. You can use ActiveRecord's serialization to achive
this:

 1 Add this `dismissed_helpers` column as a `text` column

```ruby
class AddDismissedHelpersToAccounts < ActiveRecord::Migration
  def up
    add_column :accounts, :dismissed_helpers, :text
  end

  def down
    remove_column :accounts, :dismissed_helpers
  end
end
```

 2 Add the serization call to the model

```ruby
class Account < ActiveRecord::Base
  serialize :dismissed_helpers, Array
end
```

If you are using PostgreSQL as your database, you could use
`postgres\_ext` to add native array support to your models. You would
just need the following migration to add the dismissed_helpers attribute
to your model:

```ruby
class AddDismissedHelpersToAccounts < ActiveRecord::Migration
  def up
    add_column :accounts, :dismissed_helpers, :string, :array => true
  end

  def down
    remove_column :accounts, :dismissed_helpers
  end
end
```

Your model does not need to be called Account, it just needs the
`dismissed\_helpers` attribute.



If the helper method `current_account` is available, DismissibleHelpers
will use this to retrieve the current user/account. If the current user
has an attribute


## What you get ##


## Authors ##

[Dan McClain](http://twitter.com/_danmcclain)

[We are very thankful for the many contributors](https://github.com/dockyard/dismissible_helpers/graphs/contributors)

## Versioning ##

This gem follows [Semantic Versioning](http://semver.org)

## Legal ##

[DockYard](http://dockyard.com), LLC &copy; 2012

[@dockyard](http://twitter.com/dockyard)

[Licensed under the MIT license](http://www.opensource.org/licenses/mit-license.php)
