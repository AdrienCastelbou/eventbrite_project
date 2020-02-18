class Participation < ApplicationRecord
  after_create :confirm_inscription
  belongs_to :user
  belongs_to :event

  def confirm_inscription
    UserMailer.confirmation_participation(self).deliver_now
  end
end
