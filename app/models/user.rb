class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true

  def to_token_payload
    { sub: id, email: email, name: name, is_admin: admin }
  end
end
