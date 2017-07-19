class Project < ApplicationRecord
  validates :name,  :presence => true
  validates :title, :presence => true,
                    :length => { :minimum => 5 }
  belongs_to :user

end
