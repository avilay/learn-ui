from datetime import datetime as dt
from js import console

from utils import add_class, remove_class

tasks = []

task_template_div = Element("task-template").select(".task", from_content=True)  # noqa
task_list_section_div = Element("task-list")  # noqa
new_task_input = Element("new-task")  # noqa


def add_task(*args, **kwargs):
    console.log("APTG: Inside add_task")
    if not new_task_input.element.value:
        return None

    task_id = f"task-{len(tasks)}"
    task = {
        "id": task_id,
        "content": new_task_input.element.value,
        "done": False,
        "created_at": dt.now(),
    }
    tasks.append(task)

    task_div = task_template_div.clone(task_id, to=task_list_section_div)

    task_span = task_div.select("label").select("span")
    task_span.element.innerText = task["content"]
    task_check = task_div.select("input")
    task_list_section_div.element.appendChild(task_div.element)

    def check_task(evt=None):
        task["done"] = not task["done"]
        if task["done"]:
            add_class(task_span, "is-done")
        else:
            remove_class(task_span, "is-done")

    task_check.element.onclick = check_task
    new_task_input.clear()


def add_task_event(e):
    if e.key == "Enter":
        add_task()


new_task_input.element.onkeypress = add_task_event
