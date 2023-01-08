require 'rails_helper'

RSpec.describe "chef show page", type: :feature do
  let!(:chef) { Chef.create!(name: 'Sir Alex Pitzel') }
  let!(:dish) { chef.dishes.create!(name: 'Pizza', description: 'description goes here') }

  describe 'when I visit a chefs show page' do
    it 'displays the name of the chef' do
      visit chef_path(chef)

      expect(page).to have_content('Sir Alex Pitzel')
    end

    it 'displays all of the dishes that belong to that chef'
    it 'has a form to add an existing dish to that chef'
    it 'lets me fill in the id of a dish and correctly adds it to the chef'
  end
end
