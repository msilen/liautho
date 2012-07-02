class User < ActiveRecord::Base
  def self.find_or_create_from_auth_hash(auth_hash)
    where(auth_hash.slice "provider","uid").first||create_from_omniauth(auth_hash)
  end

  def self.create_from_omniauth(auth_hash)
    create! do |user|
      user.provider=auth_hash["provider"]
      user.uid=auth_hash["uid"]
      user.name=auth_hash["info"]["name"]
    end
  end
end
