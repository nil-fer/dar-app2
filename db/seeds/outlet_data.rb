def create_outlets
  create_outlet(
    company_name: 'Перекресток',
    manager_email: 'manager@perekrestok.com',
    address: fake_address(
      street: "ул. Новый Арбат",
      apartment: "15",
      block: "с1"
    )
  )
  create_outlet(
    company_name: 'Братья Караваевы',
    manager_email: 'manager@karavaev_brothers.com',
    address: fake_address(
      street: "ул. Спиридоновка",
      apartment: "25",
      block: "20с1"
    )
  )

  create_outlet(
    company_name: 'МакДоналдс',
    manager_email: 'manager@mcdonalds.com',
    address: fake_address(
      street: "ул. Никольская",
      apartment: "10"
    )
  )

  create_outlet(
    company_name: 'Французская пекарня',
    manager_email: 'manager@french_bakery.com',
    address: fake_address(
      street: "ул. Мясницкая",
      apartment: "17",
      block: "с3"
    )
  )
end

def create_outlet(company_name:, address:, manager_email:)
  company = Company.find_by(company_name: company_name)

  outlet = Outlet.create(
    company_id: company.id,
    address: address,
    outlet_category: company.company_category
  )
  outlet.save!

  User.find_by_email(manager_email).update(
    outlet_id: outlet.id
  )
end


def fake_address(street:, apartment:, block: '')
  {
    city: 'Москва',
    street: street,
    apartment: apartment,
    block: block
  }
end
