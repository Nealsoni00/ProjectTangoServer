class User < ActiveRecord::Base

  class << self
    def from_omniauth(auth_hash)
      domain = auth_hash['extra']['id_info']['hd']

      if domain.nil?
        return nil
      end

      ####Here's where we can deny certain email addresses
      #if !domain.nil? && !domain.include?('westport.k12.ct.us')
      #  return nil
      #end

      #It's a valid user
      #follow through with account creation
      user = find_or_create_by(email: auth_hash['info']['email']) do |user|
        user.name = auth_hash['info']['name']
        user.picture = auth_hash['info']['image']
        user.google_id = auth_hash['uid']
      end

      user.name = auth_hash['info']['name']
      user.picture = auth_hash['info']['image']
      user.google_id = auth_hash['uid']

      user.save!
      user
    end

    #Note - this doesn't save
    def from_params(user_params)
      #Make sure this is an SHS user
      unless user_params['email'].include?('westport.k12.ct.us')
        return nil
      end

      #It's an SHS user
      #follow through with account creation
      user = find_or_create_by(email: user_params['email']) do |user|
        user.name = user_params['name']
        user.picture = user_params['picture']
        user.account_id = user_params['google_id']
      end

      user.name = user_params['name']
      user.picture = user_params['picture']
      user.account_id = user_params['google_id']

      user
    end
  end

  def to_json(options={})
    options[:except] ||= [:id, :account_id, :created_at, :updated_at]
    super(options)
  end
end
