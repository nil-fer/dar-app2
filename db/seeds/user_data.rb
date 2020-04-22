PASSWORD = 'testtest'

def create_users
  user_create('admin', 'admin')

  user_create('retailer', 'perekrestok')
  user_create('manager', 'perekrestok')

  user_create('retailer', 'karavaev_brothers')
  user_create('manager', 'karavaev_brothers')

  user_create('retailer', 'mcdonalds')
  user_create('manager', 'mcdonalds')

  user_create('retailer', 'french_bakery')
  user_create('manager', 'french_bakery')
end

def user_create(account_role, company_name)
  User.create(
    email: "#{account_role}@#{company_name}.com",
    role: "#{account_role}",
    password: PASSWORD,
    password_confirmation: PASSWORD
  )
end
