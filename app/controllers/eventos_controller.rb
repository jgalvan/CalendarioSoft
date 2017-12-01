class EventosController < ApplicationController
  before_action :autenticar_usuario
  before_action :autorizar_administrador, except: [:index, :show, :inscribir]

  def index
    @eventos = Evento.all
  end

  def show
    @evento = Evento.find_by_id(params[:id])
  end

  def new
    @evento = Evento.new
    @evento.administrador = @usuario_actual
  end

  def create
    @evento = Evento.new(evento_params)
    @evento.administrador = @usuario_actual
    if @evento.save
      redirect_to eventos_path
    else
      render 'new'
    end
  end

  def edit
    @evento = Evento.find_by_id(params[:id])
  end

  def update
    @evento = Evento.find_by_id(params[:id])
    if @evento.update_attributes(evento_params)
      redirect_to evento_path(@evento)
    else
      render 'edit'
    end
  end

  def destroy
    evento = Evento.find_by_id(params[:id])
    evento.destroy
    redirect_to eventos_path
  end

  def inscribir
    evento = Evento.find_by_id(params[:id])
    if @usuario_actual.type == 'Participante' && evento && evento.lugares_disponibles > 0
      evento.participantes << @usuario_actual
    end
    redirect_to evento_path(evento)
  end

  private
    def evento_params
      params.require(:evento).permit(:nombre, :lugar, :maxParticipantes, :fechaInicio, :fechaFin, :descripcion)
    end

    def autenticar_usuario
      @usuario_actual = Usuario.find_by_id(session[:id_usuario_actual])
      redirect_to login_path unless @usuario_actual
    end

    def autorizar_administrador
      redirect_to eventos_path unless @usuario_actual.type == "Administrador"
    end
end
