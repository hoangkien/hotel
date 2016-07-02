ActiveAdmin.register News do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :title, :content, :admin_user_id, :category_id
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end
form do |f|
  f.inputs "News Detail"do
    f.input :category_id, 
            :label => 'Category', :as => :select, 
            :collection => Category.all.map{ |cate| [cate.name, cate.id]}, 
            include_blank: false, allow_blank: false,
            input_html: { class: 'form-control'}

    f.input :title
    f.input :content, :as => :ckeditor
  end
  f.actions
end

controller do
  # This code is evaluated within the controller class

  def create
    news = current_admin_user.news.create(permitted_params[:news])
    if news.save 
      redirect_to admin_news_index_path
    else
      render :new
    end
    # Instance method
  end
end

end
