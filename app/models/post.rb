class Post < ApplicationRecord
  acts_as_votable cacheable_strategy: :update_columns
  belongs_to :user
  enum video_type: ['Youtube']
end
