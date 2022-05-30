class HomeController < ApplicationController
  def index
    @posts = Post.preload(:votes_for, :user).page(params[:page]).per(10)

    respond_to do |format|
      format.html
      format.json do
        render json: {
          entries: PostComponent.with_collection(@posts, current_user: current_user).render_in(view_context),
          pagination: view_context.paginate(@posts, params: { format: :json })
        }
      end
    end
  end
end
