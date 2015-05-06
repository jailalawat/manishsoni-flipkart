class Card < ActiveRecord::Base
	belongs_to :product ,class_name:"Admin::Product"
 belongs_to :user, class_name: "User",
                          foreign_key: "customer_id"
end
