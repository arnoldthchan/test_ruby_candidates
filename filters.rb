# In this file we define the methods to help filter out candidates
# This way, we keep these methods separated from other potential parts of the program

def find(id)
  @candidates.find {|candidate| candidate[:id] == id}
end

def experienced?(candidate)
  candidate[:years_of_experience] >= 2
end

def qualified_candidates(candidates)
  qualified = []
  candidates.each do |candidate|
    if qualified? candidate
      qualified << candidate
    end
  end
  pp "QUALIFIED CANDIDATES"
  pp qualified
end

def ordered_by_qualifications (candidates)
  pp "SORTED BY EXPERIENCE"
  most_qualified = candidates.sort_by {|candidate| [candidate[:years_of_experience], candidate[:github_points]]}
  pp most_qualified
end

def qualified?(candidate)
  (experienced? candidate) &&
  (enough_points? candidate) &&
  (languages? candidate) &&
  (new_applicant? candidate) &&
  (over_18? candidate)
end

def enough_points?(candidate)
  candidate[:github_points] >= 100
end

def languages?(candidate)
  (ruby? candidate )||( python? candidate)
  # (candidate[:languages].include? "Ruby")||(candidate[:languages].include? "Python")
end

def ruby?(candidate)
  candidate[:languages].include? "Ruby"
end

def python?(candidate)
  candidate[:languages].include? "Python"
end

def new_applicant?(candidate)
  candidate[:date_applied] > 15.days.ago.to_date
end

def over_18?(candidate)
  candidate[:age] >= 18
end