class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  unless RUBY_ENGINE=='opal'
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  end
end
