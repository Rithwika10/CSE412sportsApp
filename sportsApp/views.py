from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth.decorators import login_required
from django.contrib.auth import login, logout, authenticate
from django.db.models import Q
from django.contrib import messages
from .models import City, Sport, Player, Crew
from .forms import searchForm, UserRegistrationForm, LoginForm

def login_redirect(request):
    if request.user.is_authenticated:
        return redirect('home')
    return redirect('login')

@login_required
def home(request):
    form = searchForm(request.GET)
    cities = City.objects.all()
    sports = Sport.objects.all()

    if form.is_valid():
        searchQuery = form.cleaned_data.get('searchQuery')
        if searchQuery:
            cities = cities.filter(
                Q(name__icontains=searchQuery) |
                Q(county__icontains=searchQuery) |
                Q(state__icontains=searchQuery)
            ).distinct()

    return render(request, 'sportsApp/home.html', {
        'form': form,
        'cities': cities,
        'sports': sports,
    })

@login_required
def sports(request):
    sports = Sport.objects.all()
    return render(request, 'sportsApp/sports.html', {'sports': sports})

@login_required
def sport_detail(request, sport_id):
    """Show details for a specific sport."""
    sport = get_object_or_404(Sport, sport_id=sport_id)
    return render(request, 'sportsApp/sport_detail.html', {'sport': sport})

@login_required
def sport_signup(request, sport_id):
    """Allow user to sign up as a player or crew."""
    sport = get_object_or_404(Sport, sport_id=sport_id)
    if request.method == 'POST':
        signup_type = request.POST.get('signup_type')
        if signup_type == 'player':
            Player.objects.create(person=None, stats="Signed Up", division="None")  # Replace None with actual logic
            messages.success(request, f"You've successfully signed up as a player for {sport.name}!")
        elif signup_type == 'crew':
            Crew.objects.create(person=None, pay_rate=0)  # Replace None with actual logic
            messages.success(request, f"You've successfully signed up as crew for {sport.name}!")
        return redirect('sports')  # Redirect to the sports page after signing up
    return render(request, 'sportsApp/sport_detail.html', {'sport': sport})

@login_required
def signup_player(request, sport_id):
    """Handle player sign-up confirmation."""
    sport = get_object_or_404(Sport, sport_id=sport_id)
    if request.method == 'POST':
        # Create a new Player instance
        Player.objects.create(
            person=None,  # Replace `None` with logic to associate the user with a person
            stats="Signed Up",
            division="Default Division"
        )
        return redirect('signup_success')  # Redirect to the confirmation page
    return render(request, 'sportsApp/signup_player.html', {'sport': sport})


@login_required
def signup_crew(request, sport_id):
    """Handle crew sign-up confirmation."""
    sport = get_object_or_404(Sport, sport_id=sport_id)
    if request.method == 'POST':
        # Logic for signing up as a crew
        Crew.objects.create(
            person=None,  # Replace with actual logic to fetch the user
            pay_rate=0.0
        )
        messages.success(request, f"You have successfully signed up as crew for {sport.name}!")
        return redirect('sports')  # Redirect to the sports page or another page
    return render(request, 'sportsApp/signup_crew.html', {'sport': sport})

@login_required
def signup_success(request):
    """Render the confirmation page after a successful sign-up."""
    return render(request, 'sportsApp/signup_success.html')


@login_required
def city_detail(request, city_id):
    city = get_object_or_404(City, city_id=city_id)
    sports_in_city = Sport.objects.filter(location__locationcity__city=city)
    return render(request, 'sportsApp/city_detail.html', {
        'city': city,
        'sports_in_city': sports_in_city,
    })

def register(request):
    if request.method == 'POST':
        form = UserRegistrationForm(request.POST)
        if form.is_valid():
            user = form.save()
            messages.success(request, 'Registration successful! Please log in.')
            return redirect('login')
        else:
            messages.error(request, 'Please correct the errors below.')
    else:
        form = UserRegistrationForm()
    return render(request, 'sportsApp/register.html', {'form': form})

def user_login(request):
    if request.method == 'POST':
        form = LoginForm(request, data=request.POST)
        if form.is_valid():
            user = form.get_user()
            login(request, user)
            messages.success(request, f'Welcome, {user.username}!')
            return redirect('home')
        else:
            messages.error(request, 'Invalid username or password.')
    else:
        form = LoginForm()
    return render(request, 'sportsApp/login.html', {'form': form})

def user_logout(request):
    logout(request)
    messages.success(request, 'You have been logged out.')
    return redirect('login')
