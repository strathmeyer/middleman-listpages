# SECURITY ALERT

This repo has been archived because it uses insecure versions of the `yard` gem and `rake` gem.

Do NOT run the code in this repo. Use it only as an example.

# middleman-listpages

middleman-listpages is an extension for the [Middleman](http://middlemanapp.com) static site generator that adds the
ability to list the child pages of a given page.

# Install

Add `middleman-listpages` to your `Gemfile`
```ruby
gem "middleman-listpages", "~> 0.0.2"
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

You can use the `:depth` option to specify how many levels deep to display:
```erb
<%= list_pages current_page, :depth => 1 %>
```

If you want to use options when displaying the root page, pass `nil` as the
first agrument:
```erb
<%= list_pages nil, :depth => 1 %>
```

To display the root page as well:
```erb
<%= list_pages nil, :include_root => true %>
```

This will generate:
```html
<ul>
  <li><a href="/index.html">Index Page Title</a>
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

This will generate HTML like this (assuming "Apples" is the current page):
```html
<ul>
  <li class='active'><a href="/apples/">Apples</a></li>
  <li><a href="/oranges/">Oranges</a></li>
</ul>
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
li, li.active li {
    font-weight: normal;
}

li.active {
    font-weight: bold;
}
```
