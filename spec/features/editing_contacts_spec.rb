require 'rails_helper'

feature 'Editing contacts' do
  background do
    visit '/'
    click_link 'New Contact'
    fill_in 'contact_first_name', with: "Adam"
    fill_in 'contact_last_name', with: "Wanninger"
    fill_in 'contact_email_address', with: "wanninaj@miamioh.edu"
    fill_in 'contact_company_name', with: "The Legion of Doom"
    fill_in 'contact_phone_number', with: "513.227.0843"
    click_button 'Create Contact'
    click_link 'Back'
    click_link 'Edit'
  end
  scenario 'Can edit a contact' do
    fill_in 'contact_email_address', with: "freddy_johnes@gmail.com"
    click_button 'Update Contact'

    # verify that our new email is present
    expect(page).to have_content("freddy_johnes@gmail.com")

    # verify that no other attributes were changed
    expect(page).to have_content("Adam")
    expect(page).to have_content("Wanninger")
    expect(page).to have_content("The Legion of Doom")
    expect(page).to have_content("513.227.0843")
  end
end