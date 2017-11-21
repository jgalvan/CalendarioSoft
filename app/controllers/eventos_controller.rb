class EventosController < ApplicationController
    def index
        @eventos = Evento.all
    end
end
