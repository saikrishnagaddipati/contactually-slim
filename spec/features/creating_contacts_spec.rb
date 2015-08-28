require 'rails_helper'

feature 'Editing posts' do
  background do
    visit '/'
    click_link('New Contact')
  end
  scenario 'Can manually create a contact' do
    fill_in 'contact_first_name', with: "Adam"
    fill_in 'contact_last_name', with: "Wanninger"
    fill_in 'contact_email_address', with: "wanninaj@miamioh.edu"
    fill_in 'contact_company_name', with: "The Legion of Doom"
    fill_in 'contact_phone_number', with: "513.227.0843"
    click_button 'Create Contact'

    expect(page).to have_content("Adam")
    expect(page).to have_content("Wanninger")
    expect(page).to have_content("wanninaj@miamioh.edu")
    expect(page).to have_content("The Legion of Doom")
    expect(page).to have_content("513.227.0843")
  end
end