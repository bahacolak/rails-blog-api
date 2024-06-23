class Users::SessionsController < Devise::SessionsController
  def create
    super do |user|
      unless user.persisted?
        raise InvalidLoginAttemptError, 'Invalid login attempt'
      end
    end
  end
end
