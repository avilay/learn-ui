import os
from dataclasses import dataclass

import snowballstemmer  # type: ignore

# from pydantic import BaseModel  # type: ignore
from pyodide.ffi import to_js  # type: ignore


@dataclass
class Cookie:
    flavor: str
    calories: int


def load_cookies() -> list[str]:
    return to_js(
        [
            "Chocolate Chip",
            "Snicker Doodle",
            "Oatmeal Raisin",
        ]
    )


def load_holidays() -> list[str]:
    return to_js(["Diwali", "Thanksgiving", "Halloween"])


def load_cookie(flavor: str) -> Cookie:
    if flavor.lower() == "choclate chip":
        return to_js(Cookie("Chocolate Chip", 200))
    elif flavor.lower() == "oatmeal raisin":
        return to_js(Cookie("Oatmeal Raisin", 180))
    else:
        return to_js(Cookie("Snicker Doodle", 220))


def stem() -> list[str]:
    stemmer = snowballstemmer.stemmer("english")
    return stemmer.stemWords("go goes going gone".split())


def listdir() -> list[str]:
    return to_js(os.listdir("/mount_dir"))
