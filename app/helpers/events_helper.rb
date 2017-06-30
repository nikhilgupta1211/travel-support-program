#
# Helpers for events
#
module EventsHelper
  # Outputs a one-line summary of the event information
  #
  # @param [Event] event the event to be displayed
  # @return [String] HTML output
  def event_title_line(event)
    t(:event_title_line, name: event.name, start: l(event.start_date),
                         end: l(event.end_date), country: event.country_code)
  end

  def users_for_event(state)
    req = @event.requests
    req = req.where(state: state) if state != 'all'
    user_email = req.map { |e| e.user.email }.uniq
  end
end
