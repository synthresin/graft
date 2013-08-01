class Admin::CategoriesController < AdminController
	def index
    @categories = Category.all
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to admin_categories_path, notice: '카테고리를 성공적으로 추가하였습니다.'
    else
      @categories = Category.all
      render action: 'index'
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      redirect_to admin_categories_path, notice: '카테고리를 성공적으로 수정하였습니다.'
    else
      render action: 'edit'
    end
  end

  def destroy
    Category.find(params[:id]).destroy
    redirect_to admin_categories_path, notice: '카테고리를 성공적으로 삭제하였습니다.'
  end

  private

  def category_params
    params.require(:category).permit(:title)
  end
end
