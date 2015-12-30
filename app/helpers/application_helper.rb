module ApplicationHelper
	def pagetitle
		"localstove:3000 | #{content_for(:title)}".html_safe 
	end
end
