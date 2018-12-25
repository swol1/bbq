class SubscriptionsController < ApplicationController
  before_action :set_event, only: [:create, :destroy]

  before_action :set_subscription, only: [:destroy]

  def create
    @new_subscription = @event.subscriptions.build(subscription_params)
    @new_subscription.user = current_user

    unless user_signed_in? && current_user.id == @event.user_id
      if @new_subscription.save
        redirect_to @event, notice: I18n.t('controllers.subscriptions.created')
      else
        render 'events/show', alert: I18n.t('controllers.subscriptions.error')
      end
    end
  end

  def destroy
    message = { notice: I18n.t('controllers.subscriptions.destroyed') }

    if current_user_can_edit?(@subscription)
      @subscription.destroy
    else
      message = { alert: I18n.t('controllers.subscriptions.error') }
    end

    redirect_to @event, message
  end

  private

  def set_subscription
    @subscription = @event.subscriptions.find(params[:id])
  end

  def set_event
    @event = Event.find(params[:event_id])
  end

  def subscription_params
    params.fetch(:subscription, {}).permit(:user_email, :user_name)
  end
end