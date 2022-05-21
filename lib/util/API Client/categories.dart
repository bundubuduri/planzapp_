class Categories {
  final Map categories = {
    "arts & entertainment": {
      "id": "4d4b7104d754a06370d81259",
      "has_children": true,
      "is_child": false,
      "parents": [],
      "children": []
    },
    "amphitheater": {
      "id": "56aa371be4b08b9a8d5734db",
      "has_children": false,
      "is_child": true,
      "parents": ["arts & entertainment"]
    },
    "aquarium": {
      "id": "4fceea171983d5d06c3e9823",
      "has_children": false,
      "is_child": true,
      "parents": ["arts & entertainment"]
    },
    "arcade": {
      "id": "4bf58dd8d48988d1e1931735",
      "has_children": false,
      "is_child": true,
      "parents": ["arts & entertainment"]
    },
    "art gallery": {
      "id": "4bf58dd8d48988d1e2931735",
      "has_children": false,
      "is_child": true,
      "parents": ["arts & entertainment"]
    },
    "bowling alley": {
      "id": "4bf58dd8d48988d1e4931735",
      "has_children": false,
      "is_child": true,
      "parents": ["arts & entertainment"]
    },
    "casino": {
      "id": "4bf58dd8d48988d17c941735",
      "has_children": false,
      "is_child": true,
      "parents": ["arts & entertainment"]
    },
    "circus": {
      "id": "52e81612bcbc57f1066b79e7",
      "has_children": false,
      "is_child": true,
      "parents": ["arts & entertainment"]
    },
    "comedy club": {
      "id": "4bf58dd8d48988d18e941735",
      "has_children": false,
      "is_child": true,
      "parents": ["arts & entertainment"]
    },
    "concert hall": {
      "id": "5032792091d4c4b30a586d5c",
      "has_children": false,
      "is_child": true,
      "parents": ["arts & entertainment"]
    },
    "country dance club": {
      "id": "52e81612bcbc57f1066b79ef",
      "has_children": false,
      "is_child": true,
      "parents": ["arts & entertainment"]
    },
    "disc golf": {
      "id": "52e81612bcbc57f1066b79e8",
      "has_children": false,
      "is_child": true,
      "parents": ["arts & entertainment"]
    },
    "escape room": {
      "id": "5f2c2834b6d05514c704451e",
      "has_children": false,
      "is_child": true,
      "parents": ["arts & entertainment"]
    },
    "exhibit": {
      "id": "56aa371be4b08b9a8d573532",
      "has_children": false,
      "is_child": true,
      "parents": ["arts & entertainment"]
    },
    "general entertainment": {
      "id": "4bf58dd8d48988d1f1931735",
      "has_children": false,
      "is_child": true,
      "parents": ["arts & entertainment"]
    },
    "go kart track": {
      "id": "52e81612bcbc57f1066b79ea",
      "has_children": false,
      "is_child": true,
      "parents": ["arts & entertainment"]
    },
    "historic site": {
      "id": "4deefb944765f83613cdba6e",
      "has_children": false,
      "is_child": true,
      "parents": ["arts & entertainment"]
    },
    "karaoke box": {
      "id": "5744ccdfe4b0c0459246b4bb",
      "has_children": false,
      "is_child": true,
      "parents": ["arts & entertainment"]
    },
    "laser tag": {
      "id": "52e81612bcbc57f1066b79e6",
      "has_children": false,
      "is_child": true,
      "parents": ["arts & entertainment"]
    },
    "memorial site": {
      "id": "5642206c498e4bfca532186c",
      "has_children": false,
      "is_child": true,
      "parents": ["arts & entertainment"]
    },
    "mini golf": {
      "id": "52e81612bcbc57f1066b79eb",
      "has_children": false,
      "is_child": true,
      "parents": ["arts & entertainment"]
    },
    "movie theater": {
      "id": "4bf58dd8d48988d17f941735",
      "has_children": true,
      "is_child": true,
      "parents": ["arts & entertainment"],
      "children": [
        {"drive-in theater": "56aa371be4b08b9a8d5734de"},
        {"indie movie theater": "4bf58dd8d48988d17e941735"},
        {"multiplex": "4bf58dd8d48988d180941735"}
      ]
    },
    "museum": {
      "id": "4bf58dd8d48988d181941735",
      "has_children": true,
      "is_child": true,
      "parents": ["arts & entertainment"],
      "children": [
        {"art museum": "4bf58dd8d48988d18f941735"},
        {"erotic museum": "559acbe0498e472f1a53fa23"},
        {"history museum": "4bf58dd8d48988d190941735"},
        {"planetarium": "4bf58dd8d48988d192941735"},
        {"science museum": "4bf58dd8d48988d191941735"}
      ]
    },
    "music venue": {
      "id": "4bf58dd8d48988d1e5931735",
      "has_children": true,
      "is_child": true,
      "parents": ["arts & entertainment"],
      "children": [
        {"jazz club": "4bf58dd8d48988d1e7931735"},
        {"piano bar": "4bf58dd8d48988d1e8931735"},
        {"rock club": "4bf58dd8d48988d1e9931735"}
      ]
    },
    "pachinko parlor": {
      "id": "5744ccdfe4b0c0459246b4b8",
      "has_children": false,
      "is_child": true,
      "parents": ["arts & entertainment"]
    },
    "performing arts venue": {
      "id": "4bf58dd8d48988d1f2931735",
      "has_children": true,
      "is_child": true,
      "parents": ["arts & entertainment"],
      "children": [
        {"dance studio": "4bf58dd8d48988d134941735"},
        {"indie theater": "4bf58dd8d48988d135941735"},
        {"opera house": "4bf58dd8d48988d136941735"},
        {"theater": "4bf58dd8d48988d137941735"}
      ]
    },
    "pool hall": {
      "id": "4bf58dd8d48988d1e3931735",
      "has_children": false,
      "is_child": true,
      "parents": ["arts & entertainment"]
    },
    "public art": {
      "id": "507c8c4091d498d9fc8c67a9",
      "has_children": true,
      "is_child": true,
      "parents": ["arts & entertainment"],
      "children": [
        {"outdoor sculpture": "52e81612bcbc57f1066b79ed"},
        {"street art": "52e81612bcbc57f1066b79ee"}
      ]
    },
    "racecourse": {
      "id": "56aa371be4b08b9a8d573514",
      "has_children": false,
      "is_child": true,
      "parents": ["arts & entertainment"]
    },
    "racetrack": {
      "id": "4bf58dd8d48988d1f4931735",
      "has_children": false,
      "is_child": true,
      "parents": ["arts & entertainment"]
    },
    "roller rink": {
      "id": "52e81612bcbc57f1066b79e9",
      "has_children": false,
      "is_child": true,
      "parents": ["arts & entertainment"]
    },
    "salsa club": {
      "id": "52e81612bcbc57f1066b79ec",
      "has_children": false,
      "is_child": true,
      "parents": ["arts & entertainment"]
    },
    "samba school": {
      "id": "56aa371be4b08b9a8d5734f9",
      "has_children": false,
      "is_child": true,
      "parents": ["arts & entertainment"]
    },
    "stadium": {
      "id": "4bf58dd8d48988d184941735",
      "has_children": true,
      "is_child": true,
      "parents": ["arts & entertainment"],
      "children": [
        {"baseball stadium": "4bf58dd8d48988d18c941735"},
        {"basketball stadium": "4bf58dd8d48988d18b941735"},
        {"cricket ground": "4bf58dd8d48988d18a941735"},
        {"football stadium": "4bf58dd8d48988d189941735"},
        {"hockey arena": "4bf58dd8d48988d185941735"},
        {"rugby stadium": "56aa371be4b08b9a8d573556"},
        {"soccer stadium": "4bf58dd8d48988d188941735"},
        {"tennis stadium": "4e39a891bd410d7aed40cbc2"},
        {"track stadium": "4bf58dd8d48988d187941735"}
      ]
    },
    "theme park": {
      "id": "4bf58dd8d48988d182941735",
      "has_children": true,
      "is_child": true,
      "parents": ["arts & entertainment"],
      "children": [
        {"theme park ride / attraction": "5109983191d435c0d71c2bb1"}
      ]
    },
    "tour provider": {
      "id": "56aa371be4b08b9a8d573520",
      "has_children": false,
      "is_child": true,
      "parents": ["arts & entertainment"]
    },
    "vr cafe": {
      "id": "5f2c14a5b6d05514c7042eb7",
      "has_children": false,
      "is_child": true,
      "parents": ["arts & entertainment"]
    },
    "water park": {
      "id": "4bf58dd8d48988d193941735",
      "has_children": false,
      "is_child": true,
      "parents": ["arts & entertainment"]
    },
    "zoo": {
      "id": "4bf58dd8d48988d17b941735",
      "has_children": true,
      "is_child": true,
      "parents": ["arts & entertainment"],
      "children": [
        {"zoo exhibit": "58daa1558bbb0b01f18ec1fd"}
      ]
    },
    "college & university": {
      "id": "4d4b7105d754a06372d81259",
      "has_children": true,
      "is_child": false,
      "parents": [],
      "children": []
    },
    "college academic building": {
      "id": "4bf58dd8d48988d198941735",
      "has_children": true,
      "is_child": true,
      "parents": ["college & university"],
      "children": [
        {"college arts building": "4bf58dd8d48988d199941735"},
        {"college communications building": "4bf58dd8d48988d19a941735"},
        {"college engineering building": "4bf58dd8d48988d19e941735"},
        {"college history building": "4bf58dd8d48988d19d941735"},
        {"college math building": "4bf58dd8d48988d19c941735"},
        {"college science building": "4bf58dd8d48988d19b941735"},
        {"college technology building": "4bf58dd8d48988d19f941735"}
      ]
    },
    "college administrative building": {
      "id": "4bf58dd8d48988d197941735",
      "has_children": false,
      "is_child": true,
      "parents": ["college & university"]
    },
    "college auditorium": {
      "id": "4bf58dd8d48988d1af941735",
      "has_children": false,
      "is_child": true,
      "parents": ["college & university"]
    },
    "college bookstore": {
      "id": "4bf58dd8d48988d1b1941735",
      "has_children": false,
      "is_child": true,
      "parents": ["college & university"]
    },
    "college cafeteria": {
      "id": "4bf58dd8d48988d1a1941735",
      "has_children": false,
      "is_child": true,
      "parents": ["college & university"]
    },
    "college classroom": {
      "id": "4bf58dd8d48988d1a0941735",
      "has_children": false,
      "is_child": true,
      "parents": ["college & university"]
    },
    "college gym": {
      "id": "4bf58dd8d48988d1b2941735",
      "has_children": false,
      "is_child": true,
      "parents": ["college & university"]
    },
    "college lab": {
      "id": "4bf58dd8d48988d1a5941735",
      "has_children": false,
      "is_child": true,
      "parents": ["college & university"]
    },
    "college library": {
      "id": "4bf58dd8d48988d1a7941735",
      "has_children": false,
      "is_child": true,
      "parents": ["college & university"]
    },
    "college quad": {
      "id": "4bf58dd8d48988d1aa941735",
      "has_children": false,
      "is_child": true,
      "parents": ["college & university"]
    },
    "college rec center": {
      "id": "4bf58dd8d48988d1a9941735",
      "has_children": false,
      "is_child": true,
      "parents": ["college & university"]
    },
    "college residence hall": {
      "id": "4bf58dd8d48988d1a3941735",
      "has_children": false,
      "is_child": true,
      "parents": ["college & university"]
    },
    "college stadium": {
      "id": "4bf58dd8d48988d1b4941735",
      "has_children": true,
      "is_child": true,
      "parents": ["college & university"],
      "children": [
        {"college baseball diamond": "4bf58dd8d48988d1bb941735"},
        {"college basketball court": "4bf58dd8d48988d1ba941735"},
        {"college cricket pitch": "4bf58dd8d48988d1b9941735"},
        {"college football field": "4bf58dd8d48988d1b8941735"},
        {"college hockey rink": "4bf58dd8d48988d1b5941735"},
        {"college soccer field": "4bf58dd8d48988d1b7941735"},
        {"college tennis court": "4e39a9cebd410d7aed40cbc4"},
        {"college track": "4bf58dd8d48988d1b6941735"}
      ]
    },
    "college theater": {
      "id": "4bf58dd8d48988d1ac941735",
      "has_children": false,
      "is_child": true,
      "parents": ["college & university"]
    },
    "community college": {
      "id": "4bf58dd8d48988d1a2941735",
      "has_children": false,
      "is_child": true,
      "parents": ["college & university"]
    },
    "fraternity house": {
      "id": "4bf58dd8d48988d1b0941735",
      "has_children": false,
      "is_child": true,
      "parents": ["college & university"]
    },
    "general college & university": {
      "id": "4bf58dd8d48988d1a8941735",
      "has_children": false,
      "is_child": true,
      "parents": ["college & university"]
    },
    "law school": {
      "id": "4bf58dd8d48988d1a6941735",
      "has_children": false,
      "is_child": true,
      "parents": ["college & university"]
    },
    "medical school": {
      "id": "4bf58dd8d48988d1b3941735",
      "has_children": false,
      "is_child": true,
      "parents": ["college & university"]
    },
    "sorority house": {
      "id": "4bf58dd8d48988d141941735",
      "has_children": false,
      "is_child": true,
      "parents": ["college & university"]
    },
    "student center": {
      "id": "4bf58dd8d48988d1ab941735",
      "has_children": false,
      "is_child": true,
      "parents": ["college & university"]
    },
    "trade school": {
      "id": "4bf58dd8d48988d1ad941735",
      "has_children": false,
      "is_child": true,
      "parents": ["college & university"]
    },
    "university": {
      "id": "4bf58dd8d48988d1ae941735",
      "has_children": false,
      "is_child": true,
      "parents": ["college & university"]
    },
    "event": {
      "id": "4d4b7105d754a06373d81259",
      "has_children": true,
      "is_child": false,
      "parents": [],
      "children": []
    },
    "christmas market": {
      "id": "52f2ab2ebcbc57f1066b8b3b",
      "has_children": false,
      "is_child": true,
      "parents": ["event"]
    },
    "conference": {
      "id": "5267e4d9e4b0ec79466e48c6",
      "has_children": false,
      "is_child": true,
      "parents": ["event"]
    },
    "convention": {
      "id": "5267e4d9e4b0ec79466e48c9",
      "has_children": false,
      "is_child": true,
      "parents": ["event"]
    },
    "festival": {
      "id": "5267e4d9e4b0ec79466e48c7",
      "has_children": false,
      "is_child": true,
      "parents": ["event"]
    },
    "line / queue": {
      "id": "58daa1558bbb0b01f18ec1fa",
      "has_children": false,
      "is_child": true,
      "parents": ["event"]
    },
    "music festival": {
      "id": "5267e4d9e4b0ec79466e48d1",
      "has_children": false,
      "is_child": true,
      "parents": ["event"]
    },
    "other event": {
      "id": "5267e4d9e4b0ec79466e48c8",
      "has_children": false,
      "is_child": true,
      "parents": ["event"]
    },
    "parade": {
      "id": "52741d85e4b0d5d1e3c6a6d9",
      "has_children": false,
      "is_child": true,
      "parents": ["event"]
    },
    "sporting event": {
      "id": "5bae9231bedf3950379f89c5",
      "has_children": false,
      "is_child": true,
      "parents": ["event"]
    },
    "stoop sale": {
      "id": "52f2ab2ebcbc57f1066b8b54",
      "has_children": false,
      "is_child": true,
      "parents": ["event"]
    },
    "street fair": {
      "id": "5267e4d8e4b0ec79466e48c5",
      "has_children": false,
      "is_child": true,
      "parents": ["event"]
    },
    "trade fair": {
      "id": "5bae9231bedf3950379f89c3",
      "has_children": false,
      "is_child": true,
      "parents": ["event"]
    },
    "food": {
      "id": "4d4b7105d754a06374d81259",
      "has_children": true,
      "is_child": false,
      "parents": [],
      "children": []
    },
    "afghan restaurant": {
      "id": "503288ae91d4c4b30a586d67",
      "has_children": false,
      "is_child": true,
      "parents": ["food"]
    },
    "african restaurant": {
      "id": "4bf58dd8d48988d1c8941735",
      "has_children": true,
      "is_child": true,
      "parents": ["food"],
      "children": [
        {"ethiopian restaurant": "4bf58dd8d48988d10a941735"},
        {"mauritian restaurant": "5f2c344a5b4c177b9a6dc011"}
      ]
    },
    "american restaurant": {
      "id": "4bf58dd8d48988d14e941735",
      "has_children": true,
      "is_child": true,
      "parents": ["food"],
      "children": [
        {"new american restaurant": "4bf58dd8d48988d157941735"}
      ]
    },
    "armenian restaurant": {
      "id": "5f2c2b7db6d05514c7044837",
      "has_children": false,
      "is_child": true,
      "parents": ["food"]
    },
    "asian restaurant": {
      "id": "4bf58dd8d48988d142941735",
      "has_children": true,
      "is_child": true,
      "parents": ["food"],
      "children": [
        {"burmese restaurant": "56aa371be4b08b9a8d573568"},
        {"cambodian restaurant": "52e81612bcbc57f1066b7a03"},
        {"chinese restaurant": "4bf58dd8d48988d145941735"},
        {"anhui restaurant": "52af3a5e3cf9994f4e043bea"},
        {"beijing restaurant": "52af3a723cf9994f4e043bec"},
        {"cantonese restaurant": "52af3a7c3cf9994f4e043bed"},
        {"cha chaan teng": "58daa1558bbb0b01f18ec1d3"},
        {"chinese aristocrat restaurant": "52af3a673cf9994f4e043beb"},
        {"chinese breakfast place": "52af3a903cf9994f4e043bee"},
        {"dim sum restaurant": "4bf58dd8d48988d1f5931735"},
        {"dongbei restaurant": "52af3a9f3cf9994f4e043bef"},
        {"fujian restaurant": "52af3aaa3cf9994f4e043bf0"},
        {"guizhou restaurant": "52af3ab53cf9994f4e043bf1"},
        {"hainan restaurant": "52af3abe3cf9994f4e043bf2"},
        {"hakka restaurant": "52af3ac83cf9994f4e043bf3"},
        {"henan restaurant": "52af3ad23cf9994f4e043bf4"},
        {"hong kong restaurant": "52af3add3cf9994f4e043bf5"},
        {"huaiyang restaurant": "52af3af23cf9994f4e043bf7"},
        {"hubei restaurant": "52af3ae63cf9994f4e043bf6"},
        {"hunan restaurant": "52af3afc3cf9994f4e043bf8"},
        {"imperial restaurant": "52af3b053cf9994f4e043bf9"},
        {"jiangsu restaurant": "52af3b213cf9994f4e043bfa"},
        {"jiangxi restaurant": "52af3b293cf9994f4e043bfb"},
        {"macanese restaurant": "52af3b343cf9994f4e043bfc"},
        {"manchu restaurant": "52af3b3b3cf9994f4e043bfd"},
        {"peking duck restaurant": "52af3b463cf9994f4e043bfe"},
        {"shaanxi restaurant": "52af3b633cf9994f4e043c01"},
        {"shandong restaurant": "52af3b513cf9994f4e043bff"},
        {"shanghai restaurant": "52af3b593cf9994f4e043c00"},
        {"shanxi restaurant": "52af3b6e3cf9994f4e043c02"},
        {"szechuan restaurant": "52af3b773cf9994f4e043c03"},
        {"taiwanese restaurant": "52af3b813cf9994f4e043c04"},
        {"tianjin restaurant": "52af3b893cf9994f4e043c05"},
        {"xinjiang restaurant": "52af3b913cf9994f4e043c06"},
        {"yunnan restaurant": "52af3b9a3cf9994f4e043c07"},
        {"zhejiang restaurant": "52af3ba23cf9994f4e043c08"},
        {"filipino restaurant": "4eb1bd1c3b7b55596b4a748f"},
        {"himalayan restaurant": "52e81612bcbc57f1066b79fb"},
        {"hotpot restaurant": "52af0bd33cf9994f4e043bdd"},
        {"indonesian restaurant": "4deefc054765f83613cdba6f"},
        {"acehnese restaurant": "52960eda3cf9994f4e043ac9"},
        {"balinese restaurant": "52960eda3cf9994f4e043acb"},
        {"betawinese restaurant": "52960eda3cf9994f4e043aca"},
        {"indonesian meatball place": "52960eda3cf9994f4e043acc"},
        {"javanese restaurant": "52960eda3cf9994f4e043ac7"},
        {"manadonese restaurant": "52960eda3cf9994f4e043ac8"},
        {"padangnese restaurant": "52960eda3cf9994f4e043ac5"},
        {"sundanese restaurant": "52960eda3cf9994f4e043ac6"},
        {"japanese restaurant": "4bf58dd8d48988d111941735"},
        {"donburi restaurant": "55a59bace4b013909087cb0c"},
        {"japanese curry restaurant": "55a59bace4b013909087cb30"},
        {"japanese family restaurant": "5f2c2436b6d05514c704433e"},
        {"kaiseki restaurant": "55a59bace4b013909087cb21"},
        {"kushikatsu restaurant": "55a59bace4b013909087cb06"},
        {"monjayaki restaurant": "55a59bace4b013909087cb1b"},
        {"nabe restaurant": "55a59bace4b013909087cb1e"},
        {"okonomiyaki restaurant": "55a59bace4b013909087cb18"},
        {"ramen restaurant": "55a59bace4b013909087cb24"},
        {"shabu-shabu restaurant": "55a59bace4b013909087cb15"},
        {"soba restaurant": "55a59bace4b013909087cb27"},
        {"sukiyaki restaurant": "55a59bace4b013909087cb12"},
        {"sushi restaurant": "4bf58dd8d48988d1d2941735"},
        {"takoyaki place": "55a59bace4b013909087cb2d"},
        {"teishoku restaurant": "5f2c239eb6d05514c70441ee"},
        {"tempura restaurant": "55a59a31e4b013909087cb00"},
        {"tonkatsu restaurant": "55a59af1e4b013909087cb03"},
        {"udon restaurant": "55a59bace4b013909087cb2a"},
        {"unagi restaurant": "55a59bace4b013909087cb0f"},
        {"wagashi place": "55a59bace4b013909087cb33"},
        {"yakitori restaurant": "55a59bace4b013909087cb09"},
        {"yoshoku restaurant": "55a59bace4b013909087cb36"},
        {"korean restaurant": "4bf58dd8d48988d113941735"},
        {"bossam/jokbal restaurant": "56aa371be4b08b9a8d5734e4"},
        {"bunsik restaurant": "56aa371be4b08b9a8d5734f0"},
        {"gukbap restaurant": "56aa371be4b08b9a8d5734e7"},
        {"janguh restaurant": "56aa371be4b08b9a8d5734ed"},
        {"korean bbq restaurant": "5f2c3f6b5b4c177b9a6dc388"},
        {"samgyetang restaurant": "56aa371be4b08b9a8d5734ea"},
        {"malay restaurant": "4bf58dd8d48988d156941735"},
        {"mamak restaurant": "5ae9595eb77c77002c2f9f26"},
        {"mongolian restaurant": "4eb1d5724b900d56c88a45fe"},
        {"noodle house": "4bf58dd8d48988d1d1941735"},
        {"satay restaurant": "56aa371be4b08b9a8d57350e"},
        {"singaporean restaurant": "5f2c430e5b4c177b9a6dcabd"},
        {"thai restaurant": "4bf58dd8d48988d149941735"},
        {"som tum restaurant": "56aa371be4b08b9a8d573502"},
        {"tibetan restaurant": "52af39fb3cf9994f4e043be9"},
        {"vietnamese restaurant": "4bf58dd8d48988d14a941735"}
      ]
    },
    "australian restaurant": {
      "id": "4bf58dd8d48988d169941735",
      "has_children": false,
      "is_child": true,
      "parents": ["food"]
    },
    "austrian restaurant": {
      "id": "52e81612bcbc57f1066b7a01",
      "has_children": false,
      "is_child": true,
      "parents": ["food"]
    },
    "bbq joint": {
      "id": "4bf58dd8d48988d1df931735",
      "has_children": false,
      "is_child": true,
      "parents": ["food"]
    },
    "bagel shop": {
      "id": "4bf58dd8d48988d179941735",
      "has_children": false,
      "is_child": true,
      "parents": ["food"]
    },
    "bakery": {
      "id": "4bf58dd8d48988d16a941735",
      "has_children": false,
      "is_child": true,
      "parents": ["food"]
    },
    "bangladeshi restaurant": {
      "id": "5e179ee74ae8e90006e9a746",
      "has_children": false,
      "is_child": true,
      "parents": ["food"]
    },
    "belgian restaurant": {
      "id": "52e81612bcbc57f1066b7a02",
      "has_children": false,
      "is_child": true,
      "parents": ["food"]
    },
    "bistro": {
      "id": "52e81612bcbc57f1066b79f1",
      "has_children": false,
      "is_child": true,
      "parents": ["food"]
    },
    "breakfast spot": {
      "id": "4bf58dd8d48988d143941735",
      "has_children": false,
      "is_child": true,
      "parents": ["food"]
    },
    "bubble tea shop": {
      "id": "52e81612bcbc57f1066b7a0c",
      "has_children": false,
      "is_child": true,
      "parents": ["food"]
    },
    "buffet": {
      "id": "52e81612bcbc57f1066b79f4",
      "has_children": false,
      "is_child": true,
      "parents": ["food"]
    },
    "burger joint": {
      "id": "4bf58dd8d48988d16c941735",
      "has_children": false,
      "is_child": true,
      "parents": ["food"]
    },
    "cafeteria": {
      "id": "4bf58dd8d48988d128941735",
      "has_children": false,
      "is_child": true,
      "parents": ["food"]
    },
    "café": {
      "id": "4bf58dd8d48988d16d941735",
      "has_children": false,
      "is_child": true,
      "parents": ["food"]
    },
    "cajun / creole restaurant": {
      "id": "4bf58dd8d48988d17a941735",
      "has_children": false,
      "is_child": true,
      "parents": ["food"]
    },
    "caribbean restaurant": {
      "id": "4bf58dd8d48988d144941735",
      "has_children": true,
      "is_child": true,
      "parents": ["food"],
      "children": [
        {"cuban restaurant": "4bf58dd8d48988d154941735"},
        {"puerto rican restaurant": "5f2c2abab6d05514c70446e4"}
      ]
    },
    "caucasian restaurant": {
      "id": "5293a7d53cf9994f4e043a45",
      "has_children": false,
      "is_child": true,
      "parents": ["food"]
    },
    "coffee shop": {
      "id": "4bf58dd8d48988d1e0931735",
      "has_children": false,
      "is_child": true,
      "parents": ["food"]
    },
    "comfort food restaurant": {
      "id": "52e81612bcbc57f1066b7a00",
      "has_children": false,
      "is_child": true,
      "parents": ["food"]
    },
    "creperie": {
      "id": "52e81612bcbc57f1066b79f2",
      "has_children": false,
      "is_child": true,
      "parents": ["food"]
    },
    "czech restaurant": {
      "id": "52f2ae52bcbc57f1066b8b81",
      "has_children": false,
      "is_child": true,
      "parents": ["food"]
    },
    "deli / bodega": {
      "id": "4bf58dd8d48988d146941735",
      "has_children": false,
      "is_child": true,
      "parents": ["food"]
    },
    "dessert shop": {
      "id": "4bf58dd8d48988d1d0941735",
      "has_children": true,
      "is_child": true,
      "parents": ["food"],
      "children": [
        {"cupcake shop": "4bf58dd8d48988d1bc941735"},
        {"frozen yogurt shop": "512e7cae91d4cbb4e5efe0af"},
        {"gelato shop": "5f2c407c5b4c177b9a6dc536"},
        {"ice cream shop": "4bf58dd8d48988d1c9941735"},
        {"pastry shop": "5744ccdfe4b0c0459246b4e2"},
        {"pie shop": "52e81612bcbc57f1066b7a0a"}
      ]
    },
    "diner": {
      "id": "4bf58dd8d48988d147941735",
      "has_children": false,
      "is_child": true,
      "parents": ["food"]
    },
    "donut shop": {
      "id": "4bf58dd8d48988d148941735",
      "has_children": false,
      "is_child": true,
      "parents": ["food"]
    },
    "dumpling restaurant": {
      "id": "4bf58dd8d48988d108941735",
      "has_children": false,
      "is_child": true,
      "parents": ["food"]
    },
    "dutch restaurant": {
      "id": "5744ccdfe4b0c0459246b4d0",
      "has_children": false,
      "is_child": true,
      "parents": ["food"]
    },
    "eastern european restaurant": {
      "id": "4bf58dd8d48988d109941735",
      "has_children": true,
      "is_child": true,
      "parents": ["food"],
      "children": [
        {"belarusian restaurant": "52e928d0bcbc57f1066b7e97"},
        {"bosnian restaurant": "58daa1558bbb0b01f18ec1ee"},
        {"bulgarian restaurant": "56aa371be4b08b9a8d5734f3"},
        {"romanian restaurant": "52960bac3cf9994f4e043ac4"},
        {"tatar restaurant": "52e928d0bcbc57f1066b7e98"}
      ]
    },
    "english restaurant": {
      "id": "52e81612bcbc57f1066b7a05",
      "has_children": false,
      "is_child": true,
      "parents": ["food"]
    },
    "falafel restaurant": {
      "id": "4bf58dd8d48988d10b941735",
      "has_children": false,
      "is_child": true,
      "parents": ["food"]
    },
    "fast food restaurant": {
      "id": "4bf58dd8d48988d16e941735",
      "has_children": false,
      "is_child": true,
      "parents": ["food"]
    },
    "fish & chips shop": {
      "id": "4edd64a0c7ddd24ca188df1a",
      "has_children": false,
      "is_child": true,
      "parents": ["food"]
    },
    "fondue restaurant": {
      "id": "52e81612bcbc57f1066b7a09",
      "has_children": false,
      "is_child": true,
      "parents": ["food"]
    },
    "food court": {
      "id": "4bf58dd8d48988d120951735",
      "has_children": false,
      "is_child": true,
      "parents": ["food"]
    },
    "food stand": {
      "id": "56aa371be4b08b9a8d57350b",
      "has_children": false,
      "is_child": true,
      "parents": ["food"]
    },
    "food truck": {
      "id": "4bf58dd8d48988d1cb941735",
      "has_children": false,
      "is_child": true,
      "parents": ["food"]
    },
    "french restaurant": {
      "id": "4bf58dd8d48988d10c941735",
      "has_children": true,
      "is_child": true,
      "parents": ["food"],
      "children": [
        {"alsatian restaurant": "57558b36e4b065ecebd306b6"},
        {"auvergne restaurant": "57558b36e4b065ecebd306b8"},
        {"basque restaurant": "57558b36e4b065ecebd306bc"},
        {"brasserie": "57558b36e4b065ecebd306b0"},
        {"breton restaurant": "57558b36e4b065ecebd306c5"},
        {"burgundian restaurant": "57558b36e4b065ecebd306c0"},
        {"catalan restaurant": "57558b36e4b065ecebd306cb"},
        {"ch'ti restaurant": "57558b36e4b065ecebd306ce"},
        {"corsican restaurant": "57558b36e4b065ecebd306d1"},
        {"estaminet": "57558b36e4b065ecebd306b4"},
        {"labour canteen": "57558b36e4b065ecebd306b2"},
        {"lyonese bouchon": "57558b35e4b065ecebd306ad"},
        {"norman restaurant": "57558b36e4b065ecebd306d4"},
        {"provençal restaurant": "57558b36e4b065ecebd306d7"},
        {"savoyard restaurant": "57558b36e4b065ecebd306da"},
        {"southwestern french restaurant": "57558b36e4b065ecebd306ba"}
      ]
    },
    "fried chicken joint": {
      "id": "4d4ae6fc7a7b7dea34424761",
      "has_children": false,
      "is_child": true,
      "parents": ["food"]
    },
    "friterie": {
      "id": "55d25775498e9f6a0816a37a",
      "has_children": false,
      "is_child": true,
      "parents": ["food"]
    },
    "gastropub": {
      "id": "4bf58dd8d48988d155941735",
      "has_children": false,
      "is_child": true,
      "parents": ["food"]
    },
    "german restaurant": {
      "id": "4bf58dd8d48988d10d941735",
      "has_children": true,
      "is_child": true,
      "parents": ["food"],
      "children": [
        {"apple wine pub": "56aa371ce4b08b9a8d573583"},
        {"bavarian restaurant": "56aa371ce4b08b9a8d573572"},
        {"bratwurst joint": "56aa371ce4b08b9a8d57358e"},
        {"currywurst joint": "56aa371ce4b08b9a8d57358b"},
        {"franconian restaurant": "56aa371ce4b08b9a8d573574"},
        {"german pop-up restaurant": "56aa371ce4b08b9a8d573592"},
        {"palatine restaurant": "56aa371ce4b08b9a8d573578"},
        {"rhenisch restaurant": "56aa371ce4b08b9a8d57357b"},
        {"schnitzel restaurant": "56aa371ce4b08b9a8d573587"},
        {"silesian restaurant": "56aa371ce4b08b9a8d57357f"},
        {"swabian restaurant": "56aa371ce4b08b9a8d573576"}
      ]
    },
    "gluten-free restaurant": {
      "id": "4c2cd86ed066bed06c3c5209",
      "has_children": false,
      "is_child": true,
      "parents": ["food"]
    },
    "greek restaurant": {
      "id": "4bf58dd8d48988d10e941735",
      "has_children": true,
      "is_child": true,
      "parents": ["food"],
      "children": [
        {"bougatsa shop": "53d6c1b0e4b02351e88a83e8"},
        {"cretan restaurant": "53d6c1b0e4b02351e88a83e2"},
        {"fish taverna": "53d6c1b0e4b02351e88a83d8"},
        {"grilled meat restaurant": "53d6c1b0e4b02351e88a83d6"},
        {"kafenio": "53d6c1b0e4b02351e88a83e6"},
        {"magirio": "53d6c1b0e4b02351e88a83e4"},
        {"meze restaurant": "53d6c1b0e4b02351e88a83da"},
        {"modern greek restaurant": "53d6c1b0e4b02351e88a83d4"},
        {"ouzeri": "53d6c1b0e4b02351e88a83dc"},
        {"patsa restaurant": "53d6c1b0e4b02351e88a83e0"},
        {"souvlaki shop": "52e81612bcbc57f1066b79f3"},
        {"taverna": "53d6c1b0e4b02351e88a83d2"},
        {"tsipouro restaurant": "53d6c1b0e4b02351e88a83de"}
      ]
    },
    "halal restaurant": {
      "id": "52e81612bcbc57f1066b79ff",
      "has_children": false,
      "is_child": true,
      "parents": ["food"]
    },
    "hawaiian restaurant": {
      "id": "52e81612bcbc57f1066b79fe",
      "has_children": true,
      "is_child": true,
      "parents": ["food"],
      "children": [
        {"poke place": "5bae9231bedf3950379f89d4"}
      ]
    },
    "hot dog joint": {
      "id": "4bf58dd8d48988d16f941735",
      "has_children": false,
      "is_child": true,
      "parents": ["food"]
    },
    "hungarian restaurant": {
      "id": "52e81612bcbc57f1066b79fa",
      "has_children": false,
      "is_child": true,
      "parents": ["food"]
    },
    "indian restaurant": {
      "id": "4bf58dd8d48988d10f941735",
      "has_children": true,
      "is_child": true,
      "parents": ["food"],
      "children": [
        {"andhra restaurant": "54135bf5e4b08f3d2429dfe5"},
        {"awadhi restaurant": "54135bf5e4b08f3d2429dff3"},
        {"bengali restaurant": "54135bf5e4b08f3d2429dff5"},
        {"chaat place": "54135bf5e4b08f3d2429dfe2"},
        {"chettinad restaurant": "54135bf5e4b08f3d2429dff2"},
        {"dhaba": "54135bf5e4b08f3d2429dfe1"},
        {"dosa place": "54135bf5e4b08f3d2429dfe3"},
        {"goan restaurant": "54135bf5e4b08f3d2429dfe8"},
        {"gujarati restaurant": "54135bf5e4b08f3d2429dfe9"},
        {"hyderabadi restaurant": "54135bf5e4b08f3d2429dfe6"},
        {"indian chinese restaurant": "54135bf5e4b08f3d2429dfdf"},
        {"indian sweet shop": "54135bf5e4b08f3d2429dfe4"},
        {"irani cafe": "54135bf5e4b08f3d2429dfe7"},
        {"jain restaurant": "54135bf5e4b08f3d2429dfea"},
        {"karnataka restaurant": "54135bf5e4b08f3d2429dfeb"},
        {"kerala restaurant": "54135bf5e4b08f3d2429dfed"},
        {"maharashtrian restaurant": "54135bf5e4b08f3d2429dfee"},
        {"mughlai restaurant": "54135bf5e4b08f3d2429dff4"},
        {"multicuisine indian restaurant": "54135bf5e4b08f3d2429dfe0"},
        {"north indian restaurant": "54135bf5e4b08f3d2429dfdd"},
        {"northeast indian restaurant": "54135bf5e4b08f3d2429dff6"},
        {"parsi restaurant": "54135bf5e4b08f3d2429dfef"},
        {"punjabi restaurant": "54135bf5e4b08f3d2429dff0"},
        {"rajasthani restaurant": "54135bf5e4b08f3d2429dff1"},
        {"south indian restaurant": "54135bf5e4b08f3d2429dfde"},
        {"udupi restaurant": "54135bf5e4b08f3d2429dfec"}
      ]
    },
    "irish pub": {
      "id": "52e81612bcbc57f1066b7a06",
      "has_children": false,
      "is_child": true,
      "parents": ["food"]
    },
    "italian restaurant": {
      "id": "4bf58dd8d48988d110941735",
      "has_children": true,
      "is_child": true,
      "parents": ["food"],
      "children": [
        {"abruzzo restaurant": "55a5a1ebe4b013909087cbb6"},
        {"agriturismo": "55a5a1ebe4b013909087cb7c"},
        {"aosta restaurant": "55a5a1ebe4b013909087cba7"},
        {"basilicata restaurant": "55a5a1ebe4b013909087cba1"},
        {"calabria restaurant": "55a5a1ebe4b013909087cba4"},
        {"campanian restaurant": "55a5a1ebe4b013909087cb95"},
        {"emilia restaurant": "55a5a1ebe4b013909087cb89"},
        {"friuli restaurant": "55a5a1ebe4b013909087cb9b"},
        {"ligurian restaurant": "55a5a1ebe4b013909087cb98"},
        {"lombard restaurant": "55a5a1ebe4b013909087cbbf"},
        {"malga": "55a5a1ebe4b013909087cb79"},
        {"marche restaurant": "55a5a1ebe4b013909087cbb0"},
        {"molise restaurant": "55a5a1ebe4b013909087cbb3"},
        {"piadineria": "55a5a1ebe4b013909087cb74"},
        {"piedmontese restaurant": "55a5a1ebe4b013909087cbaa"},
        {"puglia restaurant": "55a5a1ebe4b013909087cb83"},
        {"romagna restaurant": "55a5a1ebe4b013909087cb8c"},
        {"roman restaurant": "55a5a1ebe4b013909087cb92"},
        {"sardinian restaurant": "55a5a1ebe4b013909087cb8f"},
        {"sicilian restaurant": "55a5a1ebe4b013909087cb86"},
        {"south tyrolean restaurant": "55a5a1ebe4b013909087cbb9"},
        {"trattoria/osteria": "55a5a1ebe4b013909087cb7f"},
        {"trentino restaurant": "55a5a1ebe4b013909087cbbc"},
        {"tuscan restaurant": "55a5a1ebe4b013909087cb9e"},
        {"umbrian restaurant": "55a5a1ebe4b013909087cbc2"},
        {"veneto restaurant": "55a5a1ebe4b013909087cbad"}
      ]
    },
    "jewish restaurant": {
      "id": "52e81612bcbc57f1066b79fd",
      "has_children": true,
      "is_child": true,
      "parents": ["food"],
      "children": [
        {"kosher restaurant": "52e81612bcbc57f1066b79fc"}
      ]
    },
    "juice bar": {
      "id": "4bf58dd8d48988d112941735",
      "has_children": false,
      "is_child": true,
      "parents": ["food"]
    },
    "kebab restaurant": {
      "id": "5283c7b4e4b094cb91ec88d7",
      "has_children": false,
      "is_child": true,
      "parents": ["food"]
    },
    "latin american restaurant": {
      "id": "4bf58dd8d48988d1be941735",
      "has_children": true,
      "is_child": true,
      "parents": ["food"],
      "children": [
        {"arepa restaurant": "4bf58dd8d48988d152941735"},
        {"empanada restaurant": "52939a8c3cf9994f4e043a35"},
        {"honduran restaurant": "5f2c32587ff30c0d7ac09638"},
        {"salvadoran restaurant": "5745c7ac498e5d0483112fdb"},
        {"south american restaurant": "4bf58dd8d48988d1cd941735"},
        {"argentinian restaurant": "4bf58dd8d48988d107941735"},
        {"brazilian restaurant": "4bf58dd8d48988d16b941735"},
        {"acai house": "5294c7523cf9994f4e043a62"},
        {"baiano restaurant": "52939ae13cf9994f4e043a3b"},
        {"central brazilian restaurant": "52939a9e3cf9994f4e043a36"},
        {"churrascaria": "52939a643cf9994f4e043a33"},
        {"empada house": "5294c55c3cf9994f4e043a61"},
        {"goiano restaurant": "52939af83cf9994f4e043a3d"},
        {"mineiro restaurant": "52939aed3cf9994f4e043a3c"},
        {"northeastern brazilian restaurant": "52939aae3cf9994f4e043a37"},
        {"northern brazilian restaurant": "52939ab93cf9994f4e043a38"},
        {"pastelaria": "5294cbda3cf9994f4e043a63"},
        {"southeastern brazilian restaurant": "52939ac53cf9994f4e043a39"},
        {"southern brazilian restaurant": "52939ad03cf9994f4e043a3a"},
        {"tapiocaria": "52939a7d3cf9994f4e043a34"},
        {"colombian restaurant": "58daa1558bbb0b01f18ec1f4"},
        {"peruvian restaurant": "4eb1bfa43b7b52c0e1adc2e8"},
        {"peruvian roast chicken joint": "5f2c1c31b6d05514c704334c"},
        {"venezuelan restaurant": "56aa371be4b08b9a8d573558"}
      ]
    },
    "mac & cheese joint": {
      "id": "4bf58dd8d48988d1bf941735",
      "has_children": false,
      "is_child": true,
      "parents": ["food"]
    },
    "mediterranean restaurant": {
      "id": "4bf58dd8d48988d1c0941735",
      "has_children": true,
      "is_child": true,
      "parents": ["food"],
      "children": [
        {"moroccan restaurant": "4bf58dd8d48988d1c3941735"}
      ]
    },
    "mexican restaurant": {
      "id": "4bf58dd8d48988d1c1941735",
      "has_children": true,
      "is_child": true,
      "parents": ["food"],
      "children": [
        {"botanero": "58daa1558bbb0b01f18ec1d9"},
        {"burrito place": "4bf58dd8d48988d153941735"},
        {"taco place": "4bf58dd8d48988d151941735"},
        {"tex-mex restaurant": "56aa371ae4b08b9a8d5734ba"},
        {"yucatecan restaurant": "5744ccdfe4b0c0459246b4d3"}
      ]
    },
    "middle eastern restaurant": {
      "id": "4bf58dd8d48988d115941735",
      "has_children": true,
      "is_child": true,
      "parents": ["food"],
      "children": [
        {"egyptian restaurant": "5bae9231bedf3950379f89e1"},
        {"iraqi restaurant": "5bae9231bedf3950379f89e7"},
        {"israeli restaurant": "56aa371be4b08b9a8d573529"},
        {"kurdish restaurant": "5744ccdfe4b0c0459246b4ca"},
        {"lebanese restaurant": "58daa1558bbb0b01f18ec1cd"},
        {"persian restaurant": "52e81612bcbc57f1066b79f7"},
        {"ash and haleem place": "58daa1558bbb0b01f18ec1bc"},
        {"dizi place": "58daa1558bbb0b01f18ec1c0"},
        {"gilaki restaurant": "58daa1558bbb0b01f18ec1c4"},
        {"jegaraki": "58daa1558bbb0b01f18ec1c7"},
        {"tabbakhi": "5744ccdfe4b0c0459246b4a8"},
        {"shawarma place": "5bae9231bedf3950379f89e4"},
        {"syrian restaurant": "5bae9231bedf3950379f89da"},
        {"yemeni restaurant": "5bae9231bedf3950379f89ea"}
      ]
    },
    "modern european restaurant": {
      "id": "52e81612bcbc57f1066b79f9",
      "has_children": false,
      "is_child": true,
      "parents": ["food"]
    },
    "molecular gastronomy restaurant": {
      "id": "4bf58dd8d48988d1c2941735",
      "has_children": false,
      "is_child": true,
      "parents": ["food"]
    },
    "pakistani restaurant": {
      "id": "52e81612bcbc57f1066b79f8",
      "has_children": false,
      "is_child": true,
      "parents": ["food"]
    },
    "pet café": {
      "id": "56aa371be4b08b9a8d573508",
      "has_children": false,
      "is_child": true,
      "parents": ["food"]
    },
    "pizza place": {
      "id": "4bf58dd8d48988d1ca941735",
      "has_children": false,
      "is_child": true,
      "parents": ["food"]
    },
    "polish restaurant": {
      "id": "52e81612bcbc57f1066b7a04",
      "has_children": false,
      "is_child": true,
      "parents": ["food"]
    },
    "portuguese restaurant": {
      "id": "4def73e84765ae376e57713a",
      "has_children": false,
      "is_child": true,
      "parents": ["food"]
    },
    "poutine place": {
      "id": "56aa371be4b08b9a8d5734c7",
      "has_children": false,
      "is_child": true,
      "parents": ["food"]
    },
    "restaurant": {
      "id": "4bf58dd8d48988d1c4941735",
      "has_children": false,
      "is_child": true,
      "parents": ["food"]
    },
    "russian restaurant": {
      "id": "5293a7563cf9994f4e043a44",
      "has_children": true,
      "is_child": true,
      "parents": ["food"],
      "children": [
        {"blini house": "52e928d0bcbc57f1066b7e9d"},
        {"pelmeni house": "52e928d0bcbc57f1066b7e9c"}
      ]
    },
    "salad place": {
      "id": "4bf58dd8d48988d1bd941735",
      "has_children": false,
      "is_child": true,
      "parents": ["food"]
    },
    "sandwich place": {
      "id": "4bf58dd8d48988d1c5941735",
      "has_children": false,
      "is_child": true,
      "parents": ["food"]
    },
    "scandinavian restaurant": {
      "id": "4bf58dd8d48988d1c6941735",
      "has_children": false,
      "is_child": true,
      "parents": ["food"]
    },
    "scottish restaurant": {
      "id": "5744ccdde4b0c0459246b4a3",
      "has_children": false,
      "is_child": true,
      "parents": ["food"]
    },
    "seafood restaurant": {
      "id": "4bf58dd8d48988d1ce941735",
      "has_children": false,
      "is_child": true,
      "parents": ["food"]
    },
    "slovak restaurant": {
      "id": "56aa371be4b08b9a8d57355a",
      "has_children": false,
      "is_child": true,
      "parents": ["food"]
    },
    "snack place": {
      "id": "4bf58dd8d48988d1c7941735",
      "has_children": false,
      "is_child": true,
      "parents": ["food"]
    },
    "soup place": {
      "id": "4bf58dd8d48988d1dd931735",
      "has_children": false,
      "is_child": true,
      "parents": ["food"]
    },
    "southern / soul food restaurant": {
      "id": "4bf58dd8d48988d14f941735",
      "has_children": false,
      "is_child": true,
      "parents": ["food"]
    },
    "spanish restaurant": {
      "id": "4bf58dd8d48988d150941735",
      "has_children": true,
      "is_child": true,
      "parents": ["food"],
      "children": [
        {"paella restaurant": "4bf58dd8d48988d14d941735"},
        {"tapas restaurant": "4bf58dd8d48988d1db931735"}
      ]
    },
    "sri lankan restaurant": {
      "id": "5413605de4b0ae91d18581a9",
      "has_children": false,
      "is_child": true,
      "parents": ["food"]
    },
    "steakhouse": {
      "id": "4bf58dd8d48988d1cc941735",
      "has_children": false,
      "is_child": true,
      "parents": ["food"]
    },
    "swiss restaurant": {
      "id": "4bf58dd8d48988d158941735",
      "has_children": false,
      "is_child": true,
      "parents": ["food"]
    },
    "tea room": {
      "id": "4bf58dd8d48988d1dc931735",
      "has_children": false,
      "is_child": true,
      "parents": ["food"]
    },
    "theme restaurant": {
      "id": "56aa371be4b08b9a8d573538",
      "has_children": false,
      "is_child": true,
      "parents": ["food"]
    },
    "turkish restaurant": {
      "id": "4f04af1f2fb6e1c99f3db0bb",
      "has_children": true,
      "is_child": true,
      "parents": ["food"],
      "children": [
        {"borek place": "530faca9bcbc57f1066bc2f3"},
        {"cigkofte place": "530faca9bcbc57f1066bc2f4"},
        {"doner restaurant": "5283c7b4e4b094cb91ec88d8"},
        {"gozleme place": "5283c7b4e4b094cb91ec88d9"},
        {"kofte place": "5283c7b4e4b094cb91ec88db"},
        {"kokoreç restaurant": "5283c7b4e4b094cb91ec88d6"},
        {"kumpir restaurant": "56aa371be4b08b9a8d573535"},
        {"kumru restaurant": "56aa371be4b08b9a8d5734bd"},
        {"manti place": "5283c7b4e4b094cb91ec88d5"},
        {"meyhane": "5283c7b4e4b094cb91ec88da"},
        {"pide place": "530faca9bcbc57f1066bc2f2"},
        {"pilavcı": "58daa1558bbb0b01f18ec1df"},
        {"söğüş place": "58daa1558bbb0b01f18ec1dc"},
        {"tantuni restaurant": "56aa371be4b08b9a8d5734bf"},
        {"turkish coffeehouse": "56aa371be4b08b9a8d5734c1"},
        {"turkish home cooking restaurant": "5283c7b4e4b094cb91ec88d4"},
        {"çöp şiş place": "58daa1558bbb0b01f18ec1e2"}
      ]
    },
    "ukrainian restaurant": {
      "id": "52e928d0bcbc57f1066b7e96",
      "has_children": true,
      "is_child": true,
      "parents": ["food"],
      "children": [
        {"varenyky restaurant": "52e928d0bcbc57f1066b7e9a"},
        {"west-ukrainian restaurant": "52e928d0bcbc57f1066b7e9b"}
      ]
    },
    "vegetarian / vegan restaurant": {
      "id": "4bf58dd8d48988d1d3941735",
      "has_children": false,
      "is_child": true,
      "parents": ["food"]
    },
    "wings joint": {
      "id": "4bf58dd8d48988d14c941735",
      "has_children": false,
      "is_child": true,
      "parents": ["food"]
    },
    "nightlife spot": {
      "id": "4d4b7105d754a06376d81259",
      "has_children": true,
      "is_child": false,
      "parents": [],
      "children": []
    },
    "bar": {
      "id": "4bf58dd8d48988d116941735",
      "has_children": true,
      "is_child": true,
      "parents": ["nightlife spot"],
      "children": [
        {"beach bar": "52e81612bcbc57f1066b7a0d"},
        {"beer bar": "56aa371ce4b08b9a8d57356c"},
        {"beer garden": "4bf58dd8d48988d117941735"},
        {"champagne bar": "52e81612bcbc57f1066b7a0e"},
        {"cocktail bar": "4bf58dd8d48988d11e941735"},
        {"dive bar": "4bf58dd8d48988d118941735"},
        {"gay bar": "4bf58dd8d48988d1d8941735"},
        {"hookah bar": "4bf58dd8d48988d119941735"},
        {"hotel bar": "4bf58dd8d48988d1d5941735"},
        {"ice bar": "5f2c40f15b4c177b9a6dc684"},
        {"karaoke bar": "4bf58dd8d48988d120941735"},
        {"pub": "4bf58dd8d48988d11b941735"},
        {"rooftop bar": "5f2c224bb6d05514c70440a3"},
        {"sake bar": "4bf58dd8d48988d11c941735"},
        {"speakeasy": "4bf58dd8d48988d1d4941735"},
        {"sports bar": "4bf58dd8d48988d11d941735"},
        {"tiki bar": "56aa371be4b08b9a8d57354d"},
        {"whisky bar": "4bf58dd8d48988d122941735"},
        {"wine bar": "4bf58dd8d48988d123941735"}
      ]
    },
    "brewery": {
      "id": "50327c8591d4c4b30a586d5d",
      "has_children": false,
      "is_child": true,
      "parents": ["nightlife spot"]
    },
    "lounge": {
      "id": "4bf58dd8d48988d121941735",
      "has_children": false,
      "is_child": true,
      "parents": ["nightlife spot"]
    },
    "night market": {
      "id": "53e510b7498ebcb1801b55d4",
      "has_children": false,
      "is_child": true,
      "parents": ["nightlife spot"]
    },
    "nightclub": {
      "id": "4bf58dd8d48988d11f941735",
      "has_children": false,
      "is_child": true,
      "parents": ["nightlife spot"]
    },
    "other nightlife": {
      "id": "4bf58dd8d48988d11a941735",
      "has_children": false,
      "is_child": true,
      "parents": ["nightlife spot"]
    },
    "strip club": {
      "id": "4bf58dd8d48988d1d6941735",
      "has_children": false,
      "is_child": true,
      "parents": ["nightlife spot"]
    },
    "outdoors & recreation": {
      "id": "4d4b7105d754a06377d81259",
      "has_children": true,
      "is_child": false,
      "parents": [],
      "children": []
    },
    "athletics & sports": {
      "id": "4f4528bc4b90abdf24c9de85",
      "has_children": true,
      "is_child": true,
      "parents": ["outdoors & recreation"],
      "children": [
        {"badminton court": "52e81612bcbc57f1066b7a2b"},
        {"baseball field": "4bf58dd8d48988d1e8941735"},
        {"basketball court": "4bf58dd8d48988d1e1941735"},
        {"bowling green": "52e81612bcbc57f1066b7a2f"},
        {"curling ice": "56aa371be4b08b9a8d57351a"},
        {"golf course": "4bf58dd8d48988d1e6941735"},
        {"golf driving range": "58daa1558bbb0b01f18ec1b0"},
        {"gym / fitness center": "4bf58dd8d48988d175941735"},
        {"boxing gym": "52f2ab2ebcbc57f1066b8b47"},
        {"climbing gym": "503289d391d4c4b30a586d6a"},
        {"cycle studio": "52f2ab2ebcbc57f1066b8b49"},
        {"gym pool": "4bf58dd8d48988d105941735"},
        {"gymnastics gym": "52f2ab2ebcbc57f1066b8b48"},
        {"gym": "4bf58dd8d48988d176941735"},
        {"martial arts school": "4bf58dd8d48988d101941735"},
        {"outdoor gym": "58daa1558bbb0b01f18ec203"},
        {"pilates studio": "5744ccdfe4b0c0459246b4b2"},
        {"track": "4bf58dd8d48988d106941735"},
        {"weight loss center": "590a0744340a5803fd8508c3"},
        {"yoga studio": "4bf58dd8d48988d102941735"},
        {"hockey field": "4f452cd44b9081a197eba860"},
        {"hockey rink": "56aa371be4b08b9a8d57352c"},
        {"paintball field": "5032829591d4c4b30a586d5e"},
        {"rugby pitch": "52e81612bcbc57f1066b7a2c"},
        {"skate park": "4bf58dd8d48988d167941735"},
        {"skating rink": "4bf58dd8d48988d168941735"},
        {"soccer field": "4cce455aebf7b749d5e191f5"},
        {"sports club": "52e81612bcbc57f1066b7a2e"},
        {"squash court": "52e81612bcbc57f1066b7a2d"},
        {"tennis court": "4e39a956bd410d7aed40cbc3"},
        {"volleyball court": "4eb1bf013b7b6f98df247e07"}
      ]
    },
    "bathing area": {
      "id": "52e81612bcbc57f1066b7a28",
      "has_children": false,
      "is_child": true,
      "parents": ["outdoors & recreation"]
    },
    "bay": {
      "id": "56aa371be4b08b9a8d573544",
      "has_children": false,
      "is_child": true,
      "parents": ["outdoors & recreation"]
    },
    "beach": {
      "id": "4bf58dd8d48988d1e2941735",
      "has_children": true,
      "is_child": true,
      "parents": ["outdoors & recreation"],
      "children": [
        {"nudist beach": "52e81612bcbc57f1066b7a30"},
        {"surf spot": "4bf58dd8d48988d1e3941735"}
      ]
    },
    "bike trail": {
      "id": "56aa371be4b08b9a8d57355e",
      "has_children": false,
      "is_child": true,
      "parents": ["outdoors & recreation"]
    },
    "boat launch": {
      "id": "5fabfc8099ce226e27fe6b0d",
      "has_children": false,
      "is_child": true,
      "parents": ["outdoors & recreation"]
    },
    "botanical garden": {
      "id": "52e81612bcbc57f1066b7a22",
      "has_children": false,
      "is_child": true,
      "parents": ["outdoors & recreation"]
    },
    "bridge": {
      "id": "4bf58dd8d48988d1df941735",
      "has_children": false,
      "is_child": true,
      "parents": ["outdoors & recreation"]
    },
    "campground": {
      "id": "4bf58dd8d48988d1e4941735",
      "has_children": false,
      "is_child": true,
      "parents": ["outdoors & recreation"]
    },
    "canal lock": {
      "id": "56aa371be4b08b9a8d57353b",
      "has_children": false,
      "is_child": true,
      "parents": ["outdoors & recreation"]
    },
    "canal": {
      "id": "56aa371be4b08b9a8d573562",
      "has_children": false,
      "is_child": true,
      "parents": ["outdoors & recreation"]
    },
    "castle": {
      "id": "50aaa49e4b90af0d42d5de11",
      "has_children": false,
      "is_child": true,
      "parents": ["outdoors & recreation"]
    },
    "cave": {
      "id": "56aa371be4b08b9a8d573511",
      "has_children": false,
      "is_child": true,
      "parents": ["outdoors & recreation"]
    },
    "cemetery": {
      "id": "4bf58dd8d48988d15c941735",
      "has_children": false,
      "is_child": true,
      "parents": ["outdoors & recreation"]
    },
    "dam": {
      "id": "5fac018b99ce226e27fe7573",
      "has_children": false,
      "is_child": true,
      "parents": ["outdoors & recreation"]
    },
    "dive spot": {
      "id": "52e81612bcbc57f1066b7a12",
      "has_children": false,
      "is_child": true,
      "parents": ["outdoors & recreation"]
    },
    "dog run": {
      "id": "4bf58dd8d48988d1e5941735",
      "has_children": false,
      "is_child": true,
      "parents": ["outdoors & recreation"]
    },
    "farm": {
      "id": "4bf58dd8d48988d15b941735",
      "has_children": false,
      "is_child": true,
      "parents": ["outdoors & recreation"]
    },
    "field": {
      "id": "4bf58dd8d48988d15f941735",
      "has_children": false,
      "is_child": true,
      "parents": ["outdoors & recreation"]
    },
    "fishing spot": {
      "id": "52e81612bcbc57f1066b7a0f",
      "has_children": false,
      "is_child": true,
      "parents": ["outdoors & recreation"]
    },
    "forest": {
      "id": "52e81612bcbc57f1066b7a23",
      "has_children": false,
      "is_child": true,
      "parents": ["outdoors & recreation"]
    },
    "fountain": {
      "id": "56aa371be4b08b9a8d573547",
      "has_children": false,
      "is_child": true,
      "parents": ["outdoors & recreation"]
    },
    "garden": {
      "id": "4bf58dd8d48988d15a941735",
      "has_children": false,
      "is_child": true,
      "parents": ["outdoors & recreation"]
    },
    "gun range": {
      "id": "52e81612bcbc57f1066b7a11",
      "has_children": false,
      "is_child": true,
      "parents": ["outdoors & recreation"]
    },
    "harbor / marina": {
      "id": "4bf58dd8d48988d1e0941735",
      "has_children": false,
      "is_child": true,
      "parents": ["outdoors & recreation"]
    },
    "hill": {
      "id": "5bae9231bedf3950379f89cd",
      "has_children": false,
      "is_child": true,
      "parents": ["outdoors & recreation"]
    },
    "hot spring": {
      "id": "4bf58dd8d48988d160941735",
      "has_children": false,
      "is_child": true,
      "parents": ["outdoors & recreation"]
    },
    "indoor play area": {
      "id": "5744ccdfe4b0c0459246b4b5",
      "has_children": false,
      "is_child": true,
      "parents": ["outdoors & recreation"]
    },
    "island": {
      "id": "50aaa4314b90af0d42d5de10",
      "has_children": false,
      "is_child": true,
      "parents": ["outdoors & recreation"]
    },
    "lake": {
      "id": "4bf58dd8d48988d161941735",
      "has_children": false,
      "is_child": true,
      "parents": ["outdoors & recreation"]
    },
    "lighthouse": {
      "id": "4bf58dd8d48988d15d941735",
      "has_children": false,
      "is_child": true,
      "parents": ["outdoors & recreation"]
    },
    "mountain hut": {
      "id": "55a5a1ebe4b013909087cb77",
      "has_children": false,
      "is_child": true,
      "parents": ["outdoors & recreation"]
    },
    "mountain": {
      "id": "4eb1d4d54b900d56c88a45fc",
      "has_children": false,
      "is_child": true,
      "parents": ["outdoors & recreation"]
    },
    "national park": {
      "id": "52e81612bcbc57f1066b7a21",
      "has_children": false,
      "is_child": true,
      "parents": ["outdoors & recreation"]
    },
    "nature preserve": {
      "id": "52e81612bcbc57f1066b7a13",
      "has_children": false,
      "is_child": true,
      "parents": ["outdoors & recreation"]
    },
    "other great outdoors": {
      "id": "4bf58dd8d48988d162941735",
      "has_children": false,
      "is_child": true,
      "parents": ["outdoors & recreation"]
    },
    "palace": {
      "id": "52e81612bcbc57f1066b7a14",
      "has_children": false,
      "is_child": true,
      "parents": ["outdoors & recreation"]
    },
    "park": {
      "id": "4bf58dd8d48988d163941735",
      "has_children": false,
      "is_child": true,
      "parents": ["outdoors & recreation"]
    },
    "pedestrian plaza": {
      "id": "52e81612bcbc57f1066b7a25",
      "has_children": false,
      "is_child": true,
      "parents": ["outdoors & recreation"]
    },
    "picnic area": {
      "id": "5fabfe3599ce226e27fe709a",
      "has_children": false,
      "is_child": true,
      "parents": ["outdoors & recreation"]
    },
    "picnic shelter": {
      "id": "5fac010d99ce226e27fe7467",
      "has_children": false,
      "is_child": true,
      "parents": ["outdoors & recreation"]
    },
    "playground": {
      "id": "4bf58dd8d48988d1e7941735",
      "has_children": false,
      "is_child": true,
      "parents": ["outdoors & recreation"]
    },
    "plaza": {
      "id": "4bf58dd8d48988d164941735",
      "has_children": false,
      "is_child": true,
      "parents": ["outdoors & recreation"]
    },
    "pool": {
      "id": "4bf58dd8d48988d15e941735",
      "has_children": false,
      "is_child": true,
      "parents": ["outdoors & recreation"]
    },
    "rafting": {
      "id": "52e81612bcbc57f1066b7a29",
      "has_children": false,
      "is_child": true,
      "parents": ["outdoors & recreation"]
    },
    "recreation center": {
      "id": "52e81612bcbc57f1066b7a26",
      "has_children": false,
      "is_child": true,
      "parents": ["outdoors & recreation"]
    },
    "reservoir": {
      "id": "56aa371be4b08b9a8d573541",
      "has_children": false,
      "is_child": true,
      "parents": ["outdoors & recreation"]
    },
    "river": {
      "id": "4eb1d4dd4b900d56c88a45fd",
      "has_children": false,
      "is_child": true,
      "parents": ["outdoors & recreation"]
    },
    "rock climbing spot": {
      "id": "50328a4b91d4c4b30a586d6b",
      "has_children": false,
      "is_child": true,
      "parents": ["outdoors & recreation"]
    },
    "roof deck": {
      "id": "4bf58dd8d48988d133951735",
      "has_children": false,
      "is_child": true,
      "parents": ["outdoors & recreation"]
    },
    "scenic lookout": {
      "id": "4bf58dd8d48988d165941735",
      "has_children": false,
      "is_child": true,
      "parents": ["outdoors & recreation"]
    },
    "sculpture garden": {
      "id": "4bf58dd8d48988d166941735",
      "has_children": false,
      "is_child": true,
      "parents": ["outdoors & recreation"]
    },
    "ski area": {
      "id": "4bf58dd8d48988d1e9941735",
      "has_children": true,
      "is_child": true,
      "parents": ["outdoors & recreation"],
      "children": [
        {"apres ski bar": "4bf58dd8d48988d1ea941735"},
        {"ski chairlift": "4eb1c0ed3b7b52c0e1adc2ea"},
        {"ski chalet": "4bf58dd8d48988d1ec941735"},
        {"ski lodge": "4bf58dd8d48988d1eb941735"},
        {"ski trail": "4eb1c0f63b7b52c0e1adc2eb"}
      ]
    },
    "skydiving drop zone": {
      "id": "58daa1558bbb0b01f18ec1b9",
      "has_children": false,
      "is_child": true,
      "parents": ["outdoors & recreation"]
    },
    "stables": {
      "id": "4eb1baf03b7b2c5b1d4306ca",
      "has_children": false,
      "is_child": true,
      "parents": ["outdoors & recreation"]
    },
    "state / provincial park": {
      "id": "5bae9231bedf3950379f89d0",
      "has_children": false,
      "is_child": true,
      "parents": ["outdoors & recreation"]
    },
    "states & municipalities": {
      "id": "530e33ccbcbc57f1066bbfe4",
      "has_children": true,
      "is_child": true,
      "parents": ["outdoors & recreation"],
      "children": [
        {"city": "50aa9e094b90af0d42d5de0d"},
        {"county": "5345731ebcbc57f1066c39b2"},
        {"country": "530e33ccbcbc57f1066bbff7"},
        {"neighborhood": "4f2a25ac4b909258e854f55f"},
        {"state": "530e33ccbcbc57f1066bbff8"},
        {"town": "530e33ccbcbc57f1066bbff3"},
        {"village": "530e33ccbcbc57f1066bbff9"}
      ]
    },
    "summer camp": {
      "id": "52e81612bcbc57f1066b7a10",
      "has_children": false,
      "is_child": true,
      "parents": ["outdoors & recreation"]
    },
    "trail": {
      "id": "4bf58dd8d48988d159941735",
      "has_children": false,
      "is_child": true,
      "parents": ["outdoors & recreation"]
    },
    "tree": {
      "id": "52e81612bcbc57f1066b7a24",
      "has_children": false,
      "is_child": true,
      "parents": ["outdoors & recreation"]
    },
    "vineyard": {
      "id": "4bf58dd8d48988d1de941735",
      "has_children": false,
      "is_child": true,
      "parents": ["outdoors & recreation"]
    },
    "volcano": {
      "id": "5032848691d4c4b30a586d61",
      "has_children": false,
      "is_child": true,
      "parents": ["outdoors & recreation"]
    },
    "waterfall": {
      "id": "56aa371be4b08b9a8d573560",
      "has_children": false,
      "is_child": true,
      "parents": ["outdoors & recreation"]
    },
    "waterfront": {
      "id": "56aa371be4b08b9a8d5734c3",
      "has_children": false,
      "is_child": true,
      "parents": ["outdoors & recreation"]
    },
    "well": {
      "id": "4fbc1be21983fc883593e321",
      "has_children": false,
      "is_child": true,
      "parents": ["outdoors & recreation"]
    },
    "windmill": {
      "id": "5bae9231bedf3950379f89c7",
      "has_children": false,
      "is_child": true,
      "parents": ["outdoors & recreation"]
    },
    "professional & other places": {
      "id": "4d4b7105d754a06375d81259",
      "has_children": true,
      "is_child": false,
      "parents": [],
      "children": []
    },
    "animal shelter": {
      "id": "4e52d2d203646f7c19daa8ae",
      "has_children": false,
      "is_child": true,
      "parents": ["professional & other places"]
    },
    "architecture firm": {
      "id": "5fac002599ce226e27fe72e5",
      "has_children": false,
      "is_child": true,
      "parents": ["professional & other places"]
    },
    "art studio": {
      "id": "58daa1558bbb0b01f18ec1d6",
      "has_children": false,
      "is_child": true,
      "parents": ["professional & other places"]
    },
    "auditorium": {
      "id": "4bf58dd8d48988d173941735",
      "has_children": false,
      "is_child": true,
      "parents": ["professional & other places"]
    },
    "ballroom": {
      "id": "56aa371be4b08b9a8d5734cf",
      "has_children": false,
      "is_child": true,
      "parents": ["professional & other places"]
    },
    "building": {
      "id": "4bf58dd8d48988d130941735",
      "has_children": false,
      "is_child": true,
      "parents": ["professional & other places"]
    },
    "business center": {
      "id": "56aa371be4b08b9a8d573517",
      "has_children": false,
      "is_child": true,
      "parents": ["professional & other places"]
    },
    "cidery": {
      "id": "5e189fd6eee47d000759bbfd",
      "has_children": false,
      "is_child": true,
      "parents": ["professional & other places"]
    },
    "club house": {
      "id": "52e81612bcbc57f1066b7a35",
      "has_children": false,
      "is_child": true,
      "parents": ["professional & other places"]
    },
    "community center": {
      "id": "52e81612bcbc57f1066b7a34",
      "has_children": false,
      "is_child": true,
      "parents": ["professional & other places"]
    },
    "convention center": {
      "id": "4bf58dd8d48988d1ff931735",
      "has_children": true,
      "is_child": true,
      "parents": ["professional & other places"],
      "children": [
        {"meeting room": "4bf58dd8d48988d100941735"}
      ]
    },
    "cultural center": {
      "id": "52e81612bcbc57f1066b7a32",
      "has_children": false,
      "is_child": true,
      "parents": ["professional & other places"]
    },
    "distillery": {
      "id": "4e0e22f5a56208c4ea9a85a0",
      "has_children": false,
      "is_child": true,
      "parents": ["professional & other places"]
    },
    "distribution center": {
      "id": "52e81612bcbc57f1066b7a37",
      "has_children": false,
      "is_child": true,
      "parents": ["professional & other places"]
    },
    "event space": {
      "id": "4bf58dd8d48988d171941735",
      "has_children": true,
      "is_child": true,
      "parents": ["professional & other places"],
      "children": [
        {"outdoor event space": "56aa371be4b08b9a8d57356a"}
      ]
    },
    "factory": {
      "id": "4eb1bea83b7b6f98df247e06",
      "has_children": false,
      "is_child": true,
      "parents": ["professional & other places"]
    },
    "fair": {
      "id": "4eb1daf44b900d56c88a4600",
      "has_children": false,
      "is_child": true,
      "parents": ["professional & other places"]
    },
    "funeral home": {
      "id": "4f4534884b9074f6e4fb0174",
      "has_children": false,
      "is_child": true,
      "parents": ["professional & other places"]
    },
    "government building": {
      "id": "4bf58dd8d48988d126941735",
      "has_children": true,
      "is_child": true,
      "parents": ["professional & other places"],
      "children": [
        {"capitol building": "4bf58dd8d48988d12a941735"},
        {"city hall": "4bf58dd8d48988d129941735"},
        {"courthouse": "4bf58dd8d48988d12b941735"},
        {"embassy / consulate": "4bf58dd8d48988d12c951735"},
        {"fire station": "4bf58dd8d48988d12c941735"},
        {"monument / landmark": "4bf58dd8d48988d12d941735"},
        {"police station": "4bf58dd8d48988d12e941735"},
        {"town hall": "52e81612bcbc57f1066b7a38"}
      ]
    },
    "industrial estate": {
      "id": "56aa371be4b08b9a8d5734d7",
      "has_children": false,
      "is_child": true,
      "parents": ["professional & other places"]
    },
    "library": {
      "id": "4bf58dd8d48988d12f941735",
      "has_children": false,
      "is_child": true,
      "parents": ["professional & other places"]
    },
    "meadery": {
      "id": "5e189d71eee47d000759b7e2",
      "has_children": false,
      "is_child": true,
      "parents": ["professional & other places"]
    },
    "medical center": {
      "id": "4bf58dd8d48988d104941735",
      "has_children": true,
      "is_child": true,
      "parents": ["professional & other places"],
      "children": [
        {"acupuncturist": "52e81612bcbc57f1066b7a3b"},
        {"alternative healer": "52e81612bcbc57f1066b7a3c"},
        {"blood donation center": "5f2c43a65b4c177b9a6dcc62"},
        {"chiropractor": "52e81612bcbc57f1066b7a3a"},
        {"dentist's office": "4bf58dd8d48988d178941735"},
        {"doctor's office": "4bf58dd8d48988d177941735"},
        {"emergency room": "4bf58dd8d48988d194941735"},
        {"eye doctor": "522e32fae4b09b556e370f19"},
        {"hospice": "5f2c5b8b5b4c177b9a6ddf0b"},
        {"hospital": "4bf58dd8d48988d196941735"},
        {"hospital ward": "58daa1558bbb0b01f18ec1f7"},
        {"maternity clinic": "56aa371be4b08b9a8d5734ff"},
        {"medical lab": "4f4531b14b9074f6e4fb0103"},
        {"mental health office": "52e81612bcbc57f1066b7a39"},
        {"nutritionist": "58daa1558bbb0b01f18ec1d0"},
        {"physical therapist": "5744ccdfe4b0c0459246b4af"},
        {"rehab center": "56aa371be4b08b9a8d57351d"},
        {"urgent care center": "56aa371be4b08b9a8d573526"},
        {"veterinarian": "4d954af4a243a5684765b473"}
      ]
    },
    "military base": {
      "id": "4e52adeebd41615f56317744",
      "has_children": false,
      "is_child": true,
      "parents": ["professional & other places"]
    },
    "non-profit": {
      "id": "50328a8e91d4c4b30a586d6c",
      "has_children": false,
      "is_child": true,
      "parents": ["professional & other places"]
    },
    "observatory": {
      "id": "5744ccdfe4b0c0459246b4d9",
      "has_children": false,
      "is_child": true,
      "parents": ["professional & other places"]
    },
    "office": {
      "id": "4bf58dd8d48988d124941735",
      "has_children": true,
      "is_child": true,
      "parents": ["professional & other places"],
      "children": [
        {"advertising agency": "52e81612bcbc57f1066b7a3d"},
        {"campaign office": "5032764e91d4c4b30a586d5a"},
        {"conference room": "4bf58dd8d48988d127941735"},
        {"corporate amenity": "5665ef1d498ec706735f0e59"},
        {"corporate cafeteria": "54f4ba06498e2cf5561da814"},
        {"corporate coffee shop": "5665c7b9498e7d8a4f2c0f06"},
        {"coworking space": "4bf58dd8d48988d174941735"},
        {"tech startup": "4bf58dd8d48988d125941735"}
      ]
    },
    "parking": {
      "id": "4c38df4de52ce0d596b336e1",
      "has_children": false,
      "is_child": true,
      "parents": ["professional & other places"]
    },
    "post office": {
      "id": "4bf58dd8d48988d172941735",
      "has_children": false,
      "is_child": true,
      "parents": ["professional & other places"]
    },
    "power plant": {
      "id": "58daa1548bbb0b01f18ec1a9",
      "has_children": false,
      "is_child": true,
      "parents": ["professional & other places"]
    },
    "prison": {
      "id": "5310b8e5bcbc57f1066bcbf1",
      "has_children": false,
      "is_child": true,
      "parents": ["professional & other places"]
    },
    "radio station": {
      "id": "5032856091d4c4b30a586d63",
      "has_children": false,
      "is_child": true,
      "parents": ["professional & other places"]
    },
    "recruiting agency": {
      "id": "52f2ab2ebcbc57f1066b8b57",
      "has_children": false,
      "is_child": true,
      "parents": ["professional & other places"]
    },
    "research laboratory": {
      "id": "5744ccdfe4b0c0459246b4d6",
      "has_children": false,
      "is_child": true,
      "parents": ["professional & other places"]
    },
    "research station": {
      "id": "58daa1558bbb0b01f18ec1b2",
      "has_children": false,
      "is_child": true,
      "parents": ["professional & other places"]
    },
    "school": {
      "id": "4bf58dd8d48988d13b941735",
      "has_children": true,
      "is_child": true,
      "parents": ["professional & other places"],
      "children": [
        {"adult education center": "56aa371ce4b08b9a8d573570"},
        {"circus school": "52e81612bcbc57f1066b7a43"},
        {"cooking school": "58daa1558bbb0b01f18ec200"},
        {"driving school": "52e81612bcbc57f1066b7a42"},
        {"elementary school": "4f4533804b9074f6e4fb0105"},
        {"flight school": "52e81612bcbc57f1066b7a49"},
        {"high school": "4bf58dd8d48988d13d941735"},
        {"language school": "52e81612bcbc57f1066b7a48"},
        {"middle school": "4f4533814b9074f6e4fb0106"},
        {"music school": "4f04b10d2fb6e1c99f3db0be"},
        {"nursery school": "4f4533814b9074f6e4fb0107"},
        {"preschool": "52e81612bcbc57f1066b7a45"},
        {"private school": "52e81612bcbc57f1066b7a46"},
        {"religious school": "52e81612bcbc57f1066b7a47"},
        {"swim school": "52e81612bcbc57f1066b7a44"}
      ]
    },
    "social club": {
      "id": "52e81612bcbc57f1066b7a33",
      "has_children": true,
      "is_child": true,
      "parents": ["professional & other places"],
      "children": [
        {"veterans' organization": "5f2c5de85b4c177b9a6de29c"}
      ]
    },
    "spiritual center": {
      "id": "4bf58dd8d48988d131941735",
      "has_children": true,
      "is_child": true,
      "parents": ["professional & other places"],
      "children": [
        {"buddhist temple": "52e81612bcbc57f1066b7a3e"},
        {"cemevi": "58daa1558bbb0b01f18ec1eb"},
        {"church": "4bf58dd8d48988d132941735"},
        {"confucian temple": "56aa371be4b08b9a8d5734fc"},
        {"hindu temple": "52e81612bcbc57f1066b7a3f"},
        {"kingdom hall": "5744ccdfe4b0c0459246b4ac"},
        {"monastery": "52e81612bcbc57f1066b7a40"},
        {"mosque": "4bf58dd8d48988d138941735"},
        {"prayer room": "52e81612bcbc57f1066b7a41"},
        {"shrine": "4eb1d80a4b900d56c88a45ff"},
        {"sikh temple": "5bae9231bedf3950379f89c9"},
        {"synagogue": "4bf58dd8d48988d139941735"},
        {"temple": "4bf58dd8d48988d13a941735"},
        {"terreiro": "56aa371be4b08b9a8d5734f6"}
      ]
    },
    "tv station": {
      "id": "52e81612bcbc57f1066b7a31",
      "has_children": false,
      "is_child": true,
      "parents": ["professional & other places"]
    },
    "voting booth": {
      "id": "4cae28ecbf23941eb1190695",
      "has_children": false,
      "is_child": true,
      "parents": ["professional & other places"]
    },
    "warehouse": {
      "id": "52e81612bcbc57f1066b7a36",
      "has_children": false,
      "is_child": true,
      "parents": ["professional & other places"]
    },
    "waste facility": {
      "id": "58daa1558bbb0b01f18ec1ac",
      "has_children": false,
      "is_child": true,
      "parents": ["professional & other places"]
    },
    "wedding hall": {
      "id": "56aa371be4b08b9a8d5734c5",
      "has_children": false,
      "is_child": true,
      "parents": ["professional & other places"]
    },
    "winery": {
      "id": "4bf58dd8d48988d14b941735",
      "has_children": false,
      "is_child": true,
      "parents": ["professional & other places"]
    },
    "residence": {
      "id": "4e67e38e036454776db1fb3a",
      "has_children": true,
      "is_child": false,
      "parents": [],
      "children": []
    },
    "assisted living": {
      "id": "5032891291d4c4b30a586d68",
      "has_children": false,
      "is_child": true,
      "parents": ["residence"]
    },
    "home (private)": {
      "id": "4bf58dd8d48988d103941735",
      "has_children": false,
      "is_child": true,
      "parents": ["residence"]
    },
    "housing development": {
      "id": "4f2a210c4b9023bd5841ed28",
      "has_children": false,
      "is_child": true,
      "parents": ["residence"]
    },
    "residential building (apartment / condo)": {
      "id": "4d954b06a243a5684965b473",
      "has_children": false,
      "is_child": true,
      "parents": ["residence"]
    },
    "trailer park": {
      "id": "52f2ab2ebcbc57f1066b8b55",
      "has_children": false,
      "is_child": true,
      "parents": ["residence"]
    },
    "shop & service": {
      "id": "4d4b7105d754a06378d81259",
      "has_children": true,
      "is_child": false,
      "parents": [],
      "children": []
    },
    "atm": {
      "id": "52f2ab2ebcbc57f1066b8b56",
      "has_children": false,
      "is_child": true,
      "parents": ["shop & service"]
    },
    "adult boutique": {
      "id": "5267e446e4b0ec79466e48c4",
      "has_children": false,
      "is_child": true,
      "parents": ["shop & service"]
    },
    "antique shop": {
      "id": "4bf58dd8d48988d116951735",
      "has_children": false,
      "is_child": true,
      "parents": ["shop & service"]
    },
    "arts & crafts store": {
      "id": "4bf58dd8d48988d127951735",
      "has_children": false,
      "is_child": true,
      "parents": ["shop & service"]
    },
    "astrologer": {
      "id": "52f2ab2ebcbc57f1066b8b43",
      "has_children": false,
      "is_child": true,
      "parents": ["shop & service"]
    },
    "auto dealership": {
      "id": "4eb1c1623b7b52c0e1adc2ec",
      "has_children": true,
      "is_child": true,
      "parents": ["shop & service"],
      "children": [
        {"new auto dealership": "5e8f50bd03c7a9000c1e2fbc"},
        {"used auto dealership": "5e8f501a03c7a9000c1e2e88"}
      ]
    },
    "auto garage": {
      "id": "52f2ab2ebcbc57f1066b8b44",
      "has_children": false,
      "is_child": true,
      "parents": ["shop & service"]
    },
    "auto workshop": {
      "id": "56aa371be4b08b9a8d5734d3",
      "has_children": false,
      "is_child": true,
      "parents": ["shop & service"]
    },
    "automotive shop": {
      "id": "4bf58dd8d48988d124951735",
      "has_children": false,
      "is_child": true,
      "parents": ["shop & service"]
    },
    "baby store": {
      "id": "52f2ab2ebcbc57f1066b8b32",
      "has_children": false,
      "is_child": true,
      "parents": ["shop & service"]
    },
    "bank": {
      "id": "4bf58dd8d48988d10a951735",
      "has_children": false,
      "is_child": true,
      "parents": ["shop & service"]
    },
    "bath house": {
      "id": "52e81612bcbc57f1066b7a27",
      "has_children": false,
      "is_child": true,
      "parents": ["shop & service"]
    },
    "batik shop": {
      "id": "56aa371be4b08b9a8d5734cb",
      "has_children": false,
      "is_child": true,
      "parents": ["shop & service"]
    },
    "betting shop": {
      "id": "52f2ab2ebcbc57f1066b8b40",
      "has_children": false,
      "is_child": true,
      "parents": ["shop & service"]
    },
    "big box store": {
      "id": "52f2ab2ebcbc57f1066b8b42",
      "has_children": false,
      "is_child": true,
      "parents": ["shop & service"]
    },
    "bike shop": {
      "id": "4bf58dd8d48988d115951735",
      "has_children": false,
      "is_child": true,
      "parents": ["shop & service"]
    },
    "board shop": {
      "id": "4bf58dd8d48988d1f1941735",
      "has_children": false,
      "is_child": true,
      "parents": ["shop & service"]
    },
    "bookstore": {
      "id": "4bf58dd8d48988d114951735",
      "has_children": false,
      "is_child": true,
      "parents": ["shop & service"]
    },
    "bridal shop": {
      "id": "4bf58dd8d48988d11a951735",
      "has_children": false,
      "is_child": true,
      "parents": ["shop & service"]
    },
    "business service": {
      "id": "5453de49498eade8af355881",
      "has_children": false,
      "is_child": true,
      "parents": ["shop & service"]
    },
    "camera store": {
      "id": "4eb1bdf03b7b55596b4a7491",
      "has_children": false,
      "is_child": true,
      "parents": ["shop & service"]
    },
    "candy store": {
      "id": "4bf58dd8d48988d117951735",
      "has_children": false,
      "is_child": true,
      "parents": ["shop & service"]
    },
    "car wash": {
      "id": "4f04ae1f2fb6e1c99f3db0ba",
      "has_children": false,
      "is_child": true,
      "parents": ["shop & service"]
    },
    "carpet store": {
      "id": "52f2ab2ebcbc57f1066b8b2a",
      "has_children": false,
      "is_child": true,
      "parents": ["shop & service"]
    },
    "check cashing service": {
      "id": "52f2ab2ebcbc57f1066b8b2d",
      "has_children": false,
      "is_child": true,
      "parents": ["shop & service"]
    },
    "child care service": {
      "id": "5744ccdfe4b0c0459246b4c7",
      "has_children": true,
      "is_child": true,
      "parents": ["shop & service"],
      "children": [
        {"daycare": "4f4532974b9074f6e4fb0104"}
      ]
    },
    "chocolate shop": {
      "id": "52f2ab2ebcbc57f1066b8b31",
      "has_children": false,
      "is_child": true,
      "parents": ["shop & service"]
    },
    "clothing store": {
      "id": "4bf58dd8d48988d103951735",
      "has_children": true,
      "is_child": true,
      "parents": ["shop & service"],
      "children": [
        {"accessories store": "4bf58dd8d48988d102951735"},
        {"boutique": "4bf58dd8d48988d104951735"},
        {"kids store": "4bf58dd8d48988d105951735"},
        {"lingerie store": "4bf58dd8d48988d109951735"},
        {"men's store": "4bf58dd8d48988d106951735"},
        {"shoe store": "4bf58dd8d48988d107951735"},
        {"women's store": "4bf58dd8d48988d108951735"}
      ]
    },
    "comic shop": {
      "id": "52f2ab2ebcbc57f1066b8b18",
      "has_children": false,
      "is_child": true,
      "parents": ["shop & service"]
    },
    "construction & landscaping": {
      "id": "5454144b498ec1f095bff2f2",
      "has_children": false,
      "is_child": true,
      "parents": ["shop & service"]
    },
    "convenience store": {
      "id": "4d954b0ea243a5684a65b473",
      "has_children": false,
      "is_child": true,
      "parents": ["shop & service"]
    },
    "cosmetics shop": {
      "id": "4bf58dd8d48988d10c951735",
      "has_children": false,
      "is_child": true,
      "parents": ["shop & service"]
    },
    "costume shop": {
      "id": "52f2ab2ebcbc57f1066b8b17",
      "has_children": false,
      "is_child": true,
      "parents": ["shop & service"]
    },
    "credit union": {
      "id": "5032850891d4c4b30a586d62",
      "has_children": false,
      "is_child": true,
      "parents": ["shop & service"]
    },
    "currency exchange": {
      "id": "5744ccdfe4b0c0459246b4be",
      "has_children": false,
      "is_child": true,
      "parents": ["shop & service"]
    },
    "department store": {
      "id": "4bf58dd8d48988d1f6941735",
      "has_children": false,
      "is_child": true,
      "parents": ["shop & service"]
    },
    "design studio": {
      "id": "4bf58dd8d48988d1f4941735",
      "has_children": false,
      "is_child": true,
      "parents": ["shop & service"]
    },
    "discount store": {
      "id": "52dea92d3cf9994f4e043dbb",
      "has_children": false,
      "is_child": true,
      "parents": ["shop & service"]
    },
    "dive shop": {
      "id": "52f2ab2ebcbc57f1066b8b1a",
      "has_children": false,
      "is_child": true,
      "parents": ["shop & service"]
    },
    "drugstore": {
      "id": "5745c2e4498e11e7bccabdbd",
      "has_children": false,
      "is_child": true,
      "parents": ["shop & service"]
    },
    "dry cleaner": {
      "id": "52f2ab2ebcbc57f1066b8b1d",
      "has_children": false,
      "is_child": true,
      "parents": ["shop & service"]
    },
    "ev charging station": {
      "id": "5032872391d4c4b30a586d64",
      "has_children": false,
      "is_child": true,
      "parents": ["shop & service"]
    },
    "electronics store": {
      "id": "4bf58dd8d48988d122951735",
      "has_children": false,
      "is_child": true,
      "parents": ["shop & service"]
    },
    "entertainment service": {
      "id": "56aa371be4b08b9a8d573554",
      "has_children": false,
      "is_child": true,
      "parents": ["shop & service"]
    },
    "event service": {
      "id": "5454152e498ef71e2b9132c6",
      "has_children": false,
      "is_child": true,
      "parents": ["shop & service"]
    },
    "fabric shop": {
      "id": "52f2ab2ebcbc57f1066b8b26",
      "has_children": false,
      "is_child": true,
      "parents": ["shop & service"]
    },
    "film studio": {
      "id": "56aa371be4b08b9a8d573523",
      "has_children": false,
      "is_child": true,
      "parents": ["shop & service"]
    },
    "financial or legal service": {
      "id": "503287a291d4c4b30a586d65",
      "has_children": false,
      "is_child": true,
      "parents": ["shop & service"]
    },
    "fireworks store": {
      "id": "52f2ab2ebcbc57f1066b8b3a",
      "has_children": false,
      "is_child": true,
      "parents": ["shop & service"]
    },
    "fishing store": {
      "id": "52f2ab2ebcbc57f1066b8b16",
      "has_children": false,
      "is_child": true,
      "parents": ["shop & service"]
    },
    "flea market": {
      "id": "4bf58dd8d48988d1f7941735",
      "has_children": false,
      "is_child": true,
      "parents": ["shop & service"]
    },
    "floating market": {
      "id": "56aa371be4b08b9a8d573505",
      "has_children": false,
      "is_child": true,
      "parents": ["shop & service"]
    },
    "flower shop": {
      "id": "4bf58dd8d48988d11b951735",
      "has_children": false,
      "is_child": true,
      "parents": ["shop & service"]
    },
    "food & drink shop": {
      "id": "4bf58dd8d48988d1f9941735",
      "has_children": true,
      "is_child": true,
      "parents": ["shop & service"],
      "children": [
        {"beer store": "5370f356bcbc57f1066c94c2"},
        {"butcher": "4bf58dd8d48988d11d951735"},
        {"cheese shop": "4bf58dd8d48988d11e951735"},
        {"coffee roaster": "5e18993feee47d000759b256"},
        {"dairy store": "58daa1558bbb0b01f18ec1ca"},
        {"farmers market": "4bf58dd8d48988d1fa941735"},
        {"fish market": "4bf58dd8d48988d10e951735"},
        {"food service": "56aa371be4b08b9a8d573550"},
        {"gourmet shop": "4bf58dd8d48988d1f5941735"},
        {"grocery store": "4bf58dd8d48988d118951735"},
        {"health food store": "50aa9e744b90af0d42d5de0e"},
        {"imported food shop": "5f2c41945b4c177b9a6dc7d6"},
        {"kuruyemişçi": "58daa1558bbb0b01f18ec1e8"},
        {"liquor store": "4bf58dd8d48988d186941735"},
        {"organic grocery": "52f2ab2ebcbc57f1066b8b45"},
        {"sausage shop": "56aa371be4b08b9a8d573564"},
        {"street food gathering": "53e0feef498e5aac066fd8a9"},
        {"supermarket": "52f2ab2ebcbc57f1066b8b46"},
        {"turşucu": "58daa1558bbb0b01f18ec1e5"},
        {"wine shop": "4bf58dd8d48988d119951735"}
      ]
    },
    "frame store": {
      "id": "52f2ab2ebcbc57f1066b8b24",
      "has_children": false,
      "is_child": true,
      "parents": ["shop & service"]
    },
    "fruit & vegetable store": {
      "id": "52f2ab2ebcbc57f1066b8b1c",
      "has_children": false,
      "is_child": true,
      "parents": ["shop & service"]
    },
    "furniture / home store": {
      "id": "4bf58dd8d48988d1f8941735",
      "has_children": true,
      "is_child": true,
      "parents": ["shop & service"],
      "children": [
        {"lighting store": "55888a5a498e782e3303b43a"}
      ]
    },
    "gaming cafe": {
      "id": "4bf58dd8d48988d18d941735",
      "has_children": false,
      "is_child": true,
      "parents": ["shop & service"]
    },
    "garden center": {
      "id": "4eb1c0253b7b52c0e1adc2e9",
      "has_children": false,
      "is_child": true,
      "parents": ["shop & service"]
    },
    "gas station": {
      "id": "4bf58dd8d48988d113951735",
      "has_children": false,
      "is_child": true,
      "parents": ["shop & service"]
    },
    "gift shop": {
      "id": "4bf58dd8d48988d128951735",
      "has_children": false,
      "is_child": true,
      "parents": ["shop & service"]
    },
    "gun shop": {
      "id": "52f2ab2ebcbc57f1066b8b19",
      "has_children": false,
      "is_child": true,
      "parents": ["shop & service"]
    },
    "hardware store": {
      "id": "4bf58dd8d48988d112951735",
      "has_children": false,
      "is_child": true,
      "parents": ["shop & service"]
    },
    "health & beauty service": {
      "id": "54541900498ea6ccd0202697",
      "has_children": false,
      "is_child": true,
      "parents": ["shop & service"]
    },
    "herbs & spices store": {
      "id": "52f2ab2ebcbc57f1066b8b2c",
      "has_children": false,
      "is_child": true,
      "parents": ["shop & service"]
    },
    "hobby shop": {
      "id": "4bf58dd8d48988d1fb941735",
      "has_children": false,
      "is_child": true,
      "parents": ["shop & service"]
    },
    "home service": {
      "id": "545419b1498ea6ccd0202f58",
      "has_children": false,
      "is_child": true,
      "parents": ["shop & service"]
    },
    "hunting supply": {
      "id": "50aaa5234b90af0d42d5de12",
      "has_children": false,
      "is_child": true,
      "parents": ["shop & service"]
    },
    "it services": {
      "id": "52f2ab2ebcbc57f1066b8b36",
      "has_children": false,
      "is_child": true,
      "parents": ["shop & service"]
    },
    "insurance office": {
      "id": "58daa1558bbb0b01f18ec1f1",
      "has_children": false,
      "is_child": true,
      "parents": ["shop & service"]
    },
    "internet cafe": {
      "id": "4bf58dd8d48988d1f0941735",
      "has_children": false,
      "is_child": true,
      "parents": ["shop & service"]
    },
    "jewelry store": {
      "id": "4bf58dd8d48988d111951735",
      "has_children": false,
      "is_child": true,
      "parents": ["shop & service"]
    },
    "kitchen supply store": {
      "id": "58daa1558bbb0b01f18ec1b4",
      "has_children": false,
      "is_child": true,
      "parents": ["shop & service"]
    },
    "knitting store": {
      "id": "52f2ab2ebcbc57f1066b8b25",
      "has_children": false,
      "is_child": true,
      "parents": ["shop & service"]
    },
    "laundromat": {
      "id": "52f2ab2ebcbc57f1066b8b33",
      "has_children": false,
      "is_child": true,
      "parents": ["shop & service"]
    },
    "laundry service": {
      "id": "4bf58dd8d48988d1fc941735",
      "has_children": false,
      "is_child": true,
      "parents": ["shop & service"]
    },
    "lawyer": {
      "id": "52f2ab2ebcbc57f1066b8b3f",
      "has_children": false,
      "is_child": true,
      "parents": ["shop & service"]
    },
    "leather goods store": {
      "id": "52f2ab2ebcbc57f1066b8b2b",
      "has_children": false,
      "is_child": true,
      "parents": ["shop & service"]
    },
    "locksmith": {
      "id": "52f2ab2ebcbc57f1066b8b1e",
      "has_children": false,
      "is_child": true,
      "parents": ["shop & service"]
    },
    "lottery retailer": {
      "id": "52f2ab2ebcbc57f1066b8b38",
      "has_children": false,
      "is_child": true,
      "parents": ["shop & service"]
    },
    "luggage store": {
      "id": "52f2ab2ebcbc57f1066b8b29",
      "has_children": false,
      "is_child": true,
      "parents": ["shop & service"]
    },
    "marijuana dispensary": {
      "id": "52c71aaf3cf9994f4e043d17",
      "has_children": false,
      "is_child": true,
      "parents": ["shop & service"]
    },
    "market": {
      "id": "50be8ee891d4fa8dcc7199a7",
      "has_children": false,
      "is_child": true,
      "parents": ["shop & service"]
    },
    "massage studio": {
      "id": "52f2ab2ebcbc57f1066b8b3c",
      "has_children": false,
      "is_child": true,
      "parents": ["shop & service"]
    },
    "mattress store": {
      "id": "52f2ab2ebcbc57f1066b8b27",
      "has_children": false,
      "is_child": true,
      "parents": ["shop & service"]
    },
    "medical supply store": {
      "id": "58daa1558bbb0b01f18ec206",
      "has_children": false,
      "is_child": true,
      "parents": ["shop & service"]
    },
    "miscellaneous shop": {
      "id": "4bf58dd8d48988d1ff941735",
      "has_children": false,
      "is_child": true,
      "parents": ["shop & service"]
    },
    "mobile phone shop": {
      "id": "4f04afc02fb6e1c99f3db0bc",
      "has_children": false,
      "is_child": true,
      "parents": ["shop & service"]
    },
    "mobility store": {
      "id": "56aa371be4b08b9a8d57354a",
      "has_children": false,
      "is_child": true,
      "parents": ["shop & service"]
    },
    "motorcycle shop": {
      "id": "5032833091d4c4b30a586d60",
      "has_children": false,
      "is_child": true,
      "parents": ["shop & service"]
    },
    "motorsports shop": {
      "id": "59d79d6b2e268052fa2a3332",
      "has_children": false,
      "is_child": true,
      "parents": ["shop & service"]
    },
    "music store": {
      "id": "4bf58dd8d48988d1fe941735",
      "has_children": false,
      "is_child": true,
      "parents": ["shop & service"]
    },
    "nail salon": {
      "id": "4f04aa0c2fb6e1c99f3db0b8",
      "has_children": false,
      "is_child": true,
      "parents": ["shop & service"]
    },
    "newsagent": {
      "id": "5f2c5a295b4c177b9a6ddd0e",
      "has_children": false,
      "is_child": true,
      "parents": ["shop & service"]
    },
    "newsstand": {
      "id": "4f04ad622fb6e1c99f3db0b9",
      "has_children": false,
      "is_child": true,
      "parents": ["shop & service"]
    },
    "notary": {
      "id": "5ae95d208a6f17002ce792b2",
      "has_children": false,
      "is_child": true,
      "parents": ["shop & service"]
    },
    "optical shop": {
      "id": "4d954afda243a5684865b473",
      "has_children": false,
      "is_child": true,
      "parents": ["shop & service"]
    },
    "other repair shop": {
      "id": "52f2ab2ebcbc57f1066b8b2f",
      "has_children": false,
      "is_child": true,
      "parents": ["shop & service"]
    },
    "outdoor supply store": {
      "id": "52f2ab2ebcbc57f1066b8b22",
      "has_children": false,
      "is_child": true,
      "parents": ["shop & service"]
    },
    "outlet mall": {
      "id": "5744ccdfe4b0c0459246b4df",
      "has_children": false,
      "is_child": true,
      "parents": ["shop & service"]
    },
    "outlet store": {
      "id": "52f2ab2ebcbc57f1066b8b35",
      "has_children": false,
      "is_child": true,
      "parents": ["shop & service"]
    },
    "paper / office supplies store": {
      "id": "4bf58dd8d48988d121951735",
      "has_children": false,
      "is_child": true,
      "parents": ["shop & service"]
    },
    "pawn shop": {
      "id": "52f2ab2ebcbc57f1066b8b34",
      "has_children": false,
      "is_child": true,
      "parents": ["shop & service"]
    },
    "perfume shop": {
      "id": "52f2ab2ebcbc57f1066b8b23",
      "has_children": false,
      "is_child": true,
      "parents": ["shop & service"]
    },
    "pet service": {
      "id": "5032897c91d4c4b30a586d69",
      "has_children": false,
      "is_child": true,
      "parents": ["shop & service"]
    },
    "pet store": {
      "id": "4bf58dd8d48988d100951735",
      "has_children": false,
      "is_child": true,
      "parents": ["shop & service"]
    },
    "pharmacy": {
      "id": "4bf58dd8d48988d10f951735",
      "has_children": false,
      "is_child": true,
      "parents": ["shop & service"]
    },
    "photography lab": {
      "id": "4eb1bdde3b7b55596b4a7490",
      "has_children": false,
      "is_child": true,
      "parents": ["shop & service"]
    },
    "photography studio": {
      "id": "554a5e17498efabeda6cc559",
      "has_children": false,
      "is_child": true,
      "parents": ["shop & service"]
    },
    "piercing parlor": {
      "id": "52f2ab2ebcbc57f1066b8b20",
      "has_children": false,
      "is_child": true,
      "parents": ["shop & service"]
    },
    "pop-up shop": {
      "id": "52f2ab2ebcbc57f1066b8b3d",
      "has_children": false,
      "is_child": true,
      "parents": ["shop & service"]
    },
    "print shop": {
      "id": "52f2ab2ebcbc57f1066b8b28",
      "has_children": false,
      "is_child": true,
      "parents": ["shop & service"]
    },
    "public bathroom": {
      "id": "5744ccdfe4b0c0459246b4c4",
      "has_children": false,
      "is_child": true,
      "parents": ["shop & service"]
    },
    "real estate office": {
      "id": "5032885091d4c4b30a586d66",
      "has_children": false,
      "is_child": true,
      "parents": ["shop & service"]
    },
    "record shop": {
      "id": "4bf58dd8d48988d10d951735",
      "has_children": false,
      "is_child": true,
      "parents": ["shop & service"]
    },
    "recording studio": {
      "id": "52f2ab2ebcbc57f1066b8b37",
      "has_children": false,
      "is_child": true,
      "parents": ["shop & service"]
    },
    "recycling facility": {
      "id": "4f4531084b9074f6e4fb0101",
      "has_children": false,
      "is_child": true,
      "parents": ["shop & service"]
    },
    "rental service": {
      "id": "56aa371be4b08b9a8d573552",
      "has_children": false,
      "is_child": true,
      "parents": ["shop & service"]
    },
    "salon / barbershop": {
      "id": "4bf58dd8d48988d110951735",
      "has_children": false,
      "is_child": true,
      "parents": ["shop & service"]
    },
    "sauna / steam room": {
      "id": "58daa1558bbb0b01f18ec1ae",
      "has_children": false,
      "is_child": true,
      "parents": ["shop & service"]
    },
    "shipping store": {
      "id": "52f2ab2ebcbc57f1066b8b1f",
      "has_children": false,
      "is_child": true,
      "parents": ["shop & service"]
    },
    "shoe repair": {
      "id": "52f2ab2ebcbc57f1066b8b39",
      "has_children": false,
      "is_child": true,
      "parents": ["shop & service"]
    },
    "shopping mall": {
      "id": "4bf58dd8d48988d1fd941735",
      "has_children": false,
      "is_child": true,
      "parents": ["shop & service"]
    },
    "shopping plaza": {
      "id": "5744ccdfe4b0c0459246b4dc",
      "has_children": false,
      "is_child": true,
      "parents": ["shop & service"]
    },
    "skate shop": {
      "id": "5bae9231bedf3950379f89d2",
      "has_children": false,
      "is_child": true,
      "parents": ["shop & service"]
    },
    "ski shop": {
      "id": "56aa371be4b08b9a8d573566",
      "has_children": false,
      "is_child": true,
      "parents": ["shop & service"]
    },
    "smoke shop": {
      "id": "4bf58dd8d48988d123951735",
      "has_children": false,
      "is_child": true,
      "parents": ["shop & service"]
    },
    "smoothie shop": {
      "id": "52f2ab2ebcbc57f1066b8b41",
      "has_children": false,
      "is_child": true,
      "parents": ["shop & service"]
    },
    "souvenir shop": {
      "id": "52f2ab2ebcbc57f1066b8b1b",
      "has_children": false,
      "is_child": true,
      "parents": ["shop & service"]
    },
    "spa": {
      "id": "4bf58dd8d48988d1ed941735",
      "has_children": false,
      "is_child": true,
      "parents": ["shop & service"]
    },
    "sporting goods shop": {
      "id": "4bf58dd8d48988d1f2941735",
      "has_children": false,
      "is_child": true,
      "parents": ["shop & service"]
    },
    "stationery store": {
      "id": "52f2ab2ebcbc57f1066b8b21",
      "has_children": false,
      "is_child": true,
      "parents": ["shop & service"]
    },
    "storage facility": {
      "id": "4f04b1572fb6e1c99f3db0bf",
      "has_children": false,
      "is_child": true,
      "parents": ["shop & service"]
    },
    "supplement shop": {
      "id": "5744ccdfe4b0c0459246b4cd",
      "has_children": false,
      "is_child": true,
      "parents": ["shop & service"]
    },
    "tailor shop": {
      "id": "5032781d91d4c4b30a586d5b",
      "has_children": false,
      "is_child": true,
      "parents": ["shop & service"]
    },
    "tanning salon": {
      "id": "4d1cf8421a97d635ce361c31",
      "has_children": false,
      "is_child": true,
      "parents": ["shop & service"]
    },
    "tattoo parlor": {
      "id": "4bf58dd8d48988d1de931735",
      "has_children": false,
      "is_child": true,
      "parents": ["shop & service"]
    },
    "thrift / vintage store": {
      "id": "4bf58dd8d48988d101951735",
      "has_children": false,
      "is_child": true,
      "parents": ["shop & service"]
    },
    "toy / game store": {
      "id": "4bf58dd8d48988d1f3941735",
      "has_children": false,
      "is_child": true,
      "parents": ["shop & service"]
    },
    "travel agency": {
      "id": "4f04b08c2fb6e1c99f3db0bd",
      "has_children": false,
      "is_child": true,
      "parents": ["shop & service"]
    },
    "used bookstore": {
      "id": "52f2ab2ebcbc57f1066b8b30",
      "has_children": false,
      "is_child": true,
      "parents": ["shop & service"]
    },
    "vape store": {
      "id": "56aa371be4b08b9a8d57355c",
      "has_children": false,
      "is_child": true,
      "parents": ["shop & service"]
    },
    "vehicle inspection station": {
      "id": "5f2c1e0db6d05514c70436d4",
      "has_children": false,
      "is_child": true,
      "parents": ["shop & service"]
    },
    "video game store": {
      "id": "4bf58dd8d48988d10b951735",
      "has_children": false,
      "is_child": true,
      "parents": ["shop & service"]
    },
    "video store": {
      "id": "4bf58dd8d48988d126951735",
      "has_children": false,
      "is_child": true,
      "parents": ["shop & service"]
    },
    "warehouse store": {
      "id": "52e816a6bcbc57f1066b7a54",
      "has_children": false,
      "is_child": true,
      "parents": ["shop & service"]
    },
    "watch shop": {
      "id": "52f2ab2ebcbc57f1066b8b2e",
      "has_children": false,
      "is_child": true,
      "parents": ["shop & service"]
    },
    "travel & transport": {
      "id": "4d4b7105d754a06379d81259",
      "has_children": true,
      "is_child": false,
      "parents": [],
      "children": []
    },
    "airport": {
      "id": "4bf58dd8d48988d1ed931735",
      "has_children": true,
      "is_child": true,
      "parents": ["travel & transport"],
      "children": [
        {"airfield": "5f2c42335b4c177b9a6dc927"},
        {"airport food court": "4bf58dd8d48988d1ef931735"},
        {"airport gate": "4bf58dd8d48988d1f0931735"},
        {"airport lounge": "4eb1bc533b7b2c5b1d4306cb"},
        {"airport service": "56aa371be4b08b9a8d57352f"},
        {"airport terminal": "4bf58dd8d48988d1eb931735"},
        {"airport tram": "4bf58dd8d48988d1ec931735"},
        {"baggage claim": "5744ccdfe4b0c0459246b4e5"},
        {"plane": "4bf58dd8d48988d1f7931735"}
      ]
    },
    "baggage locker": {
      "id": "5744ccdfe4b0c0459246b4e8",
      "has_children": false,
      "is_child": true,
      "parents": ["travel & transport"]
    },
    "bike rental / bike share": {
      "id": "4e4c9077bd41f78e849722f9",
      "has_children": false,
      "is_child": true,
      "parents": ["travel & transport"]
    },
    "boat rental": {
      "id": "5744ccdfe4b0c0459246b4c1",
      "has_children": false,
      "is_child": true,
      "parents": ["travel & transport"]
    },
    "boat or ferry": {
      "id": "4bf58dd8d48988d12d951735",
      "has_children": false,
      "is_child": true,
      "parents": ["travel & transport"]
    },
    "border crossing": {
      "id": "52f2ab2ebcbc57f1066b8b4b",
      "has_children": false,
      "is_child": true,
      "parents": ["travel & transport"]
    },
    "bus station": {
      "id": "4bf58dd8d48988d1fe931735",
      "has_children": true,
      "is_child": true,
      "parents": ["travel & transport"],
      "children": [
        {"bus line": "4bf58dd8d48988d12b951735"}
      ]
    },
    "bus stop": {
      "id": "52f2ab2ebcbc57f1066b8b4f",
      "has_children": false,
      "is_child": true,
      "parents": ["travel & transport"]
    },
    "cable car": {
      "id": "52f2ab2ebcbc57f1066b8b50",
      "has_children": false,
      "is_child": true,
      "parents": ["travel & transport"]
    },
    "cruise ship": {
      "id": "55077a22498e5e9248869ba2",
      "has_children": false,
      "is_child": true,
      "parents": ["travel & transport"]
    },
    "duty-free shop": {
      "id": "589ddde98ae3635c072819ee",
      "has_children": false,
      "is_child": true,
      "parents": ["travel & transport"]
    },
    "general travel": {
      "id": "4bf58dd8d48988d1f6931735",
      "has_children": false,
      "is_child": true,
      "parents": ["travel & transport"]
    },
    "heliport": {
      "id": "56aa371ce4b08b9a8d57356e",
      "has_children": false,
      "is_child": true,
      "parents": ["travel & transport"]
    },
    "hotel": {
      "id": "4bf58dd8d48988d1fa931735",
      "has_children": true,
      "is_child": true,
      "parents": ["travel & transport"],
      "children": [
        {"bed & breakfast": "4bf58dd8d48988d1f8931735"},
        {"boarding house": "4f4530a74b9074f6e4fb0100"},
        {"hostel": "4bf58dd8d48988d1ee931735"},
        {"hotel pool": "4bf58dd8d48988d132951735"},
        {"inn": "5bae9231bedf3950379f89cb"},
        {"motel": "4bf58dd8d48988d1fb931735"},
        {"resort": "4bf58dd8d48988d12f951735"},
        {"vacation rental": "56aa371be4b08b9a8d5734e1"}
      ]
    },
    "intersection": {
      "id": "52f2ab2ebcbc57f1066b8b4c",
      "has_children": false,
      "is_child": true,
      "parents": ["travel & transport"]
    },
    "light rail station": {
      "id": "4bf58dd8d48988d1fc931735",
      "has_children": false,
      "is_child": true,
      "parents": ["travel & transport"]
    },
    "marine terminal": {
      "id": "5f2c1af1b6d05514c704319d",
      "has_children": false,
      "is_child": true,
      "parents": ["travel & transport"]
    },
    "metro station": {
      "id": "4bf58dd8d48988d1fd931735",
      "has_children": false,
      "is_child": true,
      "parents": ["travel & transport"]
    },
    "moving target": {
      "id": "4f2a23984b9023bd5841ed2c",
      "has_children": false,
      "is_child": true,
      "parents": ["travel & transport"]
    },
    "pier": {
      "id": "4e74f6cabd41c4836eac4c31",
      "has_children": false,
      "is_child": true,
      "parents": ["travel & transport"]
    },
    "port": {
      "id": "56aa371be4b08b9a8d57353e",
      "has_children": false,
      "is_child": true,
      "parents": ["travel & transport"]
    },
    "rv park": {
      "id": "52f2ab2ebcbc57f1066b8b53",
      "has_children": false,
      "is_child": true,
      "parents": ["travel & transport"]
    },
    "rental car location": {
      "id": "4bf58dd8d48988d1ef941735",
      "has_children": false,
      "is_child": true,
      "parents": ["travel & transport"]
    },
    "rest area": {
      "id": "4d954b16a243a5684b65b473",
      "has_children": false,
      "is_child": true,
      "parents": ["travel & transport"]
    },
    "road": {
      "id": "4bf58dd8d48988d1f9931735",
      "has_children": false,
      "is_child": true,
      "parents": ["travel & transport"]
    },
    "taxi stand": {
      "id": "53fca564498e1a175f32528b",
      "has_children": false,
      "is_child": true,
      "parents": ["travel & transport"]
    },
    "taxi": {
      "id": "4bf58dd8d48988d130951735",
      "has_children": false,
      "is_child": true,
      "parents": ["travel & transport"]
    },
    "toll booth": {
      "id": "52f2ab2ebcbc57f1066b8b4d",
      "has_children": false,
      "is_child": true,
      "parents": ["travel & transport"]
    },
    "toll plaza": {
      "id": "52f2ab2ebcbc57f1066b8b4e",
      "has_children": false,
      "is_child": true,
      "parents": ["travel & transport"]
    },
    "tourist information center": {
      "id": "4f4530164b9074f6e4fb00ff",
      "has_children": false,
      "is_child": true,
      "parents": ["travel & transport"]
    },
    "train station": {
      "id": "4bf58dd8d48988d129951735",
      "has_children": true,
      "is_child": true,
      "parents": ["travel & transport"],
      "children": [
        {"platform": "4f4531504b9074f6e4fb0102"},
        {"train": "4bf58dd8d48988d12a951735"}
      ]
    },
    "tram station": {
      "id": "52f2ab2ebcbc57f1066b8b51",
      "has_children": false,
      "is_child": true,
      "parents": ["travel & transport"]
    },
    "transportation service": {
      "id": "54541b70498ea6ccd0204bff",
      "has_children": false,
      "is_child": true,
      "parents": ["travel & transport"]
    },
    "travel lounge": {
      "id": "4f04b25d2fb6e1c99f3db0c0",
      "has_children": false,
      "is_child": true,
      "parents": ["travel & transport"]
    },
    "truck stop": {
      "id": "57558b36e4b065ecebd306dd",
      "has_children": false,
      "is_child": true,
      "parents": ["travel & transport"]
    },
    "tunnel": {
      "id": "52f2ab2ebcbc57f1066b8b4a",
      "has_children": false,
      "is_child": true,
      "parents": ["travel & transport"]
    }
  };

  
}
