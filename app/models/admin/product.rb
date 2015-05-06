class Admin::Product < ActiveRecord::Base
	has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/


	# validates :name,:prise,:discription, presence: true 
  # validates_uniqueness_of :name
  belongs_to :category
  has_many :cards
end
