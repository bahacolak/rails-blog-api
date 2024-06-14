class Users::SessionsController < Devise::SessionsController
  def create
    super do |user|
      unless user.persisted?
        raise Devise::InvalidLoginAttemptError, 'Invalid login attempt'
      end
    end
  end
end
