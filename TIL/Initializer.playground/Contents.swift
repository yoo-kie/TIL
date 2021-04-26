import UIKit

struct Dog {
    var name: String
    var type: String
    
    // 멤버와이즈 컴파일러가 자동 생성
    init(name: String) {
        self.name = name
        self.type = "poodle"
    } // Return from initializer without initializing all stored properties
}

//var rookie: Dog = Dog(name: "rookie", type: "poodle")
var rookie: Dog = Dog(name: "rookie")

class Person {
    var name: String

    init(name: String) {
        self.name = name
    }
}

class Member: Person {
    var team: Team

    init(team: Team, name: String) {
        self.team = team
        super.init(name: name) // 안 적으면? 'super.init' isn't called on all paths before returning from initializer
    }

    convenience init(team: Team) {
        self.init(team: team, name: "default")
        // 'self.init' isn't called on all paths before returning from initializer
    }
}

class Team {
    var name: String
    var lead: Member?

    init(name: String) {
        self.name = name
        self.lead = Member(team: self, name: "vivi")
    }
}

let team: Team = Team(name: "Rx")
let gaegul: Member = Member(team: team)
print(gaegul.team.name, gaegul.name)
