# CSS Course Running Notes

#### Resources

* https://www.1001fonts.com/
* https://coolors.co/
* https://giphy.com/
* https://userway.org/contrast/?fg=000000&bg=ffffff
* https://www.cssfontstack.com/

## CSS Selectors

### Basics

```css
/* this is an element selector */
h1 {
  text-shadow: 0px 0px 1px black;
}

/* this is a class selector */
.content {
  background-color: lightblue;
}

/* this is an id selector */
#logo {
  border-radius: 50%;
}
```

```html
<h1>
  This will have a black outline.
</h1>

<div class="content">
  This entire div box will have a light blue background which turns back when user hovers on top of it.
</div>

<!-- the image will be rounded -->
<img id="logo" src="/profile.webp" alt="headshot of aptg" />
```

### Descendent Selector

In the example below, all descendent nodes of `.content` that are `<p>` will have darkblue text.

```css
.content p {
  color: darkblue;
}
```

```html
<div class="content">
  <p>This will be dark blue.</p>
  <div>
    <div>
      <p>This will also be darkblue.</p>
    </div>
  </div>
</div>
```

### Parent-Child Selector

Instead of all the descendents, if I want to select only the direct children of a selector I can do -

```css
article > p {
  color: red;
}
```

```html
<article>
	<p>This will be red.</p>
  <aside>
    <p>This will not be red.</p>
  </aside>
</article>
```

I can mix and match. In the below example, any direct `<strong>` child or a `<p>` descendent of `<aside>` will be selected.

```css
aside p > strong {
  color: red;
}
```

```html
<aside>
	<div>
    <p>
      This is normal text but <strong>will be red.</strong>
    </p>
  </div>
</aside>
```

### Sibling Selector

Adjacent siblings are right next to each other, general siblings may be apart. Adjacent siblings are subsets of general siblings. 

```html
<h1>Heading One</h1>
<p>This is an adjacent sibling to Heading One.</p>
<aside>....</aside>
<h2>...</h2>
<p>This is a general sibling to Heading One</p>
```

```css
/* Adjacent sibling selector */
h1 + p {
  color: red;
}

/* General sibling selector */
h1 ~ p {
  color: blue;
}
```

These only work in the "downward" direction, e.g., if I have  a `<p>` tag before `<aside>`, then it is not considered a sibling of `<aside>`, only the `<p>`s that come after are considered as siblings.

When both are given, the one that comes later is applied.

### Group Selector

I can apply the same style to multiple selectors at the same time. In the example below, all `<h1>` and `<h2>` elements in the webpage will have 0 margin on top.

```css
h1, h2 {
  margin-top: 0px;
}
```

I can mix-and-match the selectors that I want to group -

```css
h1, .content, #logo {
  margin-top: 0px;
}
```

Each comma-separated selector is evaluated independently. In the example below all the `.danger` classes inside the `.warning` class will have a red font. Separately, all the `.important` class, regardless of whether they are under `.warning` or not, will also have a red font.

```css
.warning .danger, .important {
  color: red;
}
```

If I want only the `.danger` and `.important` classes inside `.warning` to have this style I have to do-

```css
.warning .danger, .warning .important {
  color: red;
}
```

### Compund Selectors

Only class on an element will be selected, no other classes with the same name will be selected.

```css
p.myclass {
  color: red;
}
```

```html
<p class="myclass">This content will be red.</p>
<ul class="myclass">
  <li>This</li>
  <li>will not be</li>
  <li>red</li>
</ul>
```

### Attribute Selectors

```css
/* any element having the "title" will be selected */
[title] {...}

/* only <a title="..."> will be selected */
a[title] {...}

/* only title="exact" will be selected */
[title="exact"] {...}

/* Any title attribute that has the *word* "contains" in it will be selected */
[title~="contains"] {...}

/* Any title attribute that starts with the value "startswith" will be selected */
[title^="startswith"] {...}

/* Any title attribute that ends with the value "endswith" will be selected */
[title$="endswith"] {...}

/* Any title attribut that has the *string* "contains" anywhere in it will be selected */
[title*="contains"] {...}
```

### Child Pseudo-Classes

The following will select any `<h2>` element that is an only child. If it has any other siblings, it will not be selected.

```css
h2:only-child {
  color: red;
}
```

```html
<article>
	<h2>Will not be selected</h2>
  <p>Because there are other children</p>
  <aside>
  	<h2>This will be red</h2>
  </aside>
</article>
```

