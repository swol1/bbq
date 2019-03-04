class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    @user = User.find_for_facebook_oauth(request.env['omniauth.auth'])

    if @user.persisted?
      flash[:notice] = I18n.t('devise.omniauth_callbacks.success', kind: "Facebook")
      sign_in_and_redirect @user, event: :authentication
    else
      flash[:error] = I18n.t(
        'devise.omniauth_callbacks.failure',
        kind: "Facebook",
        reason: 'authentication error'
      )

      redirect_to root_path
    end
  end

  def vkontakte
    #если email.nil? записываем нужные данные в session
    if request.env['omniauth.auth'].info.email.nil?
      auth = request.env['omniauth.auth']

      session[:provider] = auth.provider
      session[:url] = auth.info.urls['Vkontakte']
      session[:password] = Devise.friendly_token.first(16)

      #проверяем есть ли юзер с такими данными урл и провайдера, но который не отдает email
      # при заходе через вк
      @user = User.where(url: session[:url], provider: session[:provider]).first
      user_check unless @user.nil?

      #рендерится шаблон users/omniauth_callbacks/new.html.erb если юзера нет
      render :new if @user.nil?
    else
      @user = User.find_for_vkontakte_oauth(request.env['omniauth.auth'])

      user_check
    end
  end

  #из шаблона приходит POST запрос с параметрами session
  def new
    @user = User.create(email: params[:session][:email], url: session[:url],
                        password: session[:password], provider: session[:provider])

    user_check
  end

  private

  def user_check
    if @user.persisted?
      flash[:notice] = I18n.t('devise.omniauth_callbacks.success', kind: "Vkontakte")
      sign_in_and_redirect @user, event: :authentication
    else
      flash[:error] = I18n.t(
        'devise.omniauth_callbacks.failure',
        kind: "Vkontakte",
        reason: 'authentication error'
      )

      redirect_to root_path
    end
  end
end
