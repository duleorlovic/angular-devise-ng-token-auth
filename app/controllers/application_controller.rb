class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception
  protect_from_forgery with: :exception

  after_filter :set_csrf_cookie_for_ng

  def set_csrf_cookie_for_ng
    cookies['XSRF-TOKEN'] = form_authenticity_token if protect_against_forgery?
  end

  rescue_from ActionController::InvalidAuthenticityToken do |exception|
    set_csrf_cookie_for_ng
    render text: 'Invalid authenticity token', status: :unprocessable_entity
  end

protected

  def verified_request?
    super || valid_authenticity_token?(session, cookies['XSRF-TOKEN'])
  end
end
