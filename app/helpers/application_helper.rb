module ApplicationHelper
	def pagetitle
		content_for?(:title) ? "lowcalhost:3000 | #{content_for(:title)}".html_safe : "lowcalhost:3000"
	end
end
