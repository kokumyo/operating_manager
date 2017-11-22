module ProjectsHelper

	def button_disabled
		@project_id.blank?
	end

	def button_up_disabled
		return true if @project_id.blank?
		if @projects.length > 0 && @projects[0].id == @project_id.to_i
			true
		else
			false
		end
	end

	def button_down_disabled
		return true if @project_id.blank?
		if @projects.length > 0 && @projects[@projects.length-1].id == @project_id.to_i
			true
		else
			false
		end
	end

	def is_project_checked id
		if @project_id.present? && @project_id.to_i == id
			true
		else
			false
		end
	end
end
