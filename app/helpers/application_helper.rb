module ApplicationHelper
	def select_tab_class(parm)
		case parm
			when "album"
			 if params[:controller] == "albums"
			 	"active"
			 end
			when "home"
				if params[:controller] == "home"
					"active"
				end			
		end
	end
end
