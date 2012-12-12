# Linkify

Linkify makes it possible to list all records from specific models in a grouped_options_for_select array. This can by very useful for internal linking. It doesn't return absolute or relative paths by default, but instead gives you the model name and identifier (usually ID) of a record, so you have'll to create your own logic for generating links from this information afterwards.

This gem integrates easily with any Rails app using ActiveRecord.

## Installation

Add this line to your application's Gemfile:

    gem 'Linkify'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install Linkify

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

Want to add a 'link to page' drop down in a form, simply call the `internal_links` method for the options_for_select parameter.

Example:

    <%= form_for @link do |f| %>
      <%= f.select :url_options, internal_links %>
      ...
      <%= f.submit %>
    <% end %>

## Add models to the list

By default, no records will return if you call this method. For each model you want to list, you have to add this method to the model:

    linkable_by :title, :id
    
It takes two parameters:

1. the name you'll see in the `<option>`
2. the value that will be in the `<option>`
3. the find method to select records from this model (defaults to `all` but could also be a (named) scope or custom method)
  
## Add extra pages (static pages for example)
Sometimes you want to not only list records from the database, but also static pages: home, contact, about, etc. To add these to the `<select>` too, you can pass them as a parameter to the `internal_links` method:
  
    <%= select_tag "url", internal_links([["contact", "/contact"], ["about", "/about"]]) %>
    
I don't like to link to URL's directly but prefer to link to a Rails helper method instead. For example:
    
    # in the form
    <%= select_tag "path", internal_links([["contact", "contact_path"], ["about", "about_path"]]) %>
    
    # in the place I need to show this link
    <%= link_to @link.name, send(@link.path)%>

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
