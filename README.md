# middleman-listpages

middleman-listpages is an extension for the [Middleman](http://middlemanapp.com) static site generator that adds the
ability to list the child pages of a given page.

# Install

Add `middleman-listpages` to your `Gemfile`
```ruby
gem "middleman-listpages", "~> 0.0.1"
```

Then open your `config.rb` and add:
```ruby
activate :listpages
```
# Usage

To display all pages:
```erb
<%= list_pages %>
```

This will generate HTML like this (assuming "Apples" is the current page):
```html
<ul>
  <li class='active'><a href="/apples/">Apples</a></li>
  <li>
    <a href="/oranges/">Oranges</a>
    <ul>
      <li><a href="/oranges/navel/">Navel Oranges</a></li>
      <li><a href="/oranges/clementine/">Clementine Oranges</a></li>
    </ul>
  </li>
</ul>
```

To display all children of current page:
```erb
<%= list_pages current_page %>
```

To display one level of children of current page:
```erb
<%= list_pages current_page, :depth => 1 %>
```

To display all children of a specific page:
```erb
<%= list_pages sitemap.find_resource_by_destination_path('index.html') %>
```

# CSS

The code will apply an `.active` class to the LI that represents the current page.
Since you might have sub LIs inside that, you'll probably want to reset the CSS
of the inner LIs via something like this:

```css
li {
  font-weight: normal;
}

li.active {
  font-weight: bold;
}

li.active li {
  font-weight: normal;
}
```
