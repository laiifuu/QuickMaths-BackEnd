User.create(username: "Daron01")
User.create(username: "Hayet01")
User.create(username: "Florin")
User.create(username: "TheMuffinMan")

Tutor.create(first_name: "Jim", last_name: "Beam", photo_url: "https://t3.ftcdn.net/jpg/03/05/77/64/360_F_305776453_t7SUl48g63zLsyODxd60aj6EcWR9avVK.jpg", description: "Jim is a highschool teacher with 3 years of experience. He knows about Thales", hourly_fee: 10, experience: 3)

Tutor.create(first_name: "Jack", last_name: "Daniels", photo_url: "https://thumbs.dreamstime.com/b/beautiful-black-man-front-white-background-happy-expressions-132674996.jpg", description: "Jack is a highschool teacher with 5 years of experience. He knows about Pythagora", hourly_fee: 20, experience: 5)

Tutor.create(first_name: "Elena", last_name: "Rickman", photo_url: "https://www.cambridgemaths.org/Images/Lynne%27s%20PD%20blog%20image.png", description: "Elena is a college professor who teaches at Cambridge University. She is known for her willigness to strive for math", hourly_fee: 20, experience: 10)

Tutor.create(first_name: "Mike", last_name: "Michaelson", photo_url: "https://www.shutterstock.com/image-photo/young-man-looking-camera-front-260nw-785164870.jpg", description: "Mike loves Math and loves teaching. One day he decided, Hey, why not combine the two! fun right ?", hourly_fee: 20, experience: 3)

Tutor.create(first_name: "George", last_name: "Mathew", photo_url: "https://static9.depositphotos.com/1011643/1138/i/950/depositphotos_11388954-stock-photo-math-teacher.jpg", description: "George is a well know teacher who makes sure his students make it to Harvard. isn\'t that nice?", hourly_fee: 25, experience:5)


Reservation.create(user_id: 1, tutor_id: 1, city: 'LA', date: '2023-09-10', hour: '9pm - 10pm')
Reservation.create(user_id: 2, tutor_id: 2, city: 'Belgrade', date: '2023-12-23', hour: '10pm - 11pm')
Reservation.create(user_id: 4, tutor_id: 1, city: 'Amsterdam', date: '2023-11-15', hour: '10am - 11am')
