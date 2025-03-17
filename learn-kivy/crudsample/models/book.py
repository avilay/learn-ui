from dataclasses import dataclass
from typing import List
import yaml
import os.path as path
import shortuuid
import tempfile
import requests
import os

APPCACHE = "/Users/avilay/projects/bitbucket/learn/learn-kivy/crudsample/cache"


def download_thumbnail(url):
    filename = path.basename(url)
    filepath = path.join(APPCACHE, filename)
    if not path.exists(filepath):
        with open(filepath, "wb") as f:
            f.write(requests.get(url).content)
    return filepath


@dataclass
class Book:
    book_id: str
    title: str
    author: str
    thumbnail: str
    tags: List[str]
    avg_rating: float
    num_ratings: int
    description: str

    @staticmethod
    def load_all():
        fn = path.join(path.dirname(__file__), "books.yml")
        with open(fn, "rt") as f:
            contents = f.read()

        books = []
        for book in yaml.load_all(contents):
            if book is None:
                continue
            local_thumbnail = download_thumbnail(book["thumbnail"])
            books.append(
                Book(
                    book_id=shortuuid.random(),
                    title=book["title"],
                    author=book["author"],
                    thumbnail=local_thumbnail,
                    tags=book["tags"],
                    avg_rating=book["avg_rating"],
                    num_ratings=book["num_ratings"],
                    description=book["description"],
                )
            )

        return books
