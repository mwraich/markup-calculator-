class MarkupCalculator
attr_reader :base_price, :worker_count, :material_type

def initialize(base_price, worker_count, material_type)
  @base_price = base_price
  @worker_count = worker_count
  @material_type = material_type
end

# Without exception, there is a flat markup on all jobs of 5%
# For each person that needs to work on the job, there is a markup of 1.2%

# materials

# If pharmaceuticals are involved, there is an immediate 7.5% markup
# For food, there is a 13% markup
# Electronics require a 2% markup
# Everything else, there is no markup

# Another system calculates the base price depending on how many products need to be repackaged. As such, the markup calculator should accept the initial base price along with the different categories of markups and calculate a final cost for a project.

# The flat markup is calculated first and then all other markups are calculated on top of the base price plus flat markup.

end
