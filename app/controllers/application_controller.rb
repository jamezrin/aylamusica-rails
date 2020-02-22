class ApplicationController < ActionController::Base
  around_action :switch_locale
  before_action :hook_urls
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
    # redirect_to root_path unless logged_in?
  end
end
