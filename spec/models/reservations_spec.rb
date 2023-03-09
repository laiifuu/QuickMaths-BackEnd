require 'rails_helper'

RSpec.describe Reservation, type: :model do
  it 'Reservation should be invalid (missing user_id)' do
    tutor = Tutor.create(first_name: 'Elena', last_name: 'Rickman',
                         photo_url: 'https://www.cambridgemaths.org/Images/Lynne%27s%20PD%20blog%20image.png',
                         description: 'Elena is a college professor who teaches at Cambridge University. She is',
                         hourly_fee: 20, experience: 10)
    reservation = Reservation.create(tutor_id: tutor.id, city: 'LA', date: '2023-09-10', hour: '9pm - 10pm')
    expect(reservation).to_not be_valid
  end

  it 'Reservation should be invalid (missing tutor_id)' do
    user = User.create(username: 'Daron01')
    reservation = Reservation.create(user_id: user.id, city: 'LA', date: '2023-09-10', hour: '9pm - 10pm')
    expect(reservation).to_not be_valid
  end

  it 'Reservation should be invalid (missing city)' do
    user = User.create(username: 'Daron01')
    tutor = Tutor.create(first_name: 'Elena', last_name: 'Rickman',
                         photo_url: 'https://www.cambridgemaths.org/Images/Lynne%27s%20PD%20blog%20image.png',
                         description: 'Elena is a college professor who teaches at Cambridge University. She is',
                         hourly_fee: 20, experience: 10)
    reservation = Reservation.create(user_id: user.id, tutor_id: tutor.id, date: '2023-09-10', hour: '9pm - 10pm')
    expect(reservation).to_not be_valid
  end

  it 'Reservation should be invalid (missing date)' do
    user = User.create(username: 'Daron01')
    tutor = Tutor.create(first_name: 'Elena', last_name: 'Rickman',
                         photo_url: 'https://www.cambridgemaths.org/Images/Lynne%27s%20PD%20blog%20image.png',
                         description: 'Elena is a college professor who teaches at Cambridge University. She is',
                         hourly_fee: 20, experience: 10)
    reservation = Reservation.create(user_id: user.id, tutor_id: tutor.id, hour: '9pm - 10pm')
    expect(reservation).to_not be_valid
  end

  it 'Reservation should be invalid (missing hour)' do
    user = User.create(username: 'Daron01')
    tutor = Tutor.create(first_name: 'Elena', last_name: 'Rickman',
                         photo_url: 'https://www.cambridgemaths.org/Images/Lynne%27s%20PD%20blog%20image.png',
                         description: 'Elena is a college professor who teaches at Cambridge University. She is',
                         hourly_fee: 20, experience: 10)
    reservation = Reservation.create(user_id: user.id, tutor_id: tutor.id, city: 'LA', date: '2023-09-10')
    expect(reservation).to_not be_valid
  end

  it 'Reservation should be invalid (duplicate)' do
    user = User.create(username: 'Daron01')
    tutor = Tutor.create(first_name: 'Elena', last_name: 'Rickman',
                         photo_url: 'https://www.cambridgemaths.org/Images/Lynne%27s%20PD%20blog%20image.png',
                         description: 'Elena is a college professor who teaches at Cambridge University. She is',
                         hourly_fee: 20, experience: 10)
    Reservation.create(user_id: user.id, tutor_id: tutor.id, city: 'LA', date: '2023-09-10',
                       hour: '9pm - 10pm')
    reservation1 = Reservation.create(user_id: user.id, tutor_id: tutor.id, city: 'LA', date: '2023-09-10',
                                      hour: '9pm - 10pm')
    expect(reservation1).to_not be_valid
  end

  it 'Reservation should be valid' do
    user = User.create(username: 'Daron01')
    tutor = Tutor.create(first_name: 'Elena', last_name: 'Rickman',
                         photo_url: 'https://www.cambridgemaths.org/Images/Lynne%27s%20PD%20blog%20image.png',
                         description: 'Elena is a college professor who teaches at Cambridge University. She is',
                         hourly_fee: 20, experience: 10)
    reservation = Reservation.create(user_id: user.id, tutor_id: tutor.id, city: 'LA', date: '2023-09-10',
                                     hour: '9pm - 10pm')
    expect(reservation).to be_valid
  end
end
