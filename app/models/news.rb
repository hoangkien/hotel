class News < ActiveRecord::Base
  belongs_to :admin_user
  belongs_to :category
end
