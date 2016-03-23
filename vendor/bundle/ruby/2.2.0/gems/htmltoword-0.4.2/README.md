# Ruby Html to word Gem 

This simple gem allows you to create MS Word docx documents from simple html documents. This makes it easy to create dynamic reports and forms that can be downloaded by your users as simple MS Word docx files.

Add this line to your application's Gemfile:

    gem 'htmltoword'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install htmltoword

## Usage

### Standalone

Using the default word file as template
```ruby
require 'htmltoword'

my_html = '<html><head></head><body><p>Hello</p></body></html>'
document = Htmltoword::Document.create(my_html)
```

Using your custom word file as a template, where you can setup your own style for normal text, h1,h2, etc.
```ruby
require 'htmltoword'

# Configure the location of your custom templates
Htmltoword.config.custom_templates_path = 'some_path'

my_html = '<html><head></head><body><p>Hello</p></body></html>'
document = Htmltoword::Document.create(my_html, word_template_file_name)
```

### With Rails
**For htmltoword version >= 0.2**
An action controller renderer has been defined, so there's no need to declare the mime-type and you can just respond to .docx format. It will look then for views with the extension ```.docx.erb``` which will provide the HTML that will be rendered in the Word file.

```ruby
# On your controller.
respond_to :docx

# filename and word_template are optional. By default it will name the file as your action and use the default template provided by the gem. The use of the .docx in the filename and word_template is optional.
def my_action
  # ...
  respond_with(@object, filename: 'my_file.docx', word_template: 'my_template.docx')
  # Alternatively, if you don't want to create the .docx.erb template you could
  respond_with(@object, content: '<html><body>some html</body></html>', filename: 'my_file.docx')
end

def my_action2
  # ...
  respond_to do |format|
    format.docx do
      render docx: 'my_view', filename: 'my_file.docx'
      # Alternatively, if you don't want to create the .docx.erb template you could
      render docx: 'my_file.docx', content: '<html><body>some html</body></html>'
    end
  end
end
```

Example of my_view.docx.erb
```
<h1> My custom template </h1>
<%= render partial: 'my_partial', collection: @objects, as: :item %>
```
Example of _my_partial.docx.erb
```
<h3><%= item.title %></h3>
<p> My html for item <%= item.id %> goes here </p>
```

**For htmltoword version <= 0.1.8**
```ruby
# Add mime-type in /config/initializers/mime_types.rb:
Mime::Type.register "application/vnd.openxmlformats-officedocument.wordprocessingml.document", :docx

# Add docx responder in your controller
def show
  respond_to do |format|
    format.docx do
      file = Htmltoword::Document.create params[:docx_html_source], "file_name.docx"
      send_file file.path, :disposition => "attachment"
    end
  end
end
```

```javascript
  // OPTIONAL: Use a jquery click handler to store the markup in a hidden form field before the form is submitted.
  // Using this strategy makes it easy to allow users to dynamically edit the document that will be turned
  // into a docx file, for example by toggling sections of a document.
  $('#download-as-docx').on('click', function () {
    $('input[name="docx_html_source"]').val('<!DOCTYPE html>\n' + $('.delivery').html());
  });
```

### Configure templates and xslt paths

From version 2.0 you can configure the location of default and custom templates and xslt files. By default templates are defined under ```lib/htmltoword/templates``` and xslt under ```lib/htmltoword/xslt```

```ruby
Htmltoword.configure do |config|
  config.custom_templates_path = 'path_for_custom_templates'
  # If you modify this path, there should be a 'default.docx' file in there
  config.default_templates_path = 'path_for_default_template'
  # If you modify this path, there should be a 'html_to_wordml.xslt' file in there
  config.default_xslt_path = 'some_path'
  # The use of additional custom xslt will come soon
  config.custom_xslt_path = 'some_path'
end
```

## Features

All standard html elements are supported and will create the closest equivalent in wordml. For example spans will create inline elements and divs will create block like elements.

### Highlighting text

You can add highlighting to text by wrapping it in a span with class h and adding a data style with a color that wordml supports (http://www.schemacentral.com/sc/ooxml/t-w_ST_HighlightColor.html) ie:

```html
<span class="h" data-style="green">This text will have a green highlight</span>
```

### Page breaks

To create page breaks simply add a div with class -page-break ie:

```html
<div class="-page-break"></div>
````

## Contributing / Extending

Word docx files are essentially just a zipped collection of xml files and resources.
This gem contains a standard empty MS Word docx file and a stylesheet to transform arbitrary html into wordml.
The basic functioning of this gem can be summarised as:

1. Transform inputed html to wordml.
2. Unzip empty word docx file bundled with gem and replace its document.xml content with the new transformed result of step 1.
3. Zip up contents again into a resulting .docx file.

For more info about WordML: http://rep.oio.dk/microsoft.com/officeschemas/wordprocessingml_article.htm

Contributions would be very much appreciated.

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License

(The MIT License)

Copyright © 2013:

* Cristina Matonte

* Nicholas Frandsen
