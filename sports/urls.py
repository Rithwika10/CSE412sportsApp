"""sports URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from sportsApp import views

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', views.login_redirect, name='login_redirect'),  # Redirect unauthenticated users
    path('home/', views.home, name='home'),  # Home page
    path('city/<int:city_id>/', views.city_detail, name='city_detail'),  # City details
    path('register/', views.register, name='register'),  # Registration page
    path('login/', views.user_login, name='login'),  # Login page
    path('logout/', views.user_logout, name='logout'),  # Logout page
    path('sports/', views.sports, name='sports'),  # Sports page
    path('sports/<int:sport_id>/', views.sport_detail, name='sport_detail'),  # Sport details
    path('sports/<int:sport_id>/signup/', views.sport_signup, name='sport_signup'),  # Sport sign-up
    path('sports/<int:sport_id>/signup/player/', views.signup_player, name='signup_player'),  # Player signup
    path('sports/<int:sport_id>/signup/crew/', views.signup_crew, name='signup_crew'),  # Crew signup
    path('signup/success/', views.signup_success, name='signup_success'),  # New confirmation page
]



