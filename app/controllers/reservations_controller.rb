class ReservationsController < ApplicationController
  def destroy
    @reservation = Reservation.find_by(id: params[:id])
    if @reservation
      @reservation.destroy
      render json: { message: 'Reservation has been successfully deleted!' },
             status: :ok
    else
      render json: { message: 'Something went wrong' }, status: :not_found
    end
  end

  def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.valid?
      @reservation.save
      render json: { message: 'Reservation has been created successfully!', reservation_obj: @reservation}, status: :created
    else
      render json: { message: 'Reservation couldn\'t be created.' }, status: :not_acceptable
    end
  end

  def reservation_params
    params.require(:reservation).permit(:user_id, :tutor_id, :city, :date, :hour)
  end
end
