class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  validates :name, presence: true
  def first_name
    return '' if name.nil?

    name.split.first
  end

  def last_name
    return '' if name.nil?

    name.split.last
  end
end
