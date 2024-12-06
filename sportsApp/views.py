from django.shortcuts import render
from django.db.models import Q
from .models import City, Crew, Equipment, Location, LocationCity, Person, Player, Sport
from .forms import searchForm

def home(request):
    form = searchForm(request.GET)
    cities = City.objects.all()
    crewMembers = Crew.objects.all()
    locations = Location.objects.all()
    location_city_obj = LocationCity.objects.all()
    persons = Person.objects.all()
    players = Player.objects.all()
    sports = Sport.objects.all()

    if form.is_valid():
        searchQuery = form.cleaned_data.get('searchQuery')
        #tableType = form.cleaned_data.get('tableType')

        if searchQuery:
            cities = cities.filter(Q(name__icontains=searchQuery) | Q(county__icontains=searchQuery) | Q(state__icontains=searchQuery))
            #persons = persons.filter(Q(name__icontains=searchQuery))



    return render(request, 'sportsApp/home.html', {'form': form, 'cities': cities})  # Render the home.html template
