from js import console, document
from textwrap import dedent


class MyWidgetOne:
    def __init__(self, parent):
        self.parent = parent
        self._id = parent.id
        self.value = parent.getAttribute("value")
        console.log(self.value)

    def connect(self):
        div = document.createElement("div")
        div.id = self.parent.id + "-mywidgetone"
        div.innerHTML = dedent(
            f"""
            <h1 class="title">{self.value}</h1>
            """
        )
        self.parent.appendChild(div)


class MyWidgetTwo:
    def __init__(self, parent):
        self.parent = parent

    def connect(self):
        div = document.createElement("div")
        div.id = self.parent.id + "-mywidgettwo"
        div.innerHTML = "<h3 class=title is-3>Widget Two here.</h3>"
        self.parent.appendChild(div)
