class Calorie < ApplicationRecord
  belongs_to :user, touch: true
  #default_scope -> { order(date: :desc) }
  validates :user_id, presence: true
  validates :number, presence: true
  validates :type_gained, inclusion: { in: [true, false] }
  validates :date, presence: true
  validates :activity, presence: true
  validates :activity, length: { maximum: 140 }
  #validate :date_cannot_be_earlier_than_twenty_four_hours
  #validate :date_cannot_be_latter_than_twelve_hours
  after_create :log_count
  after_destroy :log_minus_count


  def self.number_grouped_by_day(start)
    calories = where(date: start.beginning_of_day..Time.zone.now)
    calories = calories.select("date(calories.date) as cal_date, sum(calories.number) as total_calories").group("cal_date")
    calories.group_by { |o| o.cal_date.to_date }
  end

  private

    def date_cannot_be_earlier_than_twenty_four_hours
      if date.present? and date < 24.hours.ago
        errors.add(:date, "can't be earlier than 24 hours")
      end
    end

    def date_cannot_be_latter_than_twelve_hours
      if date.present? and date > Time.now.advance(hours: 12)
        errors.add(:date, "can't be latter than 12 hours")
      end
    end

#Cuando se cree una caloria:
  # Ir a la columna del usuario de conteo.
  # Hacer conteo de las calorias del usuario
  # Asignar este valor a la columna de conteo del usuario.

    def log_count
      user.update_column(:number_of_registers, user.number_of_registers + 1)
    end

    def log_minus_count
      user.update_column(:number_of_registers, user.number_of_registers - 1)
    end

end