The following will select `<h2>` if it is an only child. If the parent has multiple `<h2>`s, then none will be selected.

```css
h2:only-of-type {
  color: red;
}
```

```html
<article>
	<h2>Heading Two is Red</h2>
	<h3>Heading Three</h3>
	<p>Some text here.</p>
	<aside>
		<h2>Heading Two Again is NOT Red</h2>
		<h2>And once more because of this</h2>
		<h3>Heading Three Again</h3>
	</aside>
</article>
```

Similarly there are `:first-child`, `:last-child`, `:first-of-type` and `:last-of-type` pseudo selectors as well. As well as `:nth-child`, `:nth-last-child`, `:nth-of-type`, and `:nth-last-of-type` pseudo selectors.

### Misc Pseudo Classes

Usually `html` and `body` serve as root selectors. However, the pseudo selector `:root` has higher specificity and is often used for CSS variables.

There is `:is` and `:where` which makes declaring multiple styles easier. But tbh - too much trouble to understand.

There is `:not` which selects elements that do not have the specified attributes. Another one is `:has`. 

### Form Pseudo Classes

I can use `:required` or `:disabled` or `:optional` or `:enabled` form properties as pseudo selectors. I don't have to explicitly mark form input elements as optional, anything that is not required is optional. Similarly anything that is not disabled is enabled.

I can use `:checked` for input elements that are checked. There are others like `:default` and `:indeterminate` but I don't anticipate using those ever.

I can use `:placeholder-shown` if the placeholder text in any input element is still showing.

I can use `:autofill` for any input fields that have been auto-filled by the browser.

Data validation pesudo-classes - `:invalid`, `:valid`, `:in-range`, `out-of-range`.

I can use `:read-write` to select all elements that have read/write content. This works on the default read/write setting of an element, e.g., `<p>` is read-only, `<input type="text">` is read-write, etc. But it also works when I change the read/write settings using the `contenteditable` and `readonly` tags. Along with this we also have `:read-only`, pretty much 80% of stuff on a web page is read-only, so use this with a parent like `form div :read-only`. 

### Link Pseudo-Classes

```css
/* Unvisited links */
a:link {...}

/* Visited links */
a:visited {...}

/* When mouse hovers on the link */
a:hover {...}

/* After a link has been clicked but before it has been loaded.
Not very useful these days. */
a:active {...}
```

> ⚠️ When I try to set the underline only on visited links, it does not work. The opposite does not work either. The setting of no text decoration from `a:link` seems to override the the setting for `a:visited`. However, text decoration settings on `a:hover` seem to be working fine.

### Specificity

A more specific CSS selector will be able to override the properties of a less specific selector, e.g., 

```css
.content {
  background-color: lightblue;
}

#my-specific-content {
  background-color: lightpink;
}
```

```html
<div class="content">
  This will have a lightblue background;
</div>

<div id="my-specific-content" class="content">
  This will have a lightpink background.
</div>
```

Specificity of selectors from least specific to most specific -

1. Element selectors
2. Class selectors
3. Compound selectors
   1. Specificity of different compound selectors is not very straightforward to compute

4. Sibling selector (both adjacent and general have equal specificity so the one that comes later wins)
5. Id selectors
6. `:root` selector

> **How to read selector code?**
>
> Read selectors from right-to-left. Lets say I have the following selector -
>
> ```css
> .warning > p a
> ```
>
> I should read this as  - select all `<a>` elements that are descendants of a `<p>` element that is a direct child of any element with the `.warning` class.
>
> To help with accessibility there are a bunch of `:focus` pesudo classes that I can use to style the element when the keyboard focus is on it.

Out of two styles with the same specificity, the one that was defined later wins.

For the most part avoid compound selectors because it is hard to figure out their specificity. Give everything a class.

Most text properites are inherited. If I have the following -

```css
.section {
  color: orange;
}

p {
  color: pink;
}

<div class="section">
	<p>This text will be pink!</p>
</div>
```

Based on specificity I'd think that p should be orange because the class selector has higher priority than para selector, however because of inheritence, the para will end up 

## Shorthands

* I can specify all four margins in one shot like so -

  ```css
  margin: 10px;
  ```

  This means that all four - `margin-top`, `margin-right`, `margin-bottom`, and `margin-left` are 10px. If I want different values I need to provide them in order. This is the "clockwise" order.

  ```css
  margin: <top> <right> <bottom> <left>
  ```

  If top and bottom have the same values and left and right have the same values I can do -

  ```css
  margin: <common-top-bottom-value> <common-left-right-value>
  ```

