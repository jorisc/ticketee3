module ApplicationHelper
	def title(*parts)
		unless parts.empty?
			content_for :title do
				(parts << "Ticketee3").join(" - ")
			end
		end
	end
end
