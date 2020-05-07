def create_outlets
  create_outlet(
    company_name: 'Перекресток',
    address: fake_address(
      street: "ул. Новый Арбат",
      apartment: "15",
      block: "с1"
    )
  )
  create_outlet(
    company_name: 'Братья Караваевы',
    address: fake_address(
      street: "ул. Спиридоновка",
      apartment: "25",
      block: "20с1"
    )
  )

  create_outlet(
    company_name: 'МакДоналдс',
    address: fake_address(
      street: "ул. Никольская",
      apartment: "10"
    )
  )

  create_outlet(
    company_name: 'Французская пекарня',
    address: fake_address(
      street: "ул. Мясницкая",
      apartment: "17",
      block: "с3"
    )
  )
end

def create_outlet(company_name:, address:)
  company = Company.find_by(company_name: company_name)
  user = User.where(company_id: company.id).find_by_role('manager')

  outlet = Outlet.create(
    company_id: company.id,
    address: address,
    outlet_category: company.company_category,
    user_id: user.id
  )
  outlet.save!
  if user
    user.update(
      outlet_id: outlet.id
    )
  end
end

def fake_address(street:, apartment:, block: '')
  {
    city: 'Москва',
    street: street,
    apartment: apartment,
    block: block
  }
end
