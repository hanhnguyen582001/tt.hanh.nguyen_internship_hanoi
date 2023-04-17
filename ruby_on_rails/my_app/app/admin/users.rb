ActiveAdmin.register User do

  permit_params :name, :email, :password, :password_confirmation, :admin

  menu label: proc { I18n.t 'active_admin.user' }
  menu priority: 1

  filter :email
  filter :name, label: I18n.t('active_admin.user_page.label.name')
  filter :admin, label: I18n.t('active_admin.user_page.label.role'), as: :select, collection: [[I18n.t('active_admin.admin_user'), 1], [I18n.t('active_admin.user'), 0]]
  filter :following, label: I18n.t('active_admin.user_page.label.following')
  filter :followers, label: I18n.t('active_admin.user_page.label.follower')
  filter :created_at

  index do
    selectable_column
    id_column
    column :email
    column :name
    column :created_at
    actions do |user|
      link_to I18n.t('active_admin.action.microposts'), admin_microposts_path(q: { user_id_eq: user.id }), class: "view_link member_link c-button c-button--info u-xsmall"
    end
  end

  show title: :name do
    attributes_table do
      row :name
      row :email
    end
    panel "User microposts" do
      table_for(user.microposts) do
        column("microposts", sortable: :id) do |micropost|
          link_to micropost.id.to_s, admin_micropost_path(micropost)
        end
        column("content") { |micropost| micropost.content }
        column("Create date", sortable: :created_at) do |micropost|
          pretty_format(micropost.created_at)
        end
      end
    end

    active_admin_comments
  end

  form do |f|
    f.semantic_errors
    f.inputs do
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :admin, as: :check_boxes, collection: [[I18n.t('active_admin.admin_user'), 1]], label: false
    end
    f.actions
  end
end
