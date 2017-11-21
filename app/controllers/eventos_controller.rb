class EventosController < ApplicationController
    def index
        @eventos = Evento.all
    end

    def show
        usuario_actual = Usuario.find_by_id(session[:id_usuario_actual])
        if usuario_actual.type == "Administrador"
            redirect_to edit_evento_path(params[:id])
        else
            @evento = Evento.find_by_id(params[:id])
        end
    end

    def edit
        @evento = Evento.find_by_id(params[:id])
    end

    def update
        @evento = Evento.find_by_id(params[:id])
        if @evento.update_attributes(evento_params)
            redirect_to eventos_path
        else 
            edit_evento_path(params[:id])    
        end
    end
    
    private
        def evento_params
            params.require(:evento).permit(:nombre, :lugar, :maxParticipantes, :fechaInicio, :fechaFin, :descripcion)
        end
end
