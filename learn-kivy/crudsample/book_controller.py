from kivy.uix.boxlayout import BoxLayout
from .custom_widgets import SearchBox, OnlineImage
from kivy.uix.screenmanager import ScreenManager, Screen
from kivy.properties import StringProperty, ObjectProperty
from .models.book import Book

from kivy.uix.behaviors import ButtonBehavior


class BookItem(ButtonBehavior, BoxLayout):
    book_id = StringProperty()
    title = StringProperty()
    author = StringProperty()

    def __init__(self, **kwargs):
        book = kwargs.pop("book")
        self._show_book_details_cb = kwargs.pop("show_book_details_cb")
        super().__init__(**kwargs)
        self.book_id = book.book_id
        self.title = book.title
        self.author = book.author

    def show_book_details(self):
        self._show_book_details_cb(self.book_id)


class BookDetails(Screen):
    book = ObjectProperty(None)

    def __init__(self, **kwargs):
        self.book = kwargs.pop("book")
        super().__init__(**kwargs)
        self.name = "book_details"


class BooksList(Screen):
    def __init__(self, **kwargs):
        books = kwargs.pop("books")
        super().__init__(**kwargs)
        self.name = "books_list"

        booklist = BoxLayout(orientation="vertical")
        booklist.add_widget(SearchBox())
        for book in books:
            booklist.add_widget(BookItem(book=book, show_book_details_cb=self.show_book_details))
        self.add_widget(booklist)

    def show_book_details(self, book_id):
        self.parent.show_book_details(book_id)


class BookController(ScreenManager):
    def __init__(self, **kwargs):
        super().__init__(**kwargs)
        all_books = Book.load_all()
        self._books = {book.book_id: book for book in all_books}
        self.add_widget(BooksList(books=list(self._books.values())[:5]))
        self.current = "books_list"

    def show_book_details(self, book_id):
        self.add_widget(BookDetails(book=self._books[book_id]))
        self.current = "book_details"

