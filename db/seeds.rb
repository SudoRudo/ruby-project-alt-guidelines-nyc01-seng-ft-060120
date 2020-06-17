

Precinct.create(
    name: "52nd Police precinct" , 
    location: "3016 Webster Ave, The Bronx, NY 10467"
    )
Precinct.create(
    name: "50th Police precinct" , 
    location: "3450 Kingsbridge Ave, The Bronx, NY 10463"
    )
Precinct.create(
    name: "49th Police precinct" , 
    location: "2121 Eastchester Rd, The Bronx, NY 10461"
    )

Officer.create(name: "Aaron Delano", badge_number: 456000, precinct_id: 1)
Officer.create(name: "Matthew Abad", badge_number: 476000, precinct_id: 1)
Officer.create(name: "Erika Accero", badge_number: 458000, precinct_id: 2)
Officer.create(name: "Thomas Adams", badge_number: 430300, precinct_id: 3)

rudy = User.create(name: "Rudy")
stephen = User.create(name: "Stephen")
sophie = User.create(name: "Sophie")

rudy.create_report("Bad Encounter", "August 5th", "Aaron Delano", "I had a bad encounter with officer Delano.")
stephen.create_report("Okay Encounter", "February 35th", "Aaron Delano", "I had an okay encounter with officer Delano.")
rudy.create_report("Good Encounter", "August 5th", "Erika Accero", "I had a good encounter with officer Accero.")

# Report.create(title: "Bad Encounter", date: "August 5th", officer_id: 1, user_id: 1, report: "I had a bad encounter with officer Delano.")
# Report.create(title: "Good Encounter", date: "September 9th", officer_id: 3, user_id: 1, report: "I had a good encounter with officer Accero.")





# 48 = Precinct.new(
#     name: “48th Police precinct” , 
#     location: “450 Cross Bronx Expy, The Bronx, NY 10457”
#     )
# 47 = Precinct.new(
#     name: “47th Police precinct” , 
#     location: “4111 Laconia Ave, The Bronx, NY 10466”
#     )
# 46 = Precinct.new(
#     name: “46th Police precinct” , 
#     location: “2120 Ryer Ave, The Bronx, NY 10457”
#     )
# 45 = Precinct.new(
#     name: “45th Police precinct” , 
#     location: “2877 Barkley Ave, The Bronx, NY 10465”
#     )
# 44 = Precinct.new(
#     name: “44th Police precinct” , 
#     location: “ 2 E 169th St, The Bronx, NY 10452”
#     )
# 43 = Precinct.new(
#     name: “43rd Police precinct” , 
#     location: “900 Fteley Ave, The Bronx, NY 10473”
#     )
# 42 = Precinct.new(name: “42nd Police precinct” , location: “”
# 41 = Precinct.new(name: “41st Police precinct” , location: “”
# 40 = Precinct.new(name: “40th Police precinct” , location: “”
