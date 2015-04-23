class PagesController < ApplicationController

	def home
		@tools = Tool.limit(6).order("RANDOM()")
	end

	def about
	end
	
end
