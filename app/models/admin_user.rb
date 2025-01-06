class AdminUser < ApplicationRecord
  extend Enumerize

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable
  
  enumerize :role, in: %i[superadmin admin manager employee], predicates: true, scope: true, default: :manager

  EMAIL_REGEX = /\A[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}\z/
  PHONE_REGEX = /\A\+?[1-9]\d{1,14}\z/ # E.164 format (e.g., +1234567890)
end
