class Systemuser < ApplicationRecord
  def self.authenticate(email, password)
    user = Systemuser.find_by_email(email)
    if user && user.password == password
      return user
    else
      return false
    end
  end
end
