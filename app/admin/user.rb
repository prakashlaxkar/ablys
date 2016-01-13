ActiveAdmin.register User do
  permit_params :name, :dob, :f_name, :gender, :email, :address, :city, :state, :country, :pin_code, :is_ncc_member,
  :phone, :is_matrimony, :avatar, :gotra, :marital_status, :qualification, :designation, :company_name, :income,
  :membership, :is_active, :username, :password, :serial_number, :is_ablys_member

  index do
    selectable_column
    column :name
    column :email
    column "Father Name" do |b|
      b.f_name
    end
    column :gotra
    column :membership
    column :city
    column :state
    column :phone
    column :marital_status
    column :qualification
    column :sign_in_count
    column :created_at
    actions
  end

  filter :email
  filter :name
  filter :f_name
  filter :gender
  filter :is_ncc_member
  filter :is_ablys_member
  filter :membership
  filter :marital_status
  filter :city
  filter :state
  filter :pin_code
  filter :gotra
  filter :qualification
  filter :designation

  form do |f|
    f.inputs "User Details" do
      f.input :name
      f.input :username
      f.input :email
      f.input :password
      f.input :dob, label: "Date Of Birth"
      f.input :f_name, label: "Father Name"
      f.input :gender
      f.input :avatar
      f.input :gotra, as: :select, collection: Gotra.pluck(:name).sort, include_blank: "Select Gotra"
      f.input :address
      f.input :state, as: :select, collection: $state.sort, include_blank: "Select State", input_html: {class: "state_class"}
      f.input :city, as: :select, collection: City.pluck(:name).sort, include_blank: "Select City", input_html: {class: "user_city"}
      f.input :phone
      f.input :pin_code
      f.input :marital_status, as: :select, collection: ["Single", "Married", "Divorced", "Widow"]
      f.input :is_matrimony
      f.input :serial_number
      f.input :is_ncc_member
      f.input :is_ablys_member
      f.input :membership, as: :select, collection: ["Lifetime", "Yearly"], include_blank: "Select Membership"
      f.input :is_active
      f.input :qualification
      f.input :designation
      f.input :company_name
      f.input :income
    end
    f.actions
  end

  show do
    panel "Table of Contents" do
      attributes_table_for user do
        row :name
        row :email
        row "Date of Birth" do |b|
          b.dob
        end
        row "Father Name" do |b|
          b.f_name
        end
        row :gender
        row :avatar
        row :gotra
        row :address
        row :city
        row :state
        row :phone
        row :pin_code
        row :marital_status
        row :is_ncc_member
        row :serial_number
        row :is_ablys_member
        row :membership
        row :is_matrimony
        row :qualification
        row :designation
        row :company_name
        row :income

      end
    end
  end

  controller do
    def update
      if params[:user][:password].blank?
        params[:user].delete("password")
      end
      super
    end
  end
end
