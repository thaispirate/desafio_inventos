class Project < ApplicationRecord
  validates :name,  :presence => true
  validates :title, :presence => true,
                    :length => { :minimum => 5 }
  belongs_to :user
  has_many :bugs  , :dependent => :destroy
end
