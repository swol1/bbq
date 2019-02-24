module EventsHelper
  def has_this_event_subscription?
    current_user.subscriptions.ids.any? { |sub| @event.subscriptions.ids.include?(sub) }
  end
end
