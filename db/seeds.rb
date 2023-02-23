User.create(username: "Daron01")
User.create(username: "Hayet01")
User.create(username: "Florin")
User.create(username: "TheMuffinMan")

Tutor.create(first_name: "Jim", last_name: "Beam", photo_url: "https://t3.ftcdn.net/jpg/03/05/77/64/360_F_305776453_t7SUl48g63zLsyODxd60aj6EcWR9avVK.jpg", description: "Jim was a bald teacher teaching math for 3 yea
rs. He knows about Thales", hourly_fee: 10, experience: 3)

Tutor.create(first_name: "Jack", last_name: "Daniels", photo_url: "https://thumbs.dreamstime.com/b/beautiful-black-man-front-white-background-happy-expressions-132674996.jpg", description: "Jim was a bald teacher teaching math for 3 yea
rs. He knows about Pythagora", hourly_fee: 20, experience: 3)

Reservation.create(user_id: 1, tutor_id: 1, city: 'LA', date: '2023-09-10')
Reservation.create(user_id: 2, tutor_id: 2, city: 'Belgrade', date: '2023-12-23')
Reservation.create(user_id: 4, tutor_id: 1, city: 'Amsterdam', date: '2023-11-15')
