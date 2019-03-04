module EventsHelper
  def has_this_event_subscription?
    (current_user.subscriptions.ids & @event.subscriptions.ids).any?
  end
end
