ActiveAdmin.register User do
  permit_params  :title, :phone, :twitter_name, :facebook_url, :linked_in_url, :loopnet_logon, :loopnet_password, :mncar_logon,:mncar_password,:craigslist_logon,:craigslist_password,:email, :password, :password_confirmation, :avatar, :name, :roles

  index do
    column :email
    column :current_sign_in_at
    column :last_sign_in_at
    column :sign_in_count
    default_actions
  end

  filter :email

  form multipart: true do |f|
    f.semantic_errors :user
    f.inputs "Admin Details" do
      f.input :email
      f.input :name
      f.input :title
      f.input :password
      f.input :password_confirmation
      f.input :avatar
      f.input :loopnet_logon
      f.input :loopnet_password
      f.input :facebook_url, :label => "Facebook (full url)"
      f.input :linked_in_url, :label => "LinkedIn (full url)"
      f.input :twitter_name, :label => "Twitter (name only)"
      f.input :phone, :label => "Phone Number"
    end
    f.actions
  end


end
