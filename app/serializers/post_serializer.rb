class PostSerializer
  include JSONAPI::Serializer
  set_key_transform :camel_lower
  attributes :title, :description, :cached_votes_up, :cached_votes_down

  attribute :user do |object|
    object.user.email
  end
end