* All the above also applies to padding.

* Shadows are set using the `box-shadows` for divs or `text-shadow` for text -

  ```css
  box-shadow: <offset-x> <offset-y> <blur-radius> <spread-radius> <color>
  text-shadow: <same as above>
  ```


## CSS Variables

### Variable Scopes

Has a funny syntax that looks like this -

```css
:root {
  --beige: #ffeead;
}

html, body {
  background: var(--beige);
}
```

Because the `beige` is declared in the `:root` pseudo-class, it is a global variable that can be used in any selector.

I can also re-delcare the same variable name inside a selector and all the descendents of that selector get the updated value, not the global value.

```css
:root {
  --red: #ff6f69;
}

.item {
  --red: #ff8e69;
}
```

Of course I can declare new variables directly in local scope -

```css
#navbar {
  --nav-red: #ff6f19;
  border: 1px solid;  /* I can mix variable declarations with style elements. */
}

#navbar a {
  color: var(--nav-red);
}
```

### Inheritance

I can declare a variable in terms of another variable -

```css
:root {
  --red: #ff6f69;
  --main-color: var(--red);
}
```

I cannot override the value of `main-color` by overriding the value of `red` because the value of `main-color` has already been resolved.

```css
.item {
  --red: someothercolor;
  /* main-color still remains the same. */
}
```

In a similar vein when style attrbutes are inherited, they inherit the resolved value of the variables, not the variables themselves. Generally, the `<h1>` element inherits the color style from body.

```css
html, body {
  color: var(--red);
}
```

Now, without explicitly setting the style attribute of `<h1>`, all headings will be red. However, now if I change the value of red inside the `.item` selector, it is not going to change the headings inside `.item`. This is because they inherited the actual color value from `<body>`, not the variable. Instead, if I had the following -

```css
:root {
  --red: darkred;
}

html, body {
  color: var(--red);
}

/* Normally this is not needed because h2 will inherit color */
h2 {
  color: var(--red);
}

/* All h2s inside .item will turn maroon */
.item {
  --red: maroon;
}
```

### Theming

Overriding variables is handy when I want to change all the elements of a particular section of a page. For example, lets say I have -

```html
<div>
  <div class="item">...item one...</div>
  <div class="item">...item one...</div>
  <div class="item">...item one...</div>
</div>
```

And `.item` class has some background color and a bunch of other styles declared. Now I want to make one of these a "featured" item like so -

```html
<div>
  <div class="item">...item one...</div>
  <div class="featured item">...item one...</div>
  <div class="item">...item one...</div>
</div>
```

My featured item should have a different background color and some subtle changes to the other styles. Ordinarily I'd do something like this -

```css
.featured > h2 {... change the header ...}
.featured > p { background: someothercolor; }
...
```

But if I have used variables in the `.item` class, then I can simply override them in `.features` without having to re-style each child.

```css
.featured {
  --bg: someothercolor;
  --typeface: someotherfont;
}
```

This pattern is called "theming".

### Via Javascript

```javascript
var root = document.querySelector(":root");
var rootStyles = getComputedStyle(root);
var red = rootStyles.getPropertyValue("--red");
console.log("red: ", red);

root.style.setProperty("--red", "green");
```

### Responsive

Lets say I have a 2 column grid that I want to shrink to a single column grid on smaller viewports. My initial column widths are 200px each, and for display sizes smaller than 450px, I want to just have a single column of 200px. Here is how to do it -

```css
.grid {
  --columns: 200px 200px;
}

.grid {
  display: grid;
  grid-template-columns: var(--columns);
}

@media all and (max-width: 450px) {
  .grid {
    --columns: 200px;
  }
}
```

I have to nest the `.grid` inside the media query and redeclare the new values there.

## Display

* The default display setting of a div is block, this means it "blocks" the entire horizontal space in the container, unless of course it has a `width` setting, in which case that will control the width. Consecutive block elements will be stacked one below the other, regardless of their explicit width.

* The default display setting of other non-div type "visible" HTML elements like buttons, anchors, etc. is inline (paragraphs and headings, however, are set to block). The width of inline elements is automatically set to the intrinsic width of their content. Inline elements are stacked one beside the other.  For the most part setting the width explicitly on such elements works as expected.

