module ApplicationHelper
	def pagetitle
		"Blog &hearts; #{content_for(:title)}".html_safe 
	end
end
