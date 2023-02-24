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

    def reservation_params
        params.require(:reservation).permit(:id, :user_id, :tutor_id, :city, :date, :hour)
    end
end
