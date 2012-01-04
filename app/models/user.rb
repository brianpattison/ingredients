require 'highline/import'

class User < ActiveRecord::Base
  def self.from_omniauth(auth)
    find_by_provider_and_uid(auth["provider"], auth["uid"]) || create_with_omniauth(auth)
  end

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
    end
  end
  
  def self.setup
    if Identity.count > 0
      return 'Already Setup'
    end
    name = prompt('Name')
    email = prompt('Email')
    password = prompt('Password')
    password_confirmation = prompt('Confirm Password')
    identity = Identity.new(:name => name, :email => email, :password => password, :password_confirmation => password_confirmation)
    if identity.save
      User.create(:provider => 'identity', :uid => identity.id, :name => identity.name)
      return 'Setup Successful!'
    else
      return 'Setup failed: ' + identity.errors.full_messages.join(', ')
    end
  end
  
private

  def self.prompt(field)
    if field.include?('Password')
      result = ask(field + ': '){|q| q.echo = false}.strip
    else
      result = ask(field + ': ').strip
    end
    if result.empty?
      return prompt(field)
    else
      return result
    end
  end
end