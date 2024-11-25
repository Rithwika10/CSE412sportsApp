from django.shortcuts import render

def home(request):
    return render(request, 'sportsApp/home.html')  # Render the home.html template
