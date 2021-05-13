require 'bcrypt'

class User < ApplicationRecord
  belongs_to :city, optional: true
  has_many :gossips, dependent: :destroy
  has_many :sent_messages, foreign_key: 'sender_id', class_name: "PrivateMessage"
  has_many :received_messages, foreign_key: 'recipient_id', class_name: "PrivateMessage"
  has_many :likes, dependent: :destroy
  has_secure_password
  
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :description, presence: true, length: { minimum: 3 }
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :age, :numericality => { :greater_than_or_equal_to => 0 }
  validates :password, presence: true, length: { minimum: 6 }
end