* When I set a div to be inline, its width is automatically calculated based on its children's intrinsic width. Explicitly setting the width of inline divs will result in weird behavior. Even though the devtools will show the div as having the explicit width, its "visible" width will be the children's intrinsic width, e.g., -

  ```css
  .dbg {
  	display: inline;
    width: 300px;
  }
  
  <div class="dbg">
  	<button>My First Button</button>
  </div>
  <div class="dbg">
  	<button>My Second Button</button>
  </div>
  ```

  Will place both the divs next to each other, but their visible width will not be 300px, it will be whatever the button's width is. The buttons will scrunched next to one another.

* 🧐 Based on empirical observation it seems that there is a subtle difference between inline/block display settings and grid/flex display settings. The inline/block set the display on the element itself. The grid/flex set the display on all the children. 

  ```css
  .main {
    display: flex;
  }
  
  .red {
    ...
  }
  
  .green {
    ...
  }
  
  <div class="main">
    <div class="red">...</div>
  	<div class="green">...</div>
  </div>
  ```

  The `.main` div's display is set to flex, but it itself is still a block div! The child elements, `.red` and `.green` are flex. If I set `.main` to inline, while it itself will turn inline, its children - the `.red` and `.green` divs are not going to turn inline, they'll still be at their default block setting. The browser will attempt to put any siblings of `.main` alongside it, but because of the full length div children, it will probably end up messing the layout.

* One quick way to center block divs is to set them to a finite width and set the left and right margins to `auto`.

  ```css
  .dbg {
    width: 200px;
    margin-left: auto;
    margin-right: auto;
  }
  
  <div class="dbg">...</div>
  ```
  
  Of course this will not work if I don't explicitly set the width or if the block display is overridden.

## Fonts

