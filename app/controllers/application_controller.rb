class ApplicationController < ActionController::Base
  include Pundit::Authorization

  rescue_from Pundit::NotAuthorizedError do
    redirect_to customers_path, alert: 'Você não está autorizado a executar essa ação.'
  end
end
