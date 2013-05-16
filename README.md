# DismissibleHelpers #

[![Build Status](https://travis-ci.org/dockyard/dismissible_helpers.png?branch=master)](https://travis-ci.org/dockyard/dismissible_helpers)
[![Code Climate](https://codeclimate.com/github/dockyard/dismissible_helpers.png)](https://codeclimate.com/github/dockyard/dismissible_helpers)



## Installation ##

In your Gemfile add the following:

```ruby
gem 'dismissible_helpers'
```

## What you get ##

## Usage ##

DismissibleHelpers includes:

  * DismissibleHelpers View Helper - Renders the helper only if the
visitor has not dismissed it
  * DismissedHelpers Routes and controller - Handles the JavaScript
requests to store the dismissal state
  * DismissedHelpers Javascript - Handles the front end interactions
with the helpers

### Default Behavior ###

By default, DismissibleHelpers will use cookies to track the state of
the dismissed helpers.

### Adding a dismissible helper to your page ###

To add a dismissible helper to the page, call
`render_dismissible_helper`. This helper method will only display the
help text if it has not been dismissed by the user.

#### Without a block

The string passed to the method will be processed by the I18n method `t`, so the content of the help message should be stored in your localization file.

```erb
<h2>Sample Page</h2>
<%= render_dismissible_helper 'sample_page.help_text' %>
```

#### With a block

The string passed to the method will be used as a key, to track whether or not the user has dismissed it. The contents of the block will appear inside the dismissible div. This is particularly useful if you want to have a more complex structure in the block.

```erb
<%= render_dismissible_helper 'how_to_buy' do %>
  <h2>How to buy stuff</h2>
  <p>To buy stuff, click look at this:</p>
  <img src="http://domain.com/img.jpg">
<% end %>
```

#### Restoring helpers

You can allow users to restore a helper if you pass `restorable: true` as an argument after the name of the helper.

```erb
<%= render_dismissible_helper 'how_to_buy', restorable: true do %>
  <h2>How to buy stuff</h2>
  <p>To buy stuff, click look at this:</p>
  <img src="http://domain.com/img.jpg">
<% end %>
```

This will allow the user to hide the helper, as well as display a restore link to display the helper again.

### Including the routes ###

Add `dismissible_helpers_routes` to your `config/routes.rb` file.

### Including the JavaScript ##

Add the following to your `app/assets/javascripts/application.js`

```javascript
// Your other require file statements
//= require dismissible_helpers

$(function(){
  $('.dismissible').dismissible(); //The view helper applies a
                                   //'dismissible' class to each helper div
});
```

By default, the dismissed helper is removed from the page via
`$().remove()`. This can be customized by passing a callback to the
`.dismissible()` call. To use jQuery's `.slideUp()` you would use the
following call'

```javascript
$(function(){
  $('.dismissible').dismissible({
    dismiss: function(helper){
      helper.slideUp(); //'helper' is the jQuery-wrapped element
    }
  });
});
```

If you are working with restorable helpers the helper will be hidden instead
and a show link will be revealed.
There's a second callback when the show event was invoked as well.

```javascript
$(function(){
  $('.dismissible').dismissible({
    dismiss: function(helper){
      helper.slideUp(); //'helper' is the jQuery-wrapped element
    },
    show: function(helper){
      helper.slideDown();
    }
  });
});
```

### Using authenticated user ###

DismissibleHelpers will store the dismissed helpers on a model.
If the helper method `current_user` is available, DismissibleHelpers
will use this to retrieve the current user/account.

The model should have an attribute called `dismissed_helpers` which should
be an array type. You can use ActiveRecord's serialization to achieve this:

First add this `dismissed_helpers` column as a `text` column

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

Then add the serization call to the model

```ruby
class Account < ActiveRecord::Base
  serialize :dismissed_helpers, Array
end
```

If you are using PostgreSQL as your database, you could use
`postgres_ext` to add native array support to your models. You would
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
`dismissed_helpers` attribute.

## Authors ##

[Dan McClain](http://twitter.com/_danmcclain)

[We are very thankful for the many contributors](https://github.com/dockyard/dismissible_helpers/graphs/contributors)

## Versioning ##

This gem follows [Semantic Versioning](http://semver.org)

## Legal ##

[DockYard](http://dockyard.com), LLC &copy; 2012

[@dockyard](http://twitter.com/dockyard)

[Licensed under the MIT license](http://www.opensource.org/licenses/mit-license.php)
