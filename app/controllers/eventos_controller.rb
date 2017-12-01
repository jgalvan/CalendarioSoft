class EventosController < ApplicationController
    def index
        @eventos = Evento.all
    end

    def show
        @usuario_actual = Usuario.find_by_id(session[:id_usuario_actual])
        if @usuario_actual.type == "Administrador"
            redirect_to edit_evento_path(params[:id])
        else
            @evento = Evento.find_by_id(params[:id])
        end
    end

    def new
        usuario_actual = Administrador.find_by_id(session[:id_usuario_actual])
        if usuario_actual
            @evento = Evento.new
            @evento.administrador = usuario_actual
        else
            redirect_to eventos_path
        end
    end

    def create
        usuario_actual = Administrador.find_by_id(session[:id_usuario_actual])
        @evento = Evento.new(evento_params)
        @evento.administrador = usuario_actual

        if usuario_actual && @evento.save
            redirect_to eventos_path
        else
            redirect_to eventos_path
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

    def destroy
        usuario_actual = Administrador.find_by_id(session[:id_usuario_actual])
        evento = Evento.find_by_id(params[:id])
        if usuario_actual
            evento.destroy
        end
        redirect_to eventos_path
    end

    def inscribir
        evento = Evento.find_by_id(params[:id])
        usuario_actual = Participante.find_by_id(session[:id_usuario_actual])

        if usuario_actual && evento && evento.lugares_disponibles > 0
            evento.participantes << usuario_actual
        end
        redirect_to evento_path(evento)
    end
    
    private
        def evento_params
            params.require(:evento).permit(:nombre, :lugar, :maxParticipantes, :fechaInicio, :fechaFin, :descripcion)
        end
end
