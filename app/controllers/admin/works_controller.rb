class Admin::WorksController < AdminController

	def index
		@works = Work.search(params[:search]).paginate(:page => params[:page], :per_page => 10)
	end

	def new
		@work = Work.new
	end

	def create
		@work = Work.new(work_params)

		if @work.save
			redirect_to admin_works_path, notice: '작업을 성공적으로 생성하였습니다.'
		else
			render action: 'new'
		end
	end

	def edit
		@work = Work.find(params[:id])
	end

	def update
		@work = Work.find(params[:id])
		if @work.update(work_params)
			redirect_to admin_works_path, notice: '작업을 성공적으로 수정하였습니다.'
		else
			render action: 'edit'
		end
	end

	def destroy
		Work.find(params[:id]).destroy
		redirect_to admin_works_path, notice: '작업을 성공적으로 삭제하였습니다.'
	end

	private

	def work_params
		params.require(:work).permit(:title, :client, :body, :category_id)
	end
end
