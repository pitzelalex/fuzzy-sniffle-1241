require 'rails_helper'

RSpec.describe "chef ingredients index page", type: :feature do
  let!(:chef) { Chef.create!(name: 'Sir Alex Pitzel') }
  let!(:dish1) { chef.dishes.create!(name: 'Pizza', description: 'description goes here') }
  let!(:dish2) { chef.dishes.create!(name: 'Mozza Melt Sandwich', description: 'description goes here') }
  let!(:ingredient1) { Ingredient.create!(name: 'Pepperoni', calories: '300') }
  let!(:ingredient2) { Ingredient.create!(name: 'Mozzarella Cheese', calories: '400') }
  let!(:ingredient3) { Ingredient.create!(name: 'Pizza Dough', calories: '150') }
  let!(:ingredient4) { Ingredient.create!(name: 'Crackers', calories: '200') }
  let!(:di1) { DishIngredient.create!(dish_id: dish1.id, ingredient_id: ingredient1.id) }
  let!(:di2) { DishIngredient.create!(dish_id: dish1.id, ingredient_id: ingredient2.id) }
  let!(:di3) { DishIngredient.create!(dish_id: dish1.id, ingredient_id: ingredient3.id) }
  let!(:di4) { DishIngredient.create!(dish_id: dish2.id, ingredient_id: ingredient1.id) }
  let!(:di4) { DishIngredient.create!(dish_id: dish2.id, ingredient_id: ingredient2.id) }

  describe 'as a visitor, when i visit the chef ingredients index page' do
    it 'displays a unique list of names of all ingredients the chef uses' do
      visit chef_ingredients_path(chef)

      expect(page).to have_content(ingredient1.name)
      expect(page).to have_content(ingredient2.name)
      expect(page).to have_content(ingredient3.name)
      expect(page).not_to have_content(ingredient4.name)
    end
  end
end
