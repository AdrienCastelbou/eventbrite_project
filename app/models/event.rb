class Event < ApplicationRecord
  belongs_to :admin, class_name: "User"
  has_many :participations
  has_many :users, through: :participations

  validates :start_date,
    presence: true, if: :start_date_is_ok?
  validates :duration,
    presence: true, if: :duration_is_ok?
    
  validates :price,
    presence: true
  validates_numericality_of :price,
   :greater_than => 1.0,
   :less_than => 1000.0
  validates :description,
   presence: true
  validates_length_of :description,
   minimum: 20,
   maximum: 1000
   validates :title,
   presence: true
  validates_length_of :title,
   minimum: 5,
   maximum: 140
  validates :location,
   presence: true

  def start_date_is_ok?
    errors.add(:start_date, "must be in the future") unless (self.start_date > Time.now)
   end

   def duration_is_ok?
    errors.add(:duration, "must be 5 multiple") unless (self.duration % 5 == 0)
  end

end
