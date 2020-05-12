@user_emails = [
  'manager@perekrestok.com',
  'manager@karavaev_brothers.com',
  'manager@mcdonalds.com',
  'manager@french_bakery.com'
]

def create_batches
  #TO DO переделать метод create_batch
  create_batch(
    activation_start: 30.minutes.ago,
    activation_end: 30.minutes.since,
    user_email: 'manager@perekrestok.com'
  )

  create_batch(
    activation_start: 1.hour.since,
    activation_end: 2.hours.since,
    user_email: 'manager@karavaev_brothers.com'
  )

  create_batch(
    activation_start: 90.minutes.since,
    activation_end: 150.minutes.since,
    user_email: 'manager@mcdonalds.com'
  )

  create_batch(
    activation_start: 2.hours.since,
    activation_end: 4.hours.since,
    user_email: 'manager@french_bakery.com'
  )
end

def create_batch(activation_start:, activation_end:, user_email:)
  user = User.find_by_email(user_email)

  Batch.create!(
    activation_start: activation_start,
    activation_end: activation_end,
    user_id: user.id,
    outlet_id: user.outlet_id
  )
end

