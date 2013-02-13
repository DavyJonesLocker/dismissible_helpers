require 'spec_helper'

feature 'Signed in user', :js do
  scenario 'Sees and dismisses helper' do
    sign_in_as(create(:user))
    page.should have_content 'Hello world'
    click_link 'Close'
    sleep 1
    page.should_not have_content 'Hello world'
    visit root_path
    page.should_not have_content 'Hello world'
    visit sign_out_path
    page.should have_content 'Hello world'
  end
end
