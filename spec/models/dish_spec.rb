require 'rails_helper'

RSpec.describe Dish, type: :model do
  let!(:chef) { Chef.create!(name: 'Sir Alex Pitzel') }
  let!(:dish) { chef.dishes.create!(name: 'Pizza', description: 'description goes here') }
  let!(:ingredient1) { Ingredient.create!(name: 'Pepperoni', calories: '300') }
  let!(:ingredient2) { Ingredient.create!(name: 'Mozzarella Cheese', calories: '400') }
  let!(:ingredient3) { Ingredient.create!(name: 'Pizza Dough', calories: '150') }
  let!(:di1) { DishIngredient.create!(dish_id: dish.id, ingredient_id: ingredient1.id) }
  let!(:di2) { DishIngredient.create!(dish_id: dish.id, ingredient_id: ingredient2.id) }
  let!(:di3) { DishIngredient.create!(dish_id: dish.id, ingredient_id: ingredient3.id) }

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :description }
  end

  describe 'relationships' do
    it { should belong_to :chef }
    it { should have_many :dish_ingredients }
    it { should have_many(:ingredients).through(:dish_ingredients) }
  end

  describe 'instance methods' do
    describe '#total_calories' do
      it 'returns the total calories for a dish' do
        expect(dish.total_calories).to eq(850)
      end
    end
  end
end
