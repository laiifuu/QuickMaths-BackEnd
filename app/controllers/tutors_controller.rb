class TutorsController < ApplicationController
  def index 
    @tutors = Tutor.all
    render json: @tutors
  end

  
end
