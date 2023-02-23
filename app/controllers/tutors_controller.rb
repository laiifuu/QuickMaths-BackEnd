class TutorsController < ApplicationController
  def index
    @tutors = Tutor.all
    render json: @tutors
  end

  def create
    @tutor = Tutor.new(tutor_params)

    return unless @tutor.save

    render json: { random: 'cool', status: :created }
  end

  def destroy
    id = params[:id]
    @tutor = Tutor.find(id)

    return unless @tutor.destroy

    render json: { random: 'cool', status: :Ok }
  end

  private

  def tutor_params
    params.require(:tutor).permit(:last_name, :first_name, :description, :fb_link, :ig_link, :twitter_link, :photo_url,
                                  :hourly_fee, :experience, :rating)
  end
end
