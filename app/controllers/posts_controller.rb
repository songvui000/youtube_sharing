class PostsController < PrivateController
  before_action :set_post, except: [:index, :new]

  def index; end

  def new; end

  def create
    data = VideoInfo.new(params[:youtube_url]).formatted_data
    post = Post.new(
      user: current_user,
      title: data[:title],
      video_id: data[:id],
      video_type: 'Youtube',
      description: data[:description]
    )
    post.save!

    redirect_to root_path
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
