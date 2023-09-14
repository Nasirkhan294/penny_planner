require 'rails_helper'

RSpec.feature 'Categories', type: :feature do
  background do
    visit root_path
    click_link 'Sign up'
    fill_in 'Name', with: 'Nasir'
    fill_in 'Email', with: 'nasir@gmail.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_button 'Sign up'
  end

  scenario 'Welcome! You have signed up successfully.' do
    expect(page).to have_content('Welcome! You have signed up successfully.')
  end

  scenario 'show empty category alert message' do
    visit groups_path
    expect(page).to have_content('There is no category added!!!')
  end

  scenario 'add new category' do
    visit groups_path
    click_link 'Add a new category'
    fill_in 'Name', with: 'Test Category'
    attach_file('Image', Rails.root.join('app/assets/images/groceries.jpg'))
    click_button 'Create Category'
    expect(page).to have_content('Test Category')
    expect(page).to have_link('Remove')
  end

  scenario 'add new transaction' do
    visit groups_path
    click_link 'Add a new category'
    fill_in 'Name', with: 'Test Category'
    attach_file('Image', Rails.root.join('app/assets/images/groceries.jpg'))
    click_button 'Create Category'
    expect(page).to have_content('Test Category')
    expect(page).to have_link('Remove')
  end
end
