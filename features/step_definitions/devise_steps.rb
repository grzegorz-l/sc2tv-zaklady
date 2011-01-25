Given /^I am not authenticated$/ do
  visit('/users/sign_out') # ensure that at least
end

Given /^I have one\s+user "([^\"]*)" with email "([^\"]*)" and password "([^\"]*)"$/ do |username, email, password|
  User.new(:username => username,
           :email => email,
           :password => password,
           :password_confirmation => password).save!
end

Given /^I am a new, authenticated user$/ do
  email = 'testing@man.net'
  username = 'Testing man'
  password = 'secretpass'

  Given %{I have one user "#{username}" with email "#{email}" and password "#{password}"}
  And %{I go to the login page}
  And %{I fill in "Nazwa użytkownika" with "#{username}"}
  And %{I fill in "Hasło" with "#{password}"}
  And %{I press "Zaloguj"}
end

Given /^I have one\s+admin "([^\"]*)" with email "([^\"]*)" and password "([^\"]*)"$/ do |username, email, password|
  Admin.new(:username => username,
           :email => email,
           :password => password,
           :password_confirmation => password).save!
end

Given /^I am an admin$/ do

  email = 'admin@website.com'
  username = 'testAdmin'
  password = 'secretpass'

  Given %{I have one admin "#{username}" with email "#{email}" and password "#{password}"}
  And %{I go to the admin login page}
  And %{I fill in "Nazwa użytkownika" with "#{username}"}
  And %{I fill in "Hasło" with "#{password}"}
  And %{I press "Zaloguj"}
end