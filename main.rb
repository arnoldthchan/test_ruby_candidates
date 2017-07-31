# This is the main entrypoint into the program
# It requires the other files/gems that it needs

require 'pry'
require './candidates'
require './filters'

experienced? @candidates[0]
find 5
qualified_candidates @candidates
ordered_by_qualifications @candidates
# binding.pry

# pp @candidates
