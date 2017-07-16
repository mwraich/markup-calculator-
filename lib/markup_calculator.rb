class MarkupCalculator
  attr_reader :worker_count, :material_type
  attr_accessor :flat_markup

  FLAT_MARKUP = 0.05.freeze
  WORKER_MARKUP = 0.012.freeze
  MATERIAL_MARKUP = {drugs: 0.075, food: 0.13, electronics: 0.02}

  def initialize(base_price, worker_count, material_type)
    @flat_markup = format_flat_markup(base_price)
    @worker_count = worker_count.split.first.to_i
    @material_type = material_type
  end

  def format_flat_markup(base_price)
    formated_base_price = base_price.delete('$,').to_f
    formated_base_price + (formated_base_price * FLAT_MARKUP)
  end

  def worker_markup
    flat_markup * (worker_count * WORKER_MARKUP) 
  end

  def material_markup
    MATERIAL_MARKUP[material_type.to_sym] ? (flat_markup * MATERIAL_MARKUP[material_type.to_sym]) : 0
  end

  def total
    total = (flat_markup + worker_markup + material_markup).round(2)
    "$#{total.to_s.gsub(/(\d)(?=\d{3}+(\.\d*)?$)/, '\1,')}"
  end
end
