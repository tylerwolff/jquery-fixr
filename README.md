jQuery Fixr
===========

A basic, no-frills plugin to make elements fixed as you scroll down a page.

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

`fixedClass` - The class that gets added when element is fixed (default: `fixed`)

`offset` - The top margin when the element is fixed (default: `0`)
