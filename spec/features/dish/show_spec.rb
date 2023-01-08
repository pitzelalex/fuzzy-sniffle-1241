require 'rails_helper'

RSpec.describe "dish/show.html.erb", type: :feature do
  describe 'when I visit a dishes show page' do
    it 'displays the dishes name and description' do
      chef = Chef.create!(name: 'Sir Alex Pitzel')
      dish = chef.dishes.create!(name: 'Pizza', description: 'description goes here')
      visit dish_path(dish)

      expect(page).to have_content('Dish Name: Pizza')
      expect(page).to have_content('Dish Description: description goes here')
    end

    it 'displays a list of ingredients for that dish'
    it 'displays a total calorie count for that dish'
    it 'displays the chefs name'
  end
end
