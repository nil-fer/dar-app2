def create_batches
  create_batch(
    activation_start: period(from: Time.now - 1.hours, to: Time.now),
    activation_end: period(from: Time.now, to: Time.now + 1.hours),
    user_email: 'manager@perekrestok.com'
  )

  create_batch(
    activation_start: period(from: Time.now + 1.hours, to: Time.now + 2.hours),
    activation_end: period(from: Time.now + 2.hours, to: Time.now + 3.hours),
    user_email: 'manager@karavaev_brothers.com'
  )

  create_batch(
    activation_start: period(from: Time.now + 3.hours, to: Time.now + 4.hours),
    activation_end: period(from: Time.now + 4.hours, to: Time.now + 5.hours),
    user_email: 'manager@mcdonalds.com'
  )

  create_batch(
    activation_start: period(from: Time.now + 5.hours, to: Time.now + 6.hours),
    activation_end: period(from: Time.now + 6.hours, to: Time.now + 7.hours),
    user_email: 'manager@french_bakery.com'
  )
end

def create_batch(activation_start:, activation_end:, user_email:)
  user = User.find_by_email(user_email)

  Batch.create(
    activation_start: activation_start,
    activation_end: activation_end,
    user_id: user.id,
    outlet_id: user.outlet_id
  )
end

def period(from:, to:)
  Faker::Time.between(
    from: from,
    to: to,
    format: :short
  )
end
