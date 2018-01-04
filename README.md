<h1 align="center">This repository is deprecated and not maintained anymore</h1>

# Steadyslide

Create a steady slideshow where each element indipendently changes

## Getting Started
Download the [production version][min] or the [development version][max].

[min]: https://raw.github.com/emmenko/jquery-steadyslide/master/dist/steadyslide.min.js
[max]: https://raw.github.com/emmenko/jquery-steadyslide/master/dist/steadyslide.js

In your web page:

```html
<ul id="slideshow">
  <li data-toggle="steady-item" class="active">1</li>
  <li data-toggle="steady-item" class="active">2</li>
  <li data-toggle="steady-item">3</li>
  <li data-toggle="steady-item">4</li>
</ul>

<script src="jquery.js"></script>
<script src="dist/steadyslide.min.js"></script>
<script>
$(document).ready(function(){
  $("#slideshow").steadyslide({
    duration: 200,
    easing: "linear",
    interval: 3000
  });
});
</script>
```

## Documentation
_(Coming soon)_

## Examples
[Demo](demo/index.html) page.

## Release History
_(Nothing yet)_
