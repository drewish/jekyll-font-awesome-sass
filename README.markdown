# Jekyll Font Awesome SASS

*A plugin to add the [FontAwesome::Sass](https://github.com/FortAwesome/font-awesome-sass) framework to your Jekyll site.*


## Installation

Add the following to your site's `Gemfile`:

```ruby
gem 'jekyll-font-awesome-sass'
```

And add the following to your site's `_config.yml` file:

```yaml
gems:
  - jekyll-font-awesome-sass
```

## Usage

Create a `.scss` file (e.g., `assets/style.scss`), with the following:

```scss
---
---
$fa-font-path: "fonts/font-awesome/";
@import 'font-awesome';

// (Your custom CSS Here)
```

When your site is built, Jekyll will automatically add the Font Awesome framework before it renders your site's css. In the above example, the resulting file would be `assets/style.css` with Font Awesome's CSS followed by your own.

## Assets

By default, Jekyll Font Awesome SaSS will simply make the `@import 'font-awesome';` directive available to your custom stylesheets so that you can more easily include Font Awesome's CSS.

If you would like to use Font Awesome's static assets (e.g., fonts, javascripts), you'll need to add the following to your site's `_config.yml`:

```yml
font-awesome:
  assets: true
```

This will create `/assets/fonts/font-awesome` and `assets/javascripts/font-awesome` folders in the generated site, which you can include in your site's header as you would any other javascript file or font.

## Specifying the Font Awesome version

`jekyll-font-awesome-sass` relies on official [`font-awesome-sass` Ruby gem](https://github.com/FortAwesome/font-awesome-sass). To specify the version of Font Awesome used, simply specify the `font-awesome-sass` gem version in your Gemfile.


## Credits

Just about everything in this gem is this is blatantly ripped off from [jekyll-bootstrap-sass](https://github.com/benbalter/jekyll-bootstrap-sass). It saved me a bunch of time getting this going.
