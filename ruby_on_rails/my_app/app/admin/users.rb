ActiveAdmin.register User do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :email, :password, :password_confirmation, :admin
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :email, :password_digest, :remember_digest, :admin, :activation_digest, :activated, :activated_at, :reset_digest, :reset_sent_at]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  menu label: proc { I18n.t 'active_admin.user' }
  form do |f|
    f.inputs do
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end
end
