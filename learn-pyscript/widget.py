from js import console, document
from textwrap import dedent


class MyWidget:
    def __init__(self, parent):
        self.parent = parent
        self._id = parent.id
        self.value = parent.getAttribute("value")
        console.log(self.value)

    def connect(self):
        div = document.createElement("div")
        div.id = self.parent.id + "-mylist"
        div.innerHTML = dedent(
            f"""
            <div class="notification is-primary">
              <button class="delete"></button>
              {self.value}
            </div>
            """
        )
        self.parent.appendChild(div)
