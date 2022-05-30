# frozen_string_literal: true

class PostComponent < ViewComponent::Base
  with_collection_parameter :post

  def initialize(post:, current_user:)
    super
    @post = post
    @current_user = current_user
  end

  def vote_zone
    return '' if @current_user.blank?

    vote = @post.votes_for.detect { |vote| vote.voter == @current_user }
    "
      <span
        data-action='click->post#votedUp'
        data-post-target='thumbUp'>
        <i class='bi bi-hand-thumbs-up#{vote&.vote_flag ? '-fill' : ''}'></i>
      </span>
      <span
        data-action='click->post#votedDown'
        data-post-target='thumbDown'>
        <i class='bi bi-hand-thumbs-down#{vote&.vote_flag == false ? '-fill' : ''}'></i>
      </span>
    "
  end
end
