class Work < ActiveRecord::Base
	belongs_to :category

	def self.search(search)
	  if search && !search.blank?
	    where("title LIKE ?", '%' + search + '%' )
	  else
	    all
	  end
	end
end
