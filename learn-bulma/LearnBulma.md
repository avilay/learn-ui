# Learn Bulma

## Adding Bulma

Go to [Getting started with Bulma | Bulma: Free, open source, and modern CSS framework based on Flexbox](https://bulma.io/documentation/overview/start/) and copy the CDN link and add it to the HTML page under the `<head>` tag.

At the very least the HTML page should have -

```html
<!DOCTYPE html>
<html>
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.3/css/bulma.min.css">
  </head>
</html>
```

## Columns

[Columns](https://bulma.io/documentation/columns/) documentation.

### Equal Sized

Add a `columns` container `div` as the parent and then add as many child `column` `div`s as I want. These will size the columns automatically, which in absence of any other information will result in equal sized columns.

```html
<div class="columns">
  <div class="column">
    First column
  </div>
  <div class="column">
    Second column
  </div>
  <div class="column">
    Third column
  </div>
  <div class="column">
    Fourth column
  </div>
</div>
```

These are automatically responsive to different device form factors. To control the responsive behavior on various devices see the [responsiveness](https://bulma.io/documentation/columns/responsiveness/) page. See `equal_cols.html` for an example.

### Nested

Each `column` can contain a `columns` container and so on to create nested columns.

```html
<div class="columns">
  <div class="column">
    First column
    <div class="columns">
      <div class="column">
        First nested column
      </div>
      <div class="column">
        Second nested column
      </div>
    </div>
  </div>
  <div class="column">
    Second column
  </div>  
</div>
```

 See `nested_cols.html` for example.

### Variable Sized

I can use one of the following classes to size a column. 

* `is-three-quarters`
* `is-two-thirds`
* `is-half`
* `is-one-third`
* `is-one-quarter`
* `is-full`
* `is-four-fifths`
* `is-three-fifths`
* `is-two-fifths`
* `is-one-fifth`

Alternatively I can use the fact that the grid can be divided into 12 conceptual columns and explicitly specify the number of conceptual column a rendered column should take. There are 12 such styles -

* `is-1`
* `is-2`
* …
* `is-12`

All of this can be mixed and matched with automatically sized columns.

```html
<div class="columns">
  <div class="column is-three-quarters">
    A three quarters column
  </div>
  <div class="column">
    Auto column
  </div>
</div>

<div class="columns">
  <div class="column is-half">
    Half a column
  </div>
  <div class="column is-one-third">
    One third
  </div>
  <div class="column">
    Auto
  </div>
</div>

<div class="columns">
  <div class="column is-2">
    Two wide
  </div>
  <div class="column is-3">
    Three wide
  </div>
  <div class="column">
    Auto
  </div>
</div>
```

See `var_cols.html` for example.

## Layout

See `layout.html` for example. For more documentation [Layout](https://bulma.io/documentation/layout/).

### Section

A simple container to divide page into sections. Best used as direct children of `<body>`. Automatically handles spacing, but if I do want to control it I can use `is-medium` and `is-large`.

```html
<body>
  <section class="section">
  	<h1 class="title">First Section</h1>
    <p>
      Some content.
    </p>
  </section>
  <section class="section">
  	<h1 class="title">Second Section</h1>
    <p>
      Some more content.
    </p>
  </section>
</body>
```

### Footer

Has a lot of bottom padding and can contain anything like lists, headings, buttons, columns, icons, etc.

```html
<body>
  <footer class="footer">
  	Anything I want in here.
  </footer>
</body>
```

### Level

Style to put elements next to each other horizontally.

<img src="/Users/avilay/projects/bitbucket/learn/learn-bulma/bulma-1.png" alt="bulma-1" style="zoom:50%;" />

`level-item` can contain any HTML element.

```html
<div class="level">
  <div class="level-left">
    <h3 class="is-size-5 level-item">Item One</h3>
    <div class="level-item">Item two</div>
  </div> 
  <div class="level-right">
    <span class="level-item">Item three</span>
    <a href="#" class="level-item">Item four</a>
  </div>
</div>
```

### Container

Centers content and can be used a direct child of the following elements:

* `navbar`
* `hero`
* `section`
* `footer`

Containers are automatically padded for wide view ports and unpadded for narrower view ports. To always have a 32px padding on either side regardless of the viewport use the `is-fluid` style in addition.

```html
<body>
  <section class="section">
  	<div class="container is-fluid">
      Some content here.
    </div>
  </section>
</body>
```

## Button

There a lot of options to customize buttons, but here I am just going to write about colors, sizes, a **few** states, button lists, and addons. Check out the [Buttons](https://bulma.io/documentation/elements/button/) documentation for more info.

The `button` class can be used on the following elements:

* `<a>` anchor tags
* `<button>` form buttons
* `<input type="submit">` submit inputs
* `<input type="reset">` reset inputs

### Colors

Four variations of gray and a bunch of other colors

* `is-white`
* `is-light`
* `is-dark`
* `is-black`
* `is-text` - seems pretty useless to me.
* `is-ghost` another useless style.
* `is-primary` can be mixed with `is-light`
* `is-link` can be mixed with `is-light`
* `is-info`  can be mixed with `is-light`
* `is-success` can be mixed with `is-light`
* `is-warning`  can be mixed with `is-light`
* `is-danger`  can be mixed with `is-light`

### Sizes

Four different sizes -

* `is-small`
* `is-normal`
* `is-medium`
* `is-large`

The buttons can be resized depending on the device’s viewport.

### States

* `is-active`
* `is-loading` - won’t work on `input` tags.
* `disabled` is not a style class but is an HTML attribute

```html
<button class="button is-primary is-active">Active Button</button>
<button class="button is-primary is-loading">Loading Button</button>
<button class="button is-primary" disabled>Disabled Button</button>
```

### List

The `buttons` container can automatically space the buttons if there are a lot of buttons in my list. It is also useful to fuse buttons together using the `has-addons` style. Using `is-selected` to bunch of fused buttons ensures that the selected button is “above” its siblings. Though I don’t see any visual difference.

```html
<div class="buttons has-addons">
  <button class="button">Yes</button>
  <button class="button">Maybe</button>
  <button class="button is-selected">No</button>
</div>
```

## Navigation

### Navbar

<img src="/Users/avilay/projects/bitbucket/learn/learn-bulma/navbar.png" alt="navbar" style="zoom:50%;" />

The `navbar-brand` is on the left and `navbar-menu` on the right. Within the menu, `nabber-start` is on the left and `navbar-end` is on the right. The `navbar-item` elements will usually contain `<a>` or `<div>` tags, but they can also have dropdowns in which case I’ll need to use the `navbar-link` tags. Adding an `is-info` or any other button color style to the navbar makes it colorful. Here is a simple navbar that I can copy/paste/delete based on what I want. 

```html
<body>
  <nav class="navbar is-dark">
    
    <div class="navbar-brand">
      <a class="navbar-item" href="https://bulma.io">
        <img src="https://bulma.io/images/bulma-logo.png" width="112" height="28">
      </a>
      <a role="button" class="navbar-burger" data-target="navbarBasicExample">
        <span></span>
        <span></span>
        <span></span>
      </a>
    </div>

    <div id="navbarBasicExample" class="navbar-menu">
      <div class="navbar-start">
        <a class="navbar-item is-active">
          Home
        </a>
        <a class="navbar-item">
          Documentation
        </a>
        <div class="navbar-item has-dropdown is-hoverable">
          <a class="navbar-link">
            More
          </a>
          <div class="navbar-dropdown">
            <a class="navbar-item">
              About
            </a>
            <a class="navbar-item">
              Jobs
            </a>
            <a class="navbar-item">
              Contact
            </a>
            <hr class="navbar-divider">
            <a class="navbar-item">
              Report an issue
            </a>
          </div>
        </div>
      </div>

      <div class="navbar-end">
        <div class="navbar-item">
          <div class="buttons">
            <a class="button is-info">
              <strong>Sign up</strong>
            </a>
            <a class="button is-light">
              Log in
            </a>
          </div>
        </div>
      </div>
    </div>
  </nav>
  
  <section class="section">
    <div class="container">
      <h1 class="title">My Page</h1>
      <p>Some content here.</p>
    </div>
  </section>
</body>
```

There are other navigation styles like `menu` for a vertical menu on the side, `tab` for a simple tabbed interface, etc. Check these out in the [Components](https://bulma.io/documentation/components/) documentation.

## Typography

Bulma has a bunch of style classes that can be applied without any regard to the HTML tags. So I can style a `<span>` as a `title` and a `<h1>` have a font size of 6. However, if I want to style the html tags automatically I can wrap all my content inside a `content` class. The styling applied to html tags is not as pretty as the individual style elements described below. So in most cases I’ll not use the `content` style. See `typo.html` for examples of all the following styles.

### Title and Subtitle

[Title and Subtitle Documentation](https://bulma.io/documentation/elements/title/)

These classes will go with any HTML text element, but I guess they are best used with `<h>` tags.When `subtitle` is used immeidately after `title`, Bulma does some clever spacing tricks so that they appear closer together. There are ways to control the spacing as show in the documentation.

```html
<h1 class="title">Heading One</h1>
<h2 class="subtitle">Subtitle</h2>

<p class="title">Paragraph as Heading!</p>
<span class="subtitle">Span as Subtitle!</span>
```

Each of these classes comes with 6 sizes -

* `is-1`
* `is-2`
* …
* `is-6`

The default size of title is 3 and that of subtitle is 5. It is recommended that titles and subtitles use a size difference of two.

### Text Formatting

Any text that is either contained in a `div` tag or a `p` tag or any other tag, can be formatted in terms of:

* size
* alignment
* weight
* font
* transformation

Each of these has a set of corresponding responsive styles if I want to control how the text is formatted on different devices. See `formatting.html` for example.

#### Size

There are 7 sizes to choose from:

* `is-size-1`
* `is-size-2`
* …
* `is-size-7`

Bigger numbers means a smaller font! The default size seems to be 6.

#### Alignment

Standard four alignment helpers:

* `has-text-centered`
* `has-text-justified`
* `has-text-left`
* `has-text-right`

#### Weight

Five weights -

* `has-text-weight-light`
* `has-text-weight-normal`
* `has-text-weight-medium`
* `has-text-weight-semibold`
* `has-text-weight-bold`

#### Font

Five font families to choose from:

* `is-family-sans-serif`
* `is-family-monospace`
* `is-family-primary`
* `is-family-secondary`
* `is-family-code`

#### Transformation

Five decorators to choose from:

* `is-capitalized`
* `is-lowercase`
* `is-uppercase`
* `is-italic`
* `is-underlined`

#### Color

Any element can have these styles.

| Text Colors        | Text Grays              | Background Colors        | Background Grays              |
| ------------------ | ----------------------- | ------------------------ | ----------------------------- |
| `has-text-white`   | `has-text-black-bis`    | `has-background-white`   | `has-background-black-bis`    |
| `has-text-black`   | `has-text-black-ter`    | `has-background-black`   | `has-background-black-ter`    |
| `has-text-light`   | `has-text-grey-darker`  | `has-background-light`   | `has-background-grey-darker`  |
| `has-text-dark`    | `has-text-grey-dark`    | `has-background-dark`    | `has-background-grey-dark`    |
| `has-text-primary` | `has-text-grey`         | `has-background-primary` | `has-background-grey`         |
| `has-text-link`    | `has-text-grey-light`   | `has-background-link`    | `has-background-grey-light`   |
| `has-text-info`    | `has-text-grey-lighter` | `has-background-info`    | `has-background-grey-lighter` |
| `has-text-success` | `has-text-white-ter`    | `has-background-success` | `has-background-white-ter`    |
| `has-text-warning` | `has-text-white-bis`    | `has-background-warning` | `has-background-white-bis`    |
| `has-text-danger`  |                         | `has-background-danger`  |                               |

All of these colors can be mixed with `*-light` and `*-dark`.

## Elements

### Table

Just add the `table` style to the `<table>` tag and everything is styled automatically.

### Pagination

The main container is usually a `<nav>` tag with the `pagination` style. This has three types of elements under it - `pagination-previous`, `pagination-next`, and `pagination-list`.

```html
<nav class="pagination">
	<a class="pagination-previous" disabled>Previous</a>
  <a class="pagination-next">Next</a>
  <ul class="pagination-list">
    <li>
    	<a class="pagination-link is-current">1</a>
      <a class="pagination-link">2</a>
      <a class="pagination-ellipsis">&hellip;</a>
      <a class="pagination-link">100</a>
    </li>
  </ul>
</nav>
```

### Notification

At its most basic I can stick the `notification` style along with a `delete` button anywhere in my `section` or `container`. I can further style with colors using all the usual button colors.

```html
<div class="notification">
  <button class="delete"></button>
  Lorem ipsum dolor sit amet, consectetur
  adipiscing elit lorem ipsum dolor. <strong>Pellentesque risus mi</strong>, tempus quis placerat ut, porta nec
  nulla. Vestibulum rhoncus ac ex sit amet fringilla. Nullam gravida purus diam, et dictum <a>felis venenatis</a>
  efficitur.
</div>
```

Because Bulma does not come with any javascript support, I’ll have to wire up the click event of the delete button myself and remove this div from the DOM.

### Image

TODO

### Media

TODO

### Icons

To use font awesome icons I’ll need to login to https://www.fontawesome.com and then I’ll get a link to a “kit” which is just a javascript file that I add to my HTML page in the `head` tag and then render the icons as follows.

```html
<span class="icon">
  <i class="fas fa-home"></i>
</span>
```

#### Text

If I want to render text with the icon, I need to wrap the `icon` element inside an `icon-text` element -

```html
<span class="icon-text">
  <span class="icon">
    <i class="fas fa-home"></i>
  </span>
  <span>Home</span>
  
  <span class="icon">
    <i class="fas fa-train"></i>
  </span>
  <span>Transit</span>
</span>
```

#### Colors

Since icons are just text they can be mixed with the color styles -

```html
<span class="icon has-text-info">
  <i class="fas fa-info-circle"></i>
</span>
```

#### Sizes

| Container Class  | Font Awesome 5 Class |
| ---------------- | -------------------- |
| `icon is-small`  | `fas`                |
| `icon`           | `fas`                |
| `icon`           | `fas fa-lg`          |
| `icon is-medium` | `fas`                |
| `icon is-medium` | `fas fa-lg`          |
| `icon is-medium` | `fas fa-2x`          |
| `icon is-large`  | `fas`                |
| `icon is-large`  | `fas fa-lg`          |
| `icon is-large`  | `fas fa-2x`          |
|                  |                      |

#### Buttons

Just wrap the `icon` class element, usually a `span` element inside a `button` element. To have a button with boht an icon and text, there is no need to use the `icon-text` style, the `button` style will suffice.

```html
<button class="button">
  <span class="icon is-small">
  	<i class="fas fa-bold"></i>
  </span>
</button>

<button class="button is-success">
  <span class="icon is-small">
    <i class="fas fa-check"></i>
  </span>
  <span>Save</span>
</button>
```

## Forms

Bulma supports the following native **HTML form elements**: `<form>` `<button>` `<input>` `<textarea>` and `<label>`.

The following CSS **classes** are supported:

- `label`
- `input`
- `textarea`
- `select`
- `checkbox`
- `radio`
- `button`
- `help`

To maintain an evenly balanced design, Bulma provides a very useful `control` container with which you can **wrap** the form controls.
When combining several controls in a **form**, use the `field` class as a **container**, to keep the spacing consistent.

In most cases I’ll just copy/paste/delete from the following two form examples.

#### Vertical Form

```html
<form>
  <div class="field">
    <label class="label">Name</label>
    <div class="control">
      <input class="input" type="text" placeholder="Text input">
    </div>
  </div>

  <div class="field">
    <label class="label">Username</label>
    <div class="control has-icons-left has-icons-right">
      <input class="input is-success" type="text" placeholder="Text input" value="bulma">
      <span class="icon is-small is-left">
        <i class="fas fa-user"></i>
      </span>
      <span class="icon is-small is-right">
        <i class="fas fa-check"></i>
      </span>
    </div>
    <p class="help is-success">This username is available</p>
  </div>

  <div class="field">
    <label class="label">Email</label>
    <div class="control has-icons-left has-icons-right">
      <input class="input is-danger" type="email" placeholder="Email input" value="hello@">
      <span class="icon is-small is-left">
        <i class="fas fa-envelope"></i>
      </span>
      <span class="icon is-small is-right">
        <i class="fas fa-exclamation-triangle"></i>
      </span>
    </div>
    <p class="help is-danger">This email is invalid</p>
  </div>

  <div class="field">
    <label class="label">Subject</label>
    <div class="control">
      <div class="select">
        <select>
          <option>Select dropdown</option>
          <option>With options</option>
        </select>
      </div>
    </div>
  </div>

  <div class="field">
    <label class="label">Message</label>
    <div class="control">
      <textarea class="textarea" placeholder="Textarea"></textarea>
    </div>
  </div>

  <div class="field">
    <div class="control">
      <label class="checkbox">
        <input type="checkbox">
        I agree to the <a href="#">terms and conditions</a>
      </label>
    </div>
  </div>

  <div class="field">
    <div class="control">
      <label class="radio">
        <input type="radio" name="question">
        Yes
      </label>
      <label class="radio">
        <input type="radio" name="question">
        No
      </label>
    </div>
  </div>

  <div class="field is-grouped">
    <div class="control">
      <button class="button is-link">Submit</button>
    </div>
    <div class="control">
      <button class="button is-link is-light">Cancel</button>
    </div>
  </div>
</form>
```

#### Horizontal Form

```html
<form>
  <div class="field is-horizontal">
    <div class="field-label is-normal">
      <label class="label">From</label>
    </div>
    <div class="field-body">
      <div class="field">
        <p class="control is-expanded has-icons-left">
          <input class="input" type="text" placeholder="Name">
          <span class="icon is-small is-left">
            <i class="fas fa-user"></i>
          </span>
        </p>
      </div>
      <div class="field">
        <p class="control is-expanded has-icons-left has-icons-right">
          <input class="input is-success" type="email" placeholder="Email" value="alex@smith.com">
          <span class="icon is-small is-left">
            <i class="fas fa-envelope"></i>
          </span>
          <span class="icon is-small is-right">
            <i class="fas fa-check"></i>
          </span>
        </p>
      </div>
    </div>
  </div>

  <div class="field is-horizontal">
    <div class="field-label"></div>
    <div class="field-body">
      <div class="field is-expanded">
        <div class="field has-addons">
          <p class="control">
            <a class="button is-static">
              +44
            </a>
          </p>
          <p class="control is-expanded">
            <input class="input" type="tel" placeholder="Your phone number">
          </p>
        </div>
        <p class="help">Do not enter the first zero</p>
      </div>
    </div>
  </div>

  <div class="field is-horizontal">
    <div class="field-label is-normal">
      <label class="label">Department</label>
    </div>
    <div class="field-body">
      <div class="field is-narrow">
        <div class="control">
          <div class="select is-fullwidth">
            <select>
              <option>Business development</option>
              <option>Marketing</option>
              <option>Sales</option>
            </select>
          </div>
        </div>
      </div>
    </div>
  </div>

  <div class="field is-horizontal">
    <div class="field-label">
      <label class="label">Already a member?</label>
    </div>
    <div class="field-body">
      <div class="field is-narrow">
        <div class="control">
          <label class="radio">
            <input type="radio" name="member">
            Yes
          </label>
          <label class="radio">
            <input type="radio" name="member">
            No
          </label>
        </div>
      </div>
    </div>
  </div>

  <div class="field is-horizontal">
    <div class="field-label is-normal">
      <label class="label">Subject</label>
    </div>
    <div class="field-body">
      <div class="field">
        <div class="control">
          <input class="input is-danger" type="text" placeholder="e.g. Partnership opportunity">
        </div>
        <p class="help is-danger">
          This field is required
        </p>
      </div>
    </div>
  </div>

  <div class="field is-horizontal">
    <div class="field-label is-normal">
      <label class="label">Question</label>
    </div>
    <div class="field-body">
      <div class="field">
        <div class="control">
          <textarea class="textarea" placeholder="Explain how we can help you"></textarea>
        </div>
      </div>
    </div>
  </div>

  <div class="field is-horizontal">
    <div class="field-label">
      <!-- Left empty for spacing -->
    </div>
    <div class="field-body">
      <div class="field">
        <div class="control">
          <button class="button is-primary">
            Send message
          </button>
        </div>
      </div>
    </div>
  </div>
</form>
```



