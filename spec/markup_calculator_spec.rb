require_relative '../lib/markup_calculator'

describe MarkupCalculator do
  context 'flat markup price' do
    it 'accepts a base price, number of workers and material type' do
      calc = MarkupCalculator.new('$1,299.99', '3 people', 'food')
      expect(calc.flat_markup).to eq(1299.99 + (1299.99 * MarkupCalculator::FLAT_MARKUP))
      expect(calc.worker_count).to eq(3)
      expect(calc.material_type).to eq('food')
    end
  end
  context '#worker_markup' do
    it 'has a worker markup of 1.2% per person' do
      calc = MarkupCalculator.new('$1,299.99', '3 people', 'food')
      expect(calc.worker_markup).to eq(calc.flat_markup * (3 * MarkupCalculator::WORKER_MARKUP))
    end
  end
  context '#material_markup' do
    it 'has a 13% markup for drugs' do
      calc = MarkupCalculator.new('$1,299.99', '3 people', 'drugs')
      expect(calc.material_markup).to eq(calc.flat_markup * 0.075)
    end
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
