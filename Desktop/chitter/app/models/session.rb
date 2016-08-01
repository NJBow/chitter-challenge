+module SessionHelpers
 +
 +  def sign_up(email: 'a', username: "a", password: 'a', password_confirmation: 'a')
 +    visit 'users/new'
 +    fill_in :email, with: email
 +    fill_in :username, with: username
 +    fill_in :password, with: password
 +    fill_in :password_confirmation, with: password_confirmation
 +    click_button 'chat that chit'
 +  end
 +
 +  def sign_in(email:, password:)
 +    visit '/sessions/new'
 +    fill_in :email, with: email
 +    fill_in :password, with: password
 +    click_button 'Sign In'
 +  end
 +
 +end
