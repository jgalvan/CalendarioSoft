class UsuariosController < ApplicationController
    def login
        reset_session
    end

    def iniciar_sesion
        @usuario = Usuario.where(email: params[:usuario][:email], contrasena: params[:usuario][:contrasena]).first
        if @usuario
            session[:id_usuario_actual] = @usuario.id
            redirect_to eventos_path
        else
            @usuario = Usuario.new(email: params[:usuario][:email])
            @usuario.errors[:base] << "Correo o contraseña no válidos"
            render 'login'
        end
    end

    def logout
        reset_session
    end

    def new
        @usuario = Usuario.new
    end

    def create
        @usuario = Usuario.new(usuario_params)
        @usuario.type = "Participante"
        if @usuario.save
            session[:id_usuario_actual] = @usuario.id
            redirect_to eventos_path
        else
            render new_usuario_path
        end
    end

    private
        def usuario_params
            params.require(:usuario).permit(:email, :nombre, :apellidos, :contrasena)
        end
end
