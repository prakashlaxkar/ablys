ActiveAdmin.register City do
	permit_params :name, :state

	form do |f|
		f.inputs "Add New City" do
			f.input :state, as: :select, collection: $state.sort, include_blank: "Select State"
			f.input :name
		end
		f.actions
	end
end
