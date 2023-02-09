class Users::RegistrationsController < Devise::RegistrationsController
  # POST /resource
  def create
    build_resource(sign_up_params)
    resource.save
    yield resource if block_given?
    if resource.persisted?
        if resource.active_for_authentication?
            set_flash_message! :notice, :signed_up
            sign_up(resource_name, resource)
            respond_with resource, location: after_sign_up_path_for(resource)
        else
            set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
            expire_data_after_sign_in!
            respond_with resource, location: after_inactive_sign_up_path_for(resource)
        end
    else
        clean_up_passwords resource
        set_minimum_password_length
        respond_with resource, status: :see_other # 登録失敗時のrespond_withにerror出したいので、ここで303 statusを追加
    end
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  protected

    def after_update_path_for(resource)
      flash[:notice] = 'ユーザー情報を更新しました'
      edit_user_registration_path 
    end
end
