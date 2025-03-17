from kivy.app import App
from kivy.uix.actionbar import ActionBar
from kivy.uix.label import Label
from kivy.uix.boxlayout import BoxLayout
from .book_controller import BookController


class JumboTron(Label):
    pass


class UnderConstruction(Label):
    pass


class TopNav(ActionBar):
    def on_books(self):
        self.ids.games.disabled = False
        self.ids.books.disabled = True
        return self.parent.on_books()

    def on_games(self):
        self.ids.games.disabled = True
        self.ids.books.disabled = False
        return self.parent.on_games()

    def on_home(self):
        self.ids.games.disabled = False
        self.ids.books.disabled = False
        return self.parent.on_home()


class SinglePage(BoxLayout):
    def __init__(self, **kwargs):
        super().__init__(**kwargs)
        self._content = JumboTron()
        self.spacing = 20
        self.orientation = "vertical"
        self.add_widget(TopNav())
        self.add_widget(self._content)

    def change_content(self, widget):
        self.remove_widget(self._content)
        self._content = widget
        self.add_widget(self._content)

    def on_books(self):
        self.change_content(BookController())

    def on_home(self):
        self.change_content(JumboTron())

    def on_games(self):
        self.change_content(UnderConstruction())


class CrudsampleApp(App):
    def build(self):
        return SinglePage()


if __name__ == "__main__":
    CrudsampleApp().run()
