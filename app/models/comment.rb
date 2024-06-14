class Comment < ApplicationRecord
  belongs_to :article
  validates :commenter_name, presence: true
  validates :body, presence: true
end