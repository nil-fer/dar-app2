def create_companies
  create_company(
    company_name: 'Перекресток',
    retailer_email: 'retailer@perekrestok.com',
    manager_email: 'manager@perekrestok.com'
  )
  create_company(
    company_name: 'Братья Караваевы',
    retailer_email: 'retailer@karavaev_brothers.com',
    manager_email: 'manager@karavaev_brothers.com'
  )
  create_company(
    company_name: 'МакДоналдс',
    retailer_email: 'retailer@mcdonalds.com',
    manager_email: 'manager@mcdonalds.com'
  )
  create_company(
    company_name: 'Французская пекарня',
    retailer_email: 'retailer@french_bakery.com',
    manager_email: 'manager@french_bakery.com'
  )
end

def create_company(company_name:, retailer_email:, manager_email:)
  company = Company.create(
    company_name: company_name,
    user_id: User.find_by_email(retailer_email).id
  )

  User.find_by_email(retailer_email).update(
    company_id: company.id
  )

  User.find_by_email(manager_email).update(
    company_id: company.id
  )
end