require 'rails_helper'

RSpec.describe 'chef show page', type: :feature do
  let!(:chef) { Chef.create!(name: 'Sir Alex Pitzel') }
  let!(:dish1) { chef.dishes.create!(name: 'Pizza', description: 'description goes here') }
  let!(:dish2) { chef.dishes.create!(name: 'Wings', description: 'description goes here') }
  let!(:dish3) { chef.dishes.create!(name: 'Ground Beef and Potatoes', description: 'description goes here') }

  describe 'when I visit a chefs show page' do
    it 'displays the name of the chef' do
      visit chef_path(chef)

      expect(page).to have_content('Sir Alex Pitzel')
    end

    it 'displays all of the dishes that belong to that chef' do
      visit chef_path(chef)

      within '#dishes' do
        expect(page).to have_content(dish1.name)
        expect(page).to have_content(dish2.name)
        expect(page).to have_content(dish3.name)
      end
    end

    it 'has a form to add an existing dish to that chef' do
      visit chef_path(chef)
      within '#add_dish' do
        expect(page).to have_content('Add a dish by id:')
        expect(page).to have_field('chef[dish_id]')
        expect(page).to have_button('Add Dish')
      end
    end

    it 'lets me fill in the id of a dish and correctly adds it to the chef' do
      chef2 = Chef.create!(name: 'Bad Chef')
      dish4 = chef2.dishes.create!(name: 'Fajitas', description: 'description goes here')

      visit chef_path(chef)

      within '#dishes' do
        expect(page).not_to have_content(dish4.name)
      end

      within '#add_dish' do
        fill_in 'chef[dish_id]', with: dish4.id
        click_button('Add Dish')
      end

      expect(current_path).to eq(chef_path(chef))

      within '#dishes' do
        expect(page).to have_content(dish4.name)
      end
    end

    it 'has a link to visit all ingredients that chef uses' do
      visit chef_path(chef)

      expect(page).to have_link('All Ingredients', href: chef_ingredients_path(chef))

      click_link('All Ingredients')

      expect(current_path).to eq(chef_ingredients_path(chef))
    end
  end
end
