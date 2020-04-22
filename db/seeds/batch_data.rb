@user_emails = [
  'manager@perekrestok.com',
  'manager@karavaev_brothers.com',
  'manager@mcdonalds.com',
  'manager@french_bakery.com'
]

def create_batches
<<<<<<< HEAD
  100.times do
    activation = [past_activation_data, earliest_activation_data, early_activation_data, late_activation_data].sample
=======
  # 100.times do
  #   activation = [past_activation_data, earliest_activation_data, early_activation_data, late_activation_data].sample
  #
  #   create_batch(
  #     activation_start: activation[:start],
  #     activation_end: activation[:end],
  #     user_email: @user_emails.sample
  #   )
  # end


  #TO DO переделать метод create_batch
  create_batch(
    activation_start: period(from: Time.now - 1.hours, to: Time.now),
    activation_end: period(from: Time.now, to: Time.now + 1.hours),
    user_email: 'manager@perekrestok.com'
  )
>>>>>>> a2ea1545191189ae9928171c9d909592c79f202e

    create_batch(
      activation_start: activation[:start],
      activation_end: activation[:end],
      user_email: @user_emails.sample
    )
  end


  #TO DO переделать метод create_batch
  # create_batch(
  #   activation_start: period(from: Time.now - 1.hours, to: Time.now),
  #   activation_end: period(from: Time.now, to: Time.now + 1.hours),
  #   user_email: 'manager@perekrestok.com'
  # )
  #
  # create_batch(
  #   activation_start: period(from: Time.now + 1.hours, to: Time.now + 2.hours),
  #   activation_end: period(from: Time.now + 2.hours, to: Time.now + 3.hours),
  #   user_email: 'manager@karavaev_brothers.com'
  # )
  #
  # create_batch(
  #   activation_start: period(from: Time.now + 3.hours, to: Time.now + 4.hours),
  #   activation_end: period(from: Time.now + 4.hours, to: Time.now + 5.hours),
  #   user_email: 'manager@mcdonalds.com'
  # )
  #
  # create_batch(
  #   activation_start: period(from: Time.now + 5.hours, to: Time.now + 6.hours),
  #   activation_end: period(from: Time.now + 6.hours, to: Time.now + 7.hours),
  #   user_email: 'manager@french_bakery.com'
  # )
end

def past_activation_data
  {
    start: Time.now - (11..20).to_a.sample.hours,
    end: Time.now - (1..10).to_a.sample.hours
  }
end

def earliest_activation_data
  {
    start: Time.now - (1..10).to_a.sample.hours,
  end: Time.now + 1.hours
  }
end

def early_activation_data
  {
    start: Time.now - (1..7).to_a.sample.hours,
  end: Time.now + (1..3).to_a.sample.hours
  }
end

def late_activation_data
  {
    start: Time.now - (1..5).to_a.sample.hours,
  end: Time.now + (1..10).to_a.sample.hours
  }
end
#
# def past_activation_data
#   {
#     start: Time.now - (11..20).to_a.sample.hours,
#     end: Time.now - (1..10).to_a.sample.hours
#   }
# end
#
# def earliest_activation_data
#   {
#     start: Time.now - (1..10).to_a.sample.hours,
#     end: Time.now + 1.hours
#   }
# end
#
# def early_activation_data
#   {
#     start: Time.now - (1..7).to_a.sample.hours,
#     end: Time.now + (1..3).to_a.sample.hours
#   }
# end
#
# def late_activation_data
#   {
#     start: Time.now - (1..5).to_a.sample.hours,
#     end: Time.now + (1..10).to_a.sample.hours
#   }
# end

def create_batch(activation_start:, activation_end:, user_email:)
  user = User.find_by_email(user_email)

  Batch.create!(
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
