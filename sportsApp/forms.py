from django import forms

class searchForm(forms.Form):
    searchQuery = forms.CharField(label='Search', max_length=200, required=False, widget=forms.TextInput(attrs={'placeholder': "Search for a person, location, or piece of equipment!"}))
    tableType = forms.ChoiceField(choices=[('', 'All'), ('sport', 'Sport'), ('person', 'Person'), ('crew', 'Crew Member'), ('player', 'Player'), ('equipment', 'Equipment'), ('location', 'Location'), ('city', 'City')], required=False)
