# frozen_string_literal: true

class ApplicationReflex < StimulusReflex::Reflex
  delegate :current_account, to: :connection
end
