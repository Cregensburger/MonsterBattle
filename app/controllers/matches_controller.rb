class MatchesController < ApplicationController
	# Reflects a list of all monsters able to fight
	# In the future, we would implement a random listing of
	# maybe 10-15 monsters
	def index 
		@matches = Match.all
	end

	# When a new match is started, execute the battle algorithm
	# and record the result into DB, alerting the user
	# reset the index to show a new list of enemies
	def new 
		@match = Match.new
	end

	# Not entirely clear what this portion is for as opposed to 
	# new method seen above. 
	def create
		@match = Match.new(match_params)
	end

	# Records all personal matches.
	# In the future, this would be used in a feature that would 
	# Show a sample of the last 5 (or so) fights and, if expanded,
	# would show a user's entire history. 
	def user_matches  
		@matches = Match.personal_matches(current_user)
	end 

end