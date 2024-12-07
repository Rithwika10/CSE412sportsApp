from django import forms
from django.contrib.auth.models import User
from django.contrib.auth.forms import AuthenticationForm

class searchForm(forms.Form):
    searchQuery = forms.CharField(label='Search', max_length=200, required=False, widget=forms.TextInput(attrs={'placeholder': "Search for a person, location, or piece of equipment!"}))
    tableType = forms.ChoiceField(choices=[('', 'All'), ('sport', 'Sport'), ('person', 'Person'), ('crew', 'Crew Member'), ('player', 'Player'), ('equipment', 'Equipment'), ('location', 'Location'), ('city', 'City')], required=False)


class UserRegistrationForm(forms.ModelForm):
    password = forms.CharField(label='Password', widget=forms.PasswordInput)
    password_confirm = forms.CharField(label='Confirm Password', widget=forms.PasswordInput)

    class Meta:
        model = User
        fields = ['username', 'email', 'first_name', 'last_name', 'password']

    def clean_password_confirm(self):
        password = self.cleaned_data.get('password')
        password_confirm = self.cleaned_data.get('password_confirm')
        if password != password_confirm:
            raise forms.ValidationError("Passwords do not match")
        return password_confirm

class LoginForm(AuthenticationForm):
    username = forms.CharField(label='Username')
    password = forms.CharField(label='Password', widget=forms.PasswordInput)