[The following](https://www.w3schools.com/cssref/css_websafe_fonts.php) are considered web-safe fonts. This means if I am using any of these fonts on my web page, I don't have send these down to the client.

* Sans-serif
  * Arial
  * Verdana
  * Tahoma
  * Trebuchet MS

* Serif
  * Times New Roman
  * Georgia
  * Garamond

* Monospace
  * Courier New

* Cursive
  * Brush Script MT

However, just because they are labeled as "web-safe" it does not mean that these come somehow bundled in all browsers. The browser will still look for the font in the OS's font book. 

There are two ways to add custom fonts on my webpage -

* Go to fonts.google.com and select a font. It will give me the `<link>` tags and the css properties to use that font. See `space.html` for an example.

* Download a specialized font, it will usually come with a `.ttf` file. This is the file I usually install in my font book for the font to be available on my OS. Now link this ttf file in my webpage and give the font a name like so -

  ```css
  @font-face {
    src: url("Corleone.ttf");
    font-family: Corleone;
  }
  ```

  Then just use this font-family in my css like usual. See `godfather.html` for an example.

## Units

* Absolute units: stick to px. pixels used to be the actual pixel on the screen which was problematic on different screen resolutions. These days it is no longer that, it is instead a "reference pixel" which has a fixed ergonomic value which makes it a good unit again.
* Relative units:
  * %ages are mostly used to set widths which are relative to the parent's width. Heights are usually relative to the parent but sometimes they are relative to the width. Setting %age widths goes hand-in-hand with setting a max-width and sometimes a min-width.
  * Units relative to font sizes: em and rem
    * em is relative to its parent's font size when I am setting the font-size. But if I am using it for any other property like padding, then it is relative to **self**! The default font size of the body is usually 16px. Nested ems can get out of control if I keep setting font-size of the entire branch.
    * rem is relative to the :root or html font-size (not the body font-fize). Typically leave the body font size to 1rem and if I absolutely need to, then change the :root/html font size to 110% or 90% or what have you. 
  * Units relative to viewport: vw, vh, vmin, vmax - not very prevalent.

Rules of thumb:

* For font-size use rem.
* For padding and margin use em.
* For widths use em or %age.

## Backgrounds

I can set the background to any color or an image. I can do this for the whole page at the `<body>` level or do it for some CSS selector.

```css
.content {
  background-color: lightblue; 
}

.hero {
  background-image: url("/path/to/the/image");
  background-size: cover;
  background-position: center;
}
```

Here are some useful properties -

* `background-position`
* `background-size`
* `background-attachment`
* `background-repeat`

By default the image will repeat across the entire height and width of the container. I can control this by setting the value of `background-repeat` to `norepat`, `repeat-x`, etc.

If I don't set the `background-size`, it will take on the same size as the image. If I do set it to a number, then the image will fit into that size destroying its aspect ratio in the process if needed. If I set it to the value `cover` the image will cover the entire container regardless of whether `background-repeat` is set or not. It will magnify and/or crop the image as needed to do this.

By default the image is positioned s.t its top-left corner is on the top-left corner of its container. I can control this by settin gthe `background-position` to some 2D number like `100px 100px`, which case the image is placed s.t its top left corner is at 100, 100. Then the image is repeated starting from there or not depending on whether repeat has been set. If I use words like `bottom right`, it will place the image at the bottom right of the container and repeat or not. If I have set the `background-size: cover`, then the image will cropped s.t its bottom right is visible.

To control how the content scrolls w.r.t the background I can use `background-attach`. The MDN documentation does not make a ton of sense to me. So I'll leave this here in case I want that functionality for something I am building.

I can even set the background to a gradient of colors  by using `linear-gradient` or `radial-gradient`. 

```css
.content {
  background-image: linear-gradient(red, blue);
}
```

This will take the color from red at the top and fade into blue at the bottom of the content container. To fade into any other direction use `to <dir> <dir>` type syntax. The `from` direction will be inferred, e.g, if I give `to left top` it will go "from" bottom right "to" top left. 

```css
.content {
  /* Will go from right to left */
  background-image: linear-gradient(to left, red, blue);
}
```



A good practice is to have a background color along with the background image in case the image does not load or loads slowly.

## Media Queries

```css
@media <media-type> and (<media-features>) {...}
```

Media types:

* Screen `@media screen ...`
* Print `@media print ...`
* Speech `@media speech ...`

Media features:

* Widths `@media (min-width: ...)`
* Orientation `@media (orientation: landscape) {...	}`
* Specific feature `@media (hover) {...}`
* ...

Examples:

* All media that are 960px or wider should have a purple background - 

  ```css
  @media (min-width: 960px) {
    body {
      background: purple;
    }
  }
  ```

* Screens in portrait mode - `@media screen and (orientation: portrait) {...}`

## Images

When setting image width, prefer using `max-width: 100%` instead of `width: 100%` so that if the screen size go really wide, the image does not start scaling up with it, it can lose its resolution if it does. With max width it won't grow beyond its native width and so no loss of resolution.

If I set up just one of either width or height, then the browser will set the other based on the aspect ratio. But if I set up both, then the browser will make no effort to maintain the aspect ratio. One way to overcome this is to ask the browser to crop the image. Using `object-fit: cover` does that. By default it will keep the center of the image, cropping out the edges. However, I can ask it to keep a specific side by setting `object-position: left;` 

## Forms

A form element is supposed to have at least two attributes - `action` and `method`. A form is also supposed to have a submit button `<button type="submit">Click Me!</button>`. 

There are a lot of different input types. Here are a few common ones -

* `<input type="text">`
* `<input type="checkbox">`
* `<input type="radio">`
* `<input type="email">`
* `<input type="color">`
* `<input type="date">`
* `<input type="password">`
* `<input type="file">`
* `<input type="number">`

Inputs are usually associated with a label. There are two ways of doing this -

```html
<label for="name">Name:</label>
<input id="name" type="text">

<label>Name:
	<input type="text">
</label>
```

Labels are usually very useful for assitive tech. If I want to leave out labels, then I should at-least have `aria-label` on my input -

```html
<input aria-label="search term" id="search" type="text" placeholder="Search">
```

Labels are inline, so adding space on top and bottom is not going to work. If I must, then I need to add spacing to the input elements. My sense is that it is just easier to make the form a flexbox and let the gap/justify content take care of spacing.

Form input elements can be marked with different "attributes"? like -


  * `required`, e.g., `<input type="text" id="name" required>`
  * `disabled`, e.g., `<input type="email" id="email" disabled>`
  * `checked`, e.g., `<input type="radio" name="music" value="on" checked>`

All of these can then be used in stylesheets as pseudo-classes -

```css
label:has(input:required)::after {
	content: "*";
	font-weight: bold;
}

:required {
outline: 1px solid red;
}

:checked {
  ...
}
```

The `required` attribute does some basic validation and will show a tooltip if the submit button is hit without that field being filled out.

I can make elements that are usually read-only, writable by using the `contenteditable` mark and conversely usually writable elements as readonly by marking it as `readonly`.

```html
<p contenteditable>
  This content can be edited by the user.
</p>
  
<textarea readonly>
  This cannot be edited.
</textarea>
```

Whenever I am entering a form, the browser suggests values  - for name fields it will suggest my name, and so on. This is controlled by the `autocomplete` attribute on the input field, .e.g, `<input type="text" name="name" autocomplete="name">`. See [MDN docs](https://developer.mozilla.org/en-US/docs/Web/HTML/Reference/Attributes/autocomplete) for all the different autocomplete values.

CSS offers some basic validation for specificy types of text fields. For example `number` types can have a min and max vals `<input type="number" id="cookies" min="0" max="10">` and on invalid input the browser will display a small tooltip. Same with email, there is some basic validation where it looks for "@" symbol otherwise shows the tooltip.

Form elements don't inherit any of the text properites by default. If needed I can go to input or any other form element and set the various text properties to `inherit`.

## Misc

* Collpasing margins are when consecutive margins collapse and the total margin will not seem to add up to the sum of two consecutive margins.

* Setting the `text-align` property is a "child" property, not a "self" property, i.e., if I want to control the alignment of a button and make it centered, the following will **not** work -

  ```html
  <button style="text-align: center;">My Button</button>
  ```

  I have to set this property on the container which contains the inline element I want to control. So I need to do something like this -

  ```css
  <div style="text-align: center;">
    <button>My Button</button>
  </div>
  ```

  Another thing to note is that this can be applied to any visible HTML element, not just text as is shown in the example above.

  > ⚠️ This is a pretty inflexible way to center content! Use flexbox instead.

* Box model - margin > border > padding > content. When I set the width and height, by default I am setting it for the **content**. The border, padding, and margin are then added on top of that. This can lead to some mental arithmetic to figure out the exact dims. Instead I can set the `box-sizing: border-box` which means that whatever I am setting will include content + padding + border. Just set it on all elements at the beginning of the CSS like so -

  ```css
  * {
    box-sizing: border-box;
  }
  ```

* CSS property inheritence means that if I set some property on an element, it will be inherited by all its descendents. However, not all CSS properites are inherited, only [these few](https://stackoverflow.com/questions/5612302/which-css-properties-are-inherited) are, notable among which are -

  * color
  * cursor
  * font-* (font-family, font-size, font-style, font-variant, font-weight, font)
  * line-height
  * text-* (text-align, text-indent, text-transform)

  And even with these "inheritable" properties, there are exceptions, e.g., buttons don't inherit font properties 🤦🏿

* By default divs are rectangles, if I want to make it a circle I just need to set `border-radius` to 50%.

  ```css
  .circle {
    width: 100px;
    height: 100px;
    border-radius: 50%;
    background: red;
  }
  ```

* If my background color is very similar to the overlay text color then I can add a blurry shadow with x and y offsets set to 0, this will give a "glowing" effect to the text and make it stand out a bit more. See tricks.html.

  ```css
  .shadow-trick {
    background: whitesmoke;
    color: #fafbf4;
    text-shadow: 0px 0px 2px black;
  }
  ```

* There is a new image format called "webp" which is just like gif but with better compression ratio. While it can be used to encode static images, just like gifs, it can also be used to encode simple animated images.

* By default the body has a margin of 8px. I can neutralize this by setting it to 0, or by setting the jumbotron or the navbar's margin to -8, so that the margin is retained for the rest of the page.

* By default the height of a page is set to the intrinsic height of the content. This is unlike the width which is set to 100% of the viewport width. If I set the height of a div to be some specific pixel value, that will work. However, if I want to set it to be some %age value, I need to set the height of both the body and html to 100% as well, otherwise it will not work.


* When I want to link to parts of the same web page using what I used to call HTML fragment links -

  ```html
  <ul>
    <li><a href="#part1">Part One</a></li>
  	<li><a href="#part2">Part Two</a></li>
  </ul>
  <div id="part1">...</div>
  <div id="part2">...</div>
  ```

* When styling buttons - say links as buttons

  * Put the style directly on the link
  * Always use padding to create the size of the button, and not width/height
  * The sides should be around double the top/bottom
  * Set their display to `inline-block`
  * Get rid of the underline (`text-decoration: none;`)

* General padding tip text - the sides should be double of top and bottom.

* When setting line height set it without any units - it will use that as a multiplier to the current font size. A good starting point is to set it to `line-height: 1.6` for the body. The default is 1.4. Line height is an inherited property, so all my other text including headings will get this same line height. I should then tweak it as needed for other elements. For all caps or headings use a smaller line height.

* Smaller font-size with all caps is a bit hard to read. To fix that add spacing between the letters using `letter-spacing`. This needs to be a small number, so best to use pixels as the unit. Unlike line-height this cannot be unit-less. If I use em or rem I'll have to really small numbers. Typically set to 1 or 2 pixels.