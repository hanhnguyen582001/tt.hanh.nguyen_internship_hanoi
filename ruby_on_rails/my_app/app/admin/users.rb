ActiveAdmin.register User do
  permit_params :name, :email, :password, :password_confirmation, :admin,
                microposts_attributes: %i[content _destroy]

  menu label: proc { I18n.t 'active_admin.user' }
  menu priority: 1

  filter :email
  filter :name, label: I18n.t('active_admin.user_page.label.name')
  filter :admin, label: I18n.t('active_admin.user_page.label.role'), as: :select,
                 collection: [[I18n.t('active_admin.admin_user'), 1], [I18n.t('active_admin.user'), 0]]
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
      link_to I18n.t('active_admin.action.microposts'), admin_microposts_path(q: { user_id_eq: user.id }),
              class: 'view_link member_link c-button c-button--info u-xsmall'
    end
    span 'hello'
  end
  index as: :blog do
    title :email
    body  :name
  end

  batch_action :active do |ids|
    batch_action_collection.find(ids).each do |_user|
      post.activated!
    end
    redirect_to collection_path, alert: 'The users have been activated.'
  end

  batch_action :active, form: {
    type: %w[Offensive Spam Other],
    reason: :text,
    notes: :textarea,
    hide: :checkbox,
    date: :datepicker
  } do |ids, inputs|
    # inputs is a hash of all the form fields you requested
    redirect_to collection_path, notice: [ids, inputs].to_s
  end

  batch_action :doit, form: -> { { user: User.pluck(:name, :id) } } do |_ids, inputs|
    User.find(inputs[:user])
    # ...
  end

  show title: :name do
    attributes_table do
      row :name
      row :email
      row :activated
    end
    panel 'User microposts' do
      paginated_collection(user.microposts.page(params[:page]).per(15)) do
        table_for collection do
          column('microposts', sortable: :id) do |micropost|
            link_to micropost.id.to_s, admin_micropost_path(micropost)
          end
          column('content') { |micropost| micropost.content }
          column('Create date', sortable: :created_at) do |micropost|
            pretty_format(micropost.created_at)
          end
          column('action') do |micropost|
            span link_to 'Xem', admin_micropost_path(micropost),
                         method: :get, class: 'view_link member_link c-button c-button--info u-small'
            span link_to 'Chỉnh sửa', admin_micropost_path(micropost),
                         method: :put, class: 'view_link member_link c-button c-button--info u-small'
            span link_to 'Xóa', admin_micropost_path(micropost),
                         method: :delete, class: 'view_link member_link c-button c-button--error u-small'
          end
        end
      end
    end
  end
  # form do |f|
  #   f.semantic_errors
  #   f.inputs do
  #     f.input :email
  #     f.input :password
  #     f.input :password_confirmation
  #     f.input :admin, as: :check_boxes, collection: [[I18n.t('active_admin.admin_user'), 1]], label: false
  #   end
  #   f.actions
  # end
  form partial: 'form'
  controller do
    def create
      create! do |success, _failure|
        success.html do
          redirect_to admin_users_path alert: 'User has created'
        end
      end
    end

    def permitted_params
      params.permit(user: %i[email name password password_confirmation])
    end
  end
end
