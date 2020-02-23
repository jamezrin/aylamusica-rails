class ApplicationController < ActionController::Base
  around_action :switch_locale
  before_action :hook_urls
  before_action :auth_expire
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
    session[:current_request_url] = request.url
  end

  def logged_in?
    session[:auth_timestamp].present?
  end

  def auth_required
    render :file => "public/422.html", :status => :unauthorized, :layout => false unless logged_in?
  end

  def auth_expire
    return unless logged_in?

    if session[:auth_last_action_time].present? &&
        session[:auth_last_action_time].to_time + ALM_CONFIG['segundos_inaccion'].seconds < Time.current
      reset_session
      flash[:alert] = t('sesion_expirada')
      redirect_to admin_path
    else
      session[:auth_last_action_time] = Time.current
    end
  end
end
