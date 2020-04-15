course1 = Course.create(
    name: "Augusta",
    public: "No",
    cost: 5000,
    driving_range: "Yes"
)   

course2 = Course.create(
    name: "Pinehurst",
    public: "No",
    cost: 250,
    driving_range: "Yes"
)

course3 = Course.create(
    name: "CityView",
    public: "Yes",
    cost: 25,
    driving_range: "No"
)

course4 = Course.create(
    name: "Green Valley Ranch",
    public: "Yes",
    cost: 55,
    driving_range: "Yes"
)

golfer1 = Golfer.create(
    name: "Glenn Weber",
    age: 35,
    handicap: 9
)

golfer2 = Golfer.create(
    name: "Evan Leather",
    age: 94,
    handicap: 6
)

golfer3 = Golfer.create(
    name: "Nick Gill",
    age: 14,
    handicap: 24
)

teetime1 = Teetime.create(
    reservation_time: "7:00AM 4/15/2020",
    golfer: golfer1,
    course: course1,
    party_size: 3
    )

teetime2 = Teetime.create(
    reservation_time: "9:00AM 4/15/2020",
    golfer: golfer2,
    course: course2,
    party_size: 4
)

teetime3 = Teetime.create(
    reservation_time: "9:00AM 4/15/2020",
    golfer: golfer3,
    course: course3,
    party_size: 2
)