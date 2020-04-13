course1 = Course.create(
    name: "Augusta"
) 

course2 = Course.create(
    name: "Pinehurst"
)

course3 = Course.create(
    name: "CityView"
)

golfer1 = Golfer.create(
    name: "Glenn Weber",
    party_size: 4
)

golfer2 = Golfer.create(
    name: "Evan Leather",
    party_size: 2
)

golfer3 = Golfer.create(
    name: "Nick Gill",
    party_size: 1
)

teetime1 = Teetime.create(
    reservation_time: "7:00AM 4/15/2020",
    golfer: golfer1,
    course: course1
)

teetime2 = Teetime.create(
    reservation_time: "9:00AM 4/15/2020",
    golfer: golfer2,
    course: course2
)

teetime3 = Teetime.create(
    reservation_time: "9:00AM 4/15/2020",
    golfer: golfer3,
    course: course3
)

