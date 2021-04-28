# frozen_string_literal: true

class Event < ApplicationRecord
  validates :date, presence: true
  validates :description, presence: true
  validates :photo, presence: true
  validates :subtitle, presence: true
  validates :title, presence: true
end
