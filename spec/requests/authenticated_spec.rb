require 'spec_helper'

feature 'Signed in user', :js => true do
  scenario 'Sees and dismisses helper' do
    sign_in_as(create(:user))
    page.should have_content 'Hello world'
    click_link 'Close'
    sleep 1
    page.should_not have_content 'Hello world'
    visit root_path
    page.should_not have_content 'Hello world'
    page.should_not have_selector '.dismissible'
    visit sign_out_path
    page.should have_content 'Hello world'
  end

  scenario 'Sees, dismisses and restores a restorable helper', :js => true do
    sign_in_as(create(:user))
    visit '/landing/restorable'

    # hide a restorable helper
    page.should have_content 'Click to Dismiss or Show'
    click_on 'Close'
    sleep 1
    page.should_not have_content 'Click to Dismiss or Show'
    page.should have_content 'Open'
    visit '/landing/restorable'
    page.should_not have_content 'Click to Dismiss or Show'
    page.should have_content 'Open'

    # restore a hidden restorable helper
    click_on 'Open'
    sleep 1
    page.should have_content 'Click to Dismiss or Show'
    page.should_not have_content 'Open'
    page.should have_content 'Close'

    visit '/landing/restorable'
    page.should have_content 'Click to Dismiss or Show'
    page.should_not have_content 'Open'
    page.should have_content 'Close'
  end
end
