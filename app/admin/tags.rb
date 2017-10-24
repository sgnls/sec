ActiveAdmin.register ActsAsTaggableOn::Tag, as: "tag" do
  menu priority: 6

  permit_params :name

  filter :name

  index do
    selectable_column
    column :name
    column "Taggings", :taggings_count
    actions
  end
end
