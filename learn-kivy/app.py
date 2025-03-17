import kivy

kivy.require("1.11.1")  # replace with your current kivy version !

from kivy.app import App
from kivy.uix.gridlayout import GridLayout
from kivy.uix.textinput import TextInput
from kivy.uix.label import Label


class LoginScreen(GridLayout):
    def __init__(self, **kwargs):
        super().__init__(**kwargs)
        self.cols = 2

        ## Will fill in widgets by row
        # Add first row
        self.add_widget(Label(text="User Name"))
        self.username = TextInput(multiline=False)
        self.add_widget(self.username)

        # Add second row
        self.add_widget(Label(text="Password"))
        self.password = TextInput(password=True, multiline=False)
        self.add_widget(self.password)


class MyApp(App):
    def build(self):
        return LoginScreen()


if __name__ == "__main__":
    MyApp().run()
