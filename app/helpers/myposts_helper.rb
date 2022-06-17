# frozen_string_literal: true

module MypostsHelper
  def self.active_tab(render, tab)
    'tab-select' if render == tab
  end
end
