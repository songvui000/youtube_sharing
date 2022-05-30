class PostsController < PrivateController
  before_action :set_post, except: [:index, :new, :create]
  def new; end
  def create
    data = VideoInfo.new(params[:youtube_url]).formatted_data
    post = Post.new(
      user: current_user,
      title: data[:title],
      video_id: data[:id],
      video_type: data['provider'],
      description: data[:description]
    )
    post.save!
    redirect_to root_path
  rescue VideoInfo::UrlError => e
    render_4xx(400, 'error', { errors: e.message })
  end

  def vote_up
    @post.vote_by voter: current_user, vote: 'like'
    render_2xx(200, 'success', PostSerializer.new(@post))
  end

  def vote_down
    @post.vote_by voter: current_user, vote: 'dislike'
    render_2xx(200, 'success', PostSerializer.new(@post))
  end

  private

  def set_post
    @post = Post.find_by(params[:id])
  end
end
