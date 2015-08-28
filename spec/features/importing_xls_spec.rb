require 'rails_helper.rb'

feature 'index displays a list of contacts after uploading .xls file' do
  scenario 'the index displays correct header & contact information' do
    visit '/'
    expect(page).to have_content("Contacts First name Last name Email address Company Name Phone Number New Contact Import Contacts") # first contact in file
    attach_file('file', File.join(Rails.root, 'spec/features/data.xls'))
    click_button('Import')

    sleep(30)
    expect(page).to have_content("Gerhard Kautzer gerhardkautzer@cronabayer.com Hodkiewicz-Lynch 1-207-643-1816") # first contact in file
    expect(page).to have_content("Giuseppe Heathcote giuseppeheathcote@murraykuvalis.us Bashirian, Jacobson and Crist 1-315-438-6553") # last contact in file
  end
end