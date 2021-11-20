class ReservationsController < ApplicationController
    
    def index
        @movie_shows = MovieShow.all
    end

    def new_reservation
        @movie_show = MovieShow.find(params[:movie_show_id])
    end

    def create_reservation
        seats = params[:seats]
        unless seats
            return redirect_to reservations_path, alert: "Reserva no realizada, ninguna silla fue seleccionada"
        end
        if params[:user_name].empty?
            return redirect_to reservations_path, alert: "Reserva no realizada, se necesita un usuario para reservar."
        end
        user = User.create(name: params[:user_name], rut: params[:user_rut])
        if user.save
            seats.each do |seat|
                seat = Seat.find(seat)
                seat.user_id = user.id
                unless seat.save
                    return redirect_to movie_shows_path, alert: "Reserva no realizada, ha ocurrido un error creando la reserva"    
                end
            end
        else
            return redirect_to movie_shows_path, alert: "Reserva no realizada, ha ocurrido un error creando la reserva"
        end  
        return redirect_to reservations_path, notice: "Reserva creada exitosamente!"
    end

    def show
    end
end
