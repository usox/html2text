html2text [![Build Status](https://travis-ci.org/usox/html2text.svg?branch=master)](https://travis-ci.org/usox/html2text) [![Total Downloads](https://poser.pugx.org/usox/html2text/downloads.png)](https://packagist.org/packages/usox/html2text)
=========

html2text is a very simple script that uses DOM methods to convert HTML into a format similar to what would be
rendered by a browser - perfect for places where you need a quick text representation. For example:

```html
<html>
<title>Ignored Title</title>
<body>
  <h1>Hello, World!</h1>

  <p>This is some e-mail content.
  Even though it has whitespace and newlines, the e-mail converter
  will handle it correctly.

  <p>Even mismatched tags.</p>

  <div>A div</div>
  <div>Another div</div>
  <div>A div<div>within a div</div></div>

  <a href="http://foo.com">A link</a>

</body>
</html>
```

Will be converted into:

```text
Hello, World!

This is some e-mail content. Even though it has whitespace and newlines, the e-mail converter will handle it correctly.

Even mismatched tags.

A div
Another div
A div
within a div

[A link](http://foo.com)
```

## Installing

You can use [Composer](http://getcomposer.org/) to add the [package](https://packagist.org/packages/soundasleep/html2text) to your project:

```json
{
  "require": {
    "usox/html2text": "^1"
  }
}
```

And then use it quite simply:

```php
$converter = new \Usox\Html2Text()
$text = $converter->convert($html);
```

You can also include the supplied `html2text.php` and use `$text = convert_html_to_text($html);` instead.

### Options

| Option | Default | Description |
|--------|---------|-------------|
| **ignore_errors** | `false` | Set to `true` to ignore any XML parsing errors/warnings. |
| **drop_links** | `false` | Set to `true` to not render links as `[http://foo.com](My Link)`, but rather just `My Link`. |

Pass along options as a second argument to `convert`, for example:

```php
$html = 'some fine html';
$options = dict[
  'ignore_errors' => true,
  // other options go here
];
$converter = new \Usox\Html2Text()
echo $converter->convert($html, $options);
```

## Tests

Some very basic tests are provided in the `tests/` directory. Run them with `composer install && vendor/bin/hacktest tests`.

## License

`html2text` is [licensed under MIT](LICENSE.md), making it suitable for both Eclipse and GPL projects.

## Other versions

This is a port of the php version found [here](https://github.com/soundasleep/html2text).
