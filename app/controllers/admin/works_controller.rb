class Admin::WorksController < AdminController
	before_action :authenticate_admin!
end
