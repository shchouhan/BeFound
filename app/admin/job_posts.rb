ActiveAdmin.register JobPost do
  permit_params  :job_role, :category_id,:job_description, :vacancies, :user_id, :salary, :qualification

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :job_role, :job_description, :vacancies, :user_id, :category_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:job_role, :job_description, :vacancies, :user_id, :category_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
