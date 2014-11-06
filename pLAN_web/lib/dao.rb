require_relative 'user'

def get_missing_user
  return get_user( 1 + rand( User.count ) )
end

def get_user( user_id )
  return User.get( user_id )
end

def get_users
  return User.all
end
