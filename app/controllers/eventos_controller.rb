class EventosController < ApplicationController
    def index
        @eventos = Evento.all
    end
    def login
    	@eventos = Evento.all
    end
    def register
    	@eventos = Evento.all
    end
end
