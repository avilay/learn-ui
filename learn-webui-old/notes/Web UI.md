# Web UI

## CSS

Styles are defined in a stylesheet file *.css and can be defined at three levels (called selectors) - 

* HTML Elements: I can define all `<a>` elements to have some style.
* Div IDs: I can define the style for a particular `<div id=myid>` .
* Classes: Any HTML element having the given class will have the style applied, e.g., `<div class="myclass">`.

```css
html,
body {
  <style-attribute>: <value>;
  <style-attribute>: <value>;
  :::
}

#onlythisdiv {
  <style-attribute>: <value>;
  <style-attribute>: <value>;
  :::
}

.content {
  <style-attribute>: <value>;
  <style-attribute>: <value>;
  :::
}
```

```html
<html>
  <body>
    <div id="onlythisdiv">...</div>
    <div class="content">...</div>
    <div class="content">...</div>
  </body>
</html>
```

The `<html>` and `<body>` elements will get the specified style. The `<div id="onlythisdiv">` will gets is own style on top of that. And all `content` divs (or any other HTML element having its class set to content) will have the defined style.

There are a lot of different css style attributes, see the full list [here](https://developer.mozilla.org/en-US/docs/Web/CSS/Reference).

##### Content Dimensions

In this note I refer to the "natural" size of the content. Based on empirical analysis, here is how I think this is calculated: The width of the viewport is the starting point. Content is first fit into this width. The total size of the remaining content determines its height. As I change the viewport's width, the browser will respond by changing the content's width, and therefore its height. However, if I change the viewport's height, the content's dims don't change. If needed, the content will be cut-off vertically.

