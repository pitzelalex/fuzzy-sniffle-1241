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

    it 'displays a list of ingredients for that dish' do
      chef = Chef.create!(name: 'Sir Alex Pitzel')
      dish = chef.dishes.create!(name: 'Pizza', description: 'description goes here')
      ingredient1 = Ingredient.create!(name: 'Pepperoni', calories: '300')
      ingredient2 = Ingredient.create!(name: 'Mozzarella Cheese', calories: '400')
      ingredient3 = Ingredient.create!(name: 'Pizza Dough', calories: '150')
      DishIngredient.create!(dish_id: dish.id, ingredient_id: ingredient1.id)
      DishIngredient.create!(dish_id: dish.id, ingredient_id: ingredient2.id)
      DishIngredient.create!(dish_id: dish.id, ingredient_id: ingredient3.id)
      visit dish_path(dish)

      within '#ingredients' do
        expect(page).to have_content('Ingredients:')
        expect(page).to have_content(ingredient1.name)
        expect(page).to have_content(ingredient2.name)
        expect(page).to have_content(ingredient3.name)
      end
    end
    it 'displays a total calorie count for that dish'
    it 'displays the chefs name'
  end
end
