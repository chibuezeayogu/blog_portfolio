# frozen_string_literal: true
class Portfolio < ApplicationRecord
  include Placeholder
  validates :title, :body, :main_image, :thumb_image, presence: true

  after_initialize :set_defaults

  def set_defaults
    self.main_image ||= Placeholder.image_generator(height: '600', width: '400')
    self.thumb_image ||= Placeholder.image_generator(height: '350', width: '200')
  end
end
