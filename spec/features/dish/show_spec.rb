require 'rails_helper'

RSpec.describe "dish/show.html.erb", type: :feature do
  let!(:chef) { Chef.create!(name: 'Sir Alex Pitzel') }
  let!(:dish) { chef.dishes.create!(name: 'Pizza', description: 'description goes here') }
  let!(:ingredient1) { Ingredient.create!(name: 'Pepperoni', calories: '300') }
  let!(:ingredient2) { Ingredient.create!(name: 'Mozzarella Cheese', calories: '400') }
  let!(:ingredient3) { Ingredient.create!(name: 'Pizza Dough', calories: '150') }
  let!(:di1) { DishIngredient.create!(dish_id: dish.id, ingredient_id: ingredient1.id) }
  let!(:di2) { DishIngredient.create!(dish_id: dish.id, ingredient_id: ingredient2.id) }
  let!(:di3) { DishIngredient.create!(dish_id: dish.id, ingredient_id: ingredient3.id) }

  describe 'when I visit a dishes show page' do
    it 'displays the dishes name and description' do
      visit dish_path(dish)

      expect(page).to have_content('Dish Name: Pizza')
      expect(page).to have_content('Dish Description: description goes here')
    end

    it 'displays a list of ingredients for that dish' do
      visit dish_path(dish)

      within '#ingredients' do
        expect(page).to have_content('Ingredients:')
        expect(page).to have_content(ingredient1.name)
        expect(page).to have_content(ingredient2.name)
        expect(page).to have_content(ingredient3.name)
      end
    end
    it 'displays a total calorie count for that dish' do
      visit dish_path(dish)

      expect(page).to have_content('Total Calories: 850')
    end
    it 'displays the chefs name' do
      visit dish_path(dish)

      expect(page).to have_content('Chef: Sir Alex Pitzel')
    end
  end
end
