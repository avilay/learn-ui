from kivy.uix.boxlayout import BoxLayout
from kivy.uix.image import Image
from kivy.properties import StringProperty


class SearchBox(BoxLayout):
    pass


class OnlineImage(Image):
    url = StringProperty()

    def __init__(self, **kwargs):
        super().__init__(**kwargs)

    def on_url(self, src_url):
        pass
