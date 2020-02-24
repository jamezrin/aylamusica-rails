class ApplicationController < ActionController::Base
  around_action :switch_locale
  before_action :hook_urls
  before_action :auth_action_update
  before_action :force_maintenance
  helper_method :logged_in?

  def switch_locale(&action)
    locale = params[:locale] || I18n.default_locale
    I18n.with_locale(locale, &action)
  end

  def default_url_options(options={})
    options.merge({ locale: I18n.locale })
  end

  def hook_urls
    session[:previous_request_url] = session[:current_request_url]
    session[:current_request_url] = request.original_url.split('?')[0]
  end

  def logged_in?
    session[:auth_timestamp].present?
  end

  def auth_expire
    if auth_session_expired?
      reset_session
      flash[:alert] = t('sesion_expirada')
      redirect_to admin_url
    end
  end

  def auth_required
    render :file => "public/422.html", :status => :unauthorized, :layout => false unless logged_in?

    auth_expire
  end

  def auth_session_expired?
    last_action = session[:auth_last_action_time]
    timeout_seconds = ALM_CONFIG['segundos_inaccion'].seconds
    last_action.present? &&
        last_action.to_time + timeout_seconds < Time.current
  end

  def auth_action_update
    if logged_in? && !auth_session_expired?
      session[:auth_last_action_time] = Time.current
    end
  end

  def force_maintenance
    session[:auth_last_action_time] = Time.current # para que las sesiones no expiren
    render :file => "public/503.html", :status => :service_unavailable, :layout => false if ALM_CONFIG["mantenimiento"]
  end
end
