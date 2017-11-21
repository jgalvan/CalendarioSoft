class UsuariosController < ApplicationController
    def login
    end

    def iniciar_sesion
        user = Usuario.where(email: params[:email], contrasena: params[:pass]).first
        if user
            session[:current_user_id] = user.id
        else
            render 'login'
        end
    end

    def logout
        reset_session
    end
end
