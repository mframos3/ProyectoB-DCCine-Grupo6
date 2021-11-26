class ReservationsController < ApplicationController
    
    def new_reservation
        @movie_show = MovieShow.find(params[:movie_show_id])
    end

    def create_reservation
        seats = params[:seats]
        unless seats
            return redirect_back fallback_location: root_path, alert: "Reserva no realizada, ninguna silla fue seleccionada"
        end
        if params[:user_name].empty?
            return redirect_back fallback_location: root_path, alert: "Reserva no realizada, se necesita un usuario para reservar."
        end
        user = User.create(name: params[:user_name])
        if user.save
            seats.each do |seat|
                seat = Seat.find(seat)
                if(seat.user_id != nil) 
                    return redirect_back fallback_location: root_path, alert: "Reserva no realizada, Uno a mas asientos ya están reservados."    
                end
                seat.user_id = user.id
                unless seat.save
                    return redirect_back fallback_location: root_path, alert: "Reserva no realizada, ha ocurrido un error creando la reserva"    
                end
            end
        else
            return redirect_back fallback_location: root_path, alert: "Reserva no realizada, ha ocurrido un error creando la reserva"
        end  
        return redirect_back fallback_location: root_path, notice: "Reserva creada exitosamente!"
    end

    def show
    end
end
