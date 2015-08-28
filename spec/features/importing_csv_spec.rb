require 'rails_helper.rb'

feature 'index displays a list of contacts after uploading .csv file' do
  scenario 'the index displays correct header & contact information' do
    visit '/'
    expect(page).to have_content("Contacts First name Last name Email address Company Name Phone Number New Contact Import Contacts") # first contact in file
    attach_file('file', 'data.csv')
    click_button('Import')
    expect(page).to have_content("Gerhard	Kautzer	gerhardkautzer@cronabayer.com	1-207-643-1816	Hodkiewicz-Lynch") # first contact in file
    expect(page).to have_content("Giuseppe	Heathcote	giuseppeheathcote@murraykuvalis.us	1-315-438-6553	Bashirian, Jacobson and Crist") # last contact in file
  end
end