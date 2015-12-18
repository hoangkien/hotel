class NewsController < InheritedResources::Base

  private

    def new_params
      params.require(:new).permit(:title, :content, :admin_user_id, :category_id)
    end
end

