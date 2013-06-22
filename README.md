jQuery Fixr
===========

A basic, no-frills plugin to make elements fixed as you scroll down a page. Other than making elements fixed, this plugin also does some useful things for you behind the scenes. It creates proper vertical spacing for your fixed element so there's no jump in the body content when it's positioning changes. It toggles a class on your fixed element depending on state. In addition, it can manually set the width of your element to its current width so that you don't have to do it manually everytime (useful for responsive sites).

## How to use
Include jQuery and the plugin file
```html
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>
<script src="jquery.fixr.js"></script>
```

Then call `fixr()` on whatever element you want to be fixed.
```javascript
$(function() {
  $('#navigation').fixr();
});
```

## Options
jQuery Fixr comes with only two options:

- `fixedClass` - The class that gets added when element is fixed (default: `fixed`)
- `offset` - The top margin when element is fixed (default: `0`)
- `resize` - Whether or not to resize element dynamically. Useful for responsive sites (default: `false`)
