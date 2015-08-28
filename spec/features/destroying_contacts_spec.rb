require 'rails_helper'

feature 'Editing posts' do
  background do
    visit '/'
    click_link('New Contact')
    fill_in 'contact_first_name', with: "Adam"
    fill_in 'contact_last_name', with: "Wanninger"
    fill_in 'contact_email_address', with: "wanninaj@miamioh.edu"
    fill_in 'contact_company_name', with: "The Legion of Doom"
    fill_in 'contact_phone_number', with: "513.227.0843"
    click_button 'Create Contact'
    click_link 'Back'
  end
  scenario 'Can delete a contact' do
    click_link 'Destroy'

    # negative test to ensure that my info was deleted
    expect(page).to_not have_content("Adam")
  end
end