from kivy.app import App
from kivy.uix.actionbar import ActionBar
from kivy.uix.boxlayout import BoxLayout
from kivy.uix.label import Label
from kivy.logger import Logger
from kivy.uix.stacklayout import StackLayout


class TopNav(ActionBar):
    def on_home(self):
        self.ids.m1.disabled = False
        self.ids.m2.disabled = False
        return self.parent.on_home()

    def on_menu_one(self):
        self.ids.m1.disabled = True
        self.ids.m2.disabled = False
        return self.parent.on_menu_one()

    def on_menu_two(self):
        self.ids.m2.disabled = True
        self.ids.m1.disabled = False
        return self.parent.on_menu_two()


class ContentsOne(StackLayout):
    pass


class ContentsTwo(BoxLayout):
    pass


class Welcome(Label):
    pass


class SinglePage(BoxLayout):
    def __init__(self, **kwargs):
        super().__init__(**kwargs)
        self._content = Welcome()

        self.orientation = "vertical"
        self.add_widget(TopNav())
        self.add_widget(self._content)

    def on_home(self):
        self.remove_widget(self._content)
        self._content = Welcome()
        self.add_widget(self._content)

    def on_menu_one(self):
        Logger.debug("SinglePage: Inside on_menu_one")
        self.remove_widget(self._content)
        self._content = ContentsOne()
        self.add_widget(self._content)

    def on_menu_two(self):
        Logger.debug("SinglePage: Inside on_menu_two")
        self.remove_widget(self._content)
        self._content = ContentsTwo()
        self.add_widget(self._content)


class DemoApp(App):
    def build(self):
        return SinglePage()


if __name__ == "__main__":
    DemoApp().run()
