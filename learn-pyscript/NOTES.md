# PyScript

## Basics

### Example

* [hello.html](./hello.html)
* [pi.html](./pi.html)
* [pi.py](./pi.py)

At its simplest I just need to add a reference the `pyscript.js` script in the HTML head. This will enable me to use a bunch of custom tags starting with `py-` in the body, including `py-script`. These are called "widgets". A bunch of widgets come builtin with PyScript. The `py-script` widget can contain arbitrary Python code that will be executed via the Pyodide WASM engine that comes bundled with PyScript. I can reference any content tag in my main HTML body by its `id` attribute and and add a child to it via the `pyscript.write(id, content)` call. As can be seen in the hello example, the Python standard lib like `datetime` is already builtin PyScript.

Of course I can simply put all my Python code in an external Python file and reference that from `<py-script src="./mymodule.py"></py-script>` and have all the presentation logic in there. I can access the `pyscript` object from there as well as is seen in the Pi examples.

## Built-In Modules

The code in `//pyscript/pyscriptjs/src/pyscript.py` is available by default, without my having to import anything. There are two global singleton objects -`pyscript::PyScript` and `output_manager::OutputManager`. The other classes like `Element`, etc. are also available.

All the Pyodide libs are also available, but I still have to import them. There is a global namespace called [`js`](https://pyodide.org/en/stable/usage/api/python-api.html) that seems to have all the Javascript APIs available as Python APIs. I can import objects like `console`, `document`, etc. from it and there seems to be a 1:1 equivalence between the Javascript API spec and the way I call it in Python. I tried to look into the [Pyodid codebase js](https://github.com/pyodide/pyodide/tree/main/src/js) module but could not make much sense of how it was implemented.

Even though the `Element` class in `pyscript.py` tries to make navigating the DOM easier, it does seem too brittle. At this point I am better off just using the DOM APIs from the `js` namespace.

## Non-Standard Modules

### Example

* [local.html](./local.html)
* [data.py](./data.py)

It is possible to use other modules, both from pypi as well as modules that I have written in PyScript. For this I use another widget called `py-env` in the HTML head and specify all my dependencies in YAML.

```
<py-env>
  - numpy
  - matplotlib
  - paths:
    - /data.py
</py-env>
```

Inside `data.py` I can import and use `numpy` or `matplotlib` as usual. I can of course import all of these modules in the code contained in the `py-script` tag.

This example further showcases syntactic sugar for adding plots to the HTML using the `<py-script output="plot">` syntax. This will look for a content tag in the main HTML with the id `plot` and will take the last expression in `py-script` and write it in this tag.

## Custom Widgets

### Example

* [widget.html](./widget.html)
* [widget.py](./widget.py)
* [nested_widget.html](./nested_widget.html)
* [nested_widget.py](./nested_widget.py)

Just like the built-in widgets, I can create my own custom widgets and use them as tags in the HTML. When I declare or register my widget, I need to supply three things -

* The tag name I'll use in HTML
* The code file where this widget is implemented
* The class in the code file that implements this widget

This is done through yet another built-in widget called `py-register-widget`.

```
<py-register-widget src="./widget.py" name="my-widget" klass="MyWidget"></py-register-widget>
```

Typically in my HTML I'll add something like this -

```
<my-widget id="1" value="Lorem ipsum dolor set."></my-widget>
```

This will result in the pyscript/pyodide runtime to create a [shadow DOM](https://www.webcomponents.org/community/articles/introduction-to-shadow-dom) as a child of this element which is what is displayed. In a nutshell the shadow DOM is something that is a separate DOM from the rest of the page, in that its CSS styles, ids, etc. don't leak out and external CSS sytles, ids, etc. don't leak in. However, the way PyScript implements this is it adds children to the `my-widget` tag and then references that in the shadow DOM so the sytles are still preserved.

In terms of the runtime, it seems that the implementing class is instantiated with only parameter, the parent `HTMLElement`, which is the `my-widget` tag. I can get the attributes, the id, any child elements, etc. out of it if I want in the widget constructor.

Shadow DOM content is obtained from the `connect` method of the widget class. This seems to be the only duck interface defined. In the `connect` method I'll typically append the actual HTML fragment to the main DOM Tree and PyScript does the magic of converting that into shadow DOM.

## Mini App

### Examples

* [./todo/todo.html](./todo/todo.html)
* [./todo/todo.py](./todo/todo.py)
* [./todo/utils.py](./todo/utils.py)

A simple TODO app that showcases all the above concepts.