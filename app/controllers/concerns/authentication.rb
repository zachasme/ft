module Authentication
  extend ActiveSupport::Concern
  included do
    before_action :restore_authentication

    helper_method :signed_in?
  end

  class_methods do
    def require_authentication(**options)
      skip_before_action :restore_authentication, **options
      before_action :require_authentication, **options
    end
  end

  private
    def signed_in?
      Current.user.present?
    end

    def require_authentication
      restore_authentication || request_authentication
    end

    def restore_authentication
      if user = User.find_by(id: cookies.signed.permanent[:user_id])
        resume_session user
      end
    end

    def request_authentication
      session[:return_to_after_authenticating] = request.url
      redirect_to new_user_url
    end

    def redirect_signed_in_user_to_root
      redirect_to root_url if signed_in?
    end

    def start_new_session_for(user)
      authenticated_as user
    end

    def resume_session(user)
      authenticated_as user
    end

    def authenticated_as(user)
      Current.user = user
      cookies.signed.permanent[:user_id] = user.id
    end

    def redirect_after_authentication(**options)
      url = session.delete(:return_to_after_authenticating) || root_url
      redirect_to url, **options
    end

    def reset_authentication
      cookies.delete(:user_id)
    end
end
