require 'rails_helper'

RSpec.describe Chef, type: :model do
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

  describe "validations" do
    it {should validate_presence_of :name}
  end

  describe "relationships" do
    it {should have_many :dishes}
    it {should have_many(:ingredients).through(:dishes)}
  end

  describe 'instance methods' do
    describe '#all_ingredients' do
      it 'returns all unique ingredients used by a chef' do
        expect(chef.all_ingredients).to eq([ingredient1, ingredient2, ingredient3])
      end
    end
  end
end
