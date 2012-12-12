# Linkify

Linkify makes it possible to list all records from specific models in a grouped_options_for_select array. This can by very useful for internal linking. It doesn't return absolute or relative paths, but instead gives you a pointer to the model name and identifier (usually ID) of a record, so **you'll have to create your own logic for saving this information serialized and a helper method to generate links from it afterwards**.

This gem integrates easily with any Rails app using ActiveRecord.

## Installation

Add this line to your application's Gemfile:

    gem 'linkify'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install linkify

## Example output
    <select>
      <optgroup label="Artikel">
        <option value="["Article", 207]">Voluptatem In Sit Ut Fugit Totam Suscipit</option>
        <option value="["Article", 208]">Minima Id Laboriosam Itaque Minus</option>
        <option value="["Article", 209]">Aut Et Est</option>
        <option value="["Article", 210]">Sunt Commodi Itaque</option>
      </optgroup>
    </select>
## Usage

Want to add a 'link to page' drop down in a form, simply call the `internal_links` method for the options_for_select parameter. It requires the current value as a parameter.

Example:

    <%= form_for @link do |f| %>
      <%= f.select :url_options, internal_links(@link.url_options) %>
      ...
      <%= f.submit %>
    <% end %>

## Add models to the list

By default, no records will return if you call this method. For each model you want to list, you have to add this method to the model:

    linkable_by :title, :id

or, to not show only a selection of records:

    linkable_by :title, :id, limit(10)
    
It takes three parameters:

1. the name you'll see in the `<option>`
2. the value that will be in the `<option>`
3. the collection of records from this model (defaults to `all` but could also be a (named) scope or custom method)
  
## Add extra pages (static pages for example)
Sometimes you want to not only list records from the database, but also static pages: home, contact, about, etc. To add these to the `<select>` too, you can pass them as a parameter to the `internal_links` method:
  
    <%= f.select :url_options, internal_links(@link.url_options, [["contact", "/contact"], ["about", "/about"]]) %>
    
I don't like to link to URL's directly but prefer to link to a Rails helper method instead. For example:
    
    # in the form
    <%= f.select :url_options, internal_links(@link.url_options, [["contact", "contact_path"], ["about", "about_path"]]) %>
    
    # in the place I need to show this link
    <%= link_to @link.name, send(@link.path)%>

## Sponsor
This gem is made by the smart people of [Eskes Media](http://www.eskesmedia.nl/ "Eskes Media").

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request


