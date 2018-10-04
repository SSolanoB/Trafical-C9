class User < ApplicationRecord
  has_many :calories, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  after_commit :log_count

  private

    def log_count
      update_column(:number_of_registers, calories.count)
    end

end
