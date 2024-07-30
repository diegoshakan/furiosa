class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [ :first_name, :last_name, :nickname, :cellphone, :cpf_cnpj, address_attributes: [:cep, :rua, :numero, :complemento, :ponto_de_referencia, :uf, :cidade]])
  end
end
