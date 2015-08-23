class SkillsController < ApplicationController

	def create
		@skill = current_user.skills.new(skill_params)
	      if @skill.save
	        redirect_to root_path
	      else
	        redirect_to root_path
	      end
	    end
    end

    private 
    def skill_params
      params.require(:skill).permit(:content, :user_id)
    end
end
