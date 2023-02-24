class TutorsController < ApplicationController
  def index
    @tutors = Tutor.all
    render json: @tutors
  end

  def create
    @tutor = Tutor.new(tutor_params)
    if @tutor.valid?
      @tutor.save
      render json: { message: 'Tutor has been created successfully!' }, status: :created
    else 
      render json: { message: 'Tutor couldn\'t be created.'}, status: :not_acceptable
    end
  end

  def destroy
    id = params[:id]
    @tutor = Tutor.find(id)

    if @tutor 
      @tutor.destroy
      render json: { message: 'Tutor has been destroyed successfully!' }, status: :Ok
    else 
      render json: { message: 'Something went wrong.'}, status: :not_found
  end

  private

  def tutor_params
    params.require(:tutor).permit(:last_name, :first_name, :description, :fb_link, :ig_link, :twitter_link, :photo_url,
                                  :hourly_fee, :experience, :rating)
  end
end
