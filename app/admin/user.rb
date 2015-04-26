ActiveAdmin.register User do
  permit_params :name, :dob, :f_name, :gender, :email, :address, :city, :state, :country, :pin_code, :is_ncc_member,
  :phone, :is_matrimony, :avatar, :gotra, :marital_status, :qualification, :designation, :company_name, :income

  index do
    selectable_column
    column :name
    column :email
    column "Date of Birth" do |b|
      b.dob.try(:strftime, "%d %B %Y")
    end
    column "Father Name" do |b|
      b.f_name
    end
    column :gender
    column :gotra
    column :address
    column :city
    column :state
    column :phone
    column :pin_code
    column :marital_status
    column :qualification
    column :designation
    column :company_name
    column :income
    column :sign_in_count
    column :created_at
    actions
  end

  filter :email
  filter :name
  filter :f_name
  filter :gender
  filter :is_ncc_member
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
      f.input :email
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
      f.input :is_ncc_member
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
        row :is_matrimony
        row :qualification
        row :designation
        row :company_name
        row :income

      end
    end
  end
end