from django.http import HttpResponseRedirect

# from django.http import Http404, HttpResponse
from django.shortcuts import render, get_object_or_404
from django.urls import reverse
from django.db.models import F
from django.views import generic

# from django.template import loader
from .models import Question, Choice


# def index(request):
#     qs = Question.objects.order_by("-pub_date")[:5]
#     context = {"qs": qs}
#     # template = loader.get_template("polls/index.html")
#     # return HttpResponse(template.render(context, request))
#     return render(request, "polls/index.html", context)


class IndexView(generic.ListView):
    # generic.ListView's default template is <appname>/<modelname>_list.html
    # I want to use index.html template instead
    template_name = "polls/index.html"

    # generic.ListView's default conetxt variable name is question_list
    # because the model name is Question
    # I want to use qs instead
    context_object_name = "qs"

    def get_queryset(self):
        return Question.objects.order_by("-pub_date")[:5]


# def detail(request, question_id):
#     # try:
#     #     question = Question.objects.get(id=question_id)
#     # except Question.DoesNotExist:
#     #     raise Http404("Question does not exist!")
#     # return render(request, "polls/detail.html", {"question": question})
#     question = get_object_or_404(Question, id=question_id)
#     return render(request, "polls/detail.html", {"question": question})


class DetailView(generic.DetailView):
    # generic.DetailView will pass the model Question object as the variable
    # question to the template. Fortunately, that is what we have used in our template.
    # The url param is named pk. DetailView will automagically get the model object
    # with that primary key, so we don't even have to query the db.
    model = Question

    # generic.DetailView's default template is <app name>/<model name>_detail.html
    # but we have multiple DetailViews and we don't want all of them to look the same
    # so we use a different template.
    template_name = "polls/detail.html"


# def results(request, question_id):
#     question = get_object_or_404(Question, id=question_id)
#     return render(request, "polls/results.html", {"question": question})


class ResultsView(generic.DetailView):
    model = Question
    template_name = "polls/results.html"


def vote(request, question_id):
    # return HttpResponse(f"You're voting on question {question_id}")
    question = get_object_or_404(Question, id=question_id)
    try:
        selected_choice = question.choice_set.get(id=request.POST["choice"])
    except (KeyError, Choice.DoesNotExist):
        return render(
            request,
            "polls/detail.html",
            {"question": question, "error_message": "You didn't select a choice!"},
        )
    else:
        # selected_choice.votes += 1
        # Using F functions avoids race conditions
        # by making updates directly on the db
        selected_choice.votes = F("votes") + 1
        selected_choice.save()
        return HttpResponseRedirect(reverse("polls:results", args=(question.id,)))
