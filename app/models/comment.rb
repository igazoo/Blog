class Comment < ApplicationRecord
   validates :title ,presence: true,
                    length: { maximum: 10}
                    
   validates :content,presence: true,
                      length: { maximum: 200 }
              
  
  belongs_to :user
end
