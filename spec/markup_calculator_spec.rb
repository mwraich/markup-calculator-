require_relative '../lib/markup_calculator'

describe MarkupCalculator do
  it 'accepts a base price, number of workers and material type' do
    calc = MarkupCalculator.new('$1,299.99', '3 people', 'food')
    expect(calc.flat_markup).to eq(1299.99 + (1299.99 * 0.05))
    expect(calc.worker_count).to eq(3)
    expect(calc.material_type).to eq('food')
  end
end

#1
# Input: $1,299.99, 3 people, food
# Output: $1,591.58

#2
# Input: $5,432.00, 1 person, drugs
# Output: $6,199.81

# 3
# Input: $12,456.95, 4 people, books
# Output: $13,707.63
