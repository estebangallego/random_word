class RandomController < ApplicationController
	def index
		@randomWord = session[:randomWord]
		@counter = session[:counter]
		@show_message = "Random word generator (attempt #{@counter})"
	end

	def generate
		@randomWord = (0...10).map { (65 + rand(26)).chr }.join
		session[:randomWord] = @randomWord

		if session[:counter].nil?
  		  session[:counter] = 0
		end
		session[:counter] += 1
		redirect_to '/'
	end
end
