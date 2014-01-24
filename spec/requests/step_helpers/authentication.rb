def sign_in_as(account)
  visit sign_in_path
  fill_in 'Uid', :with => account.email
  fill_in 'Password', :with => account.password
  click_button 'Submit'
  account
end
