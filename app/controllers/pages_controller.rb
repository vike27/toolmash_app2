class PagesController < ApplicationController

	def home
		@tools = Tool.order("Random()").first(6)
	end

end
