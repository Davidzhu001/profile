class User < ActiveRecord::Base
  has_many :articles
  has_many :skills, :dependent => :destroy
   accepts_nested_attributes_for :skills, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
	devise  :database_authenticatable, 
			:registerable,
			:recoverable, 
			:rememberable, 
			:trackable, 
			:validatable

end
