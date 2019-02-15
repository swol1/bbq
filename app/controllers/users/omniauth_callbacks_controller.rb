class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def self.omniauth_callback(provider)
    class_eval %Q{
      def #{provider}
        @user = User.find_for_oauth(request.env['omniauth.auth'])

        if @user.persisted?
          flash[:notice] = I18n.t('devise.omniauth_callbacks.success', kind: "#{provider}".capitalize)
          sign_in_and_redirect @user, event: :authentication
        else
          flash[:error] = I18n.t(
            'devise.omniauth_callbacks.failure',
            kind: "#{provider}".capitalize,
            reason: 'authentication error'
          )

          redirect_to root_path
        end
      end
    }
  end

  %i[facebook vkontakte].each do |provider|
    omniauth_callback(provider)
  end
end
