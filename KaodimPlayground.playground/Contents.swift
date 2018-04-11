import UIKit
func gcd(num1: Int, num2: Int) -> Int {
    let result = num1 % num2
    if result != 0 {
        return gcd(num1: num2, num2: result)
    } else {
        return num2
    }
}

gcd(num1: 21, num2: 7)

func lcm(num1: Int, num2: Int) -> Int {
    return num1 / gcd(num1: num1, num2: num2) * num2
}

func lcm(numbers: [Int]) -> Int? {
    var index = 0
    var lowestMultiplier = 0
    
    switch numbers.count {
    case 0:
        return nil
    case 1:
        return numbers.first
    case 2:
        return lcm(num1: numbers[index], num2: numbers[index+1])
    default:
        while index < numbers.count - 2 {
            
            lowestMultiplier = lcm(num1: lcm(num1: numbers[index], num2: numbers[index+1]), num2: numbers[index+2])
            index += 1
        }
        return lowestMultiplier
    }
    
    
    
}
lcm(numbers: [10, 20, 30, 40])
//2.
extension String {
    public func removingSuffix(_ suffix: String) -> String {
        guard hasSuffix(suffix) else { return self }
        return String(dropLast(suffix.count))
    }
}


class Pet {
    let name: String
    var owner: Human?
    init(name: String){
        self.name = name
    }
}

class Human {
    var name: String
    var pets: [Pet] = []
    
    lazy var petNames: String = {
        var names = ""
        for pet in self.pets {
            names += (pet.name + ", ")
        }
        return names.removingSuffix(", ")
    }()
    
    init(name: String){
        self.name = name
    }
    
    func adopt(pet: Pet){
        pets.append(pet)
        pet.owner = self
    }
}

var stanley = Human(name: "Stanley")
stanley.adopt(pet: Pet(name: "Scoobie"))
stanley.adopt(pet: Pet(name: "Panggo"))
stanley.adopt(pet: Pet(name: "Peli"))
stanley.adopt(pet: Pet(name: "Damie"))
print(stanley.petNames)

/* 3.
 Personally I feel that there is lack of info here so I will just answer base on my understanding.
 Everything typed is under the assumption that I am in UserProfileViewController.swift, note that only happy path is considered
 //*****viewdidload*****//
getAuthToken(email: String, password: String) -> String
 closure of getAuthToken(email: String, password: String) -> String will then call getUserProfile(token: String) -> User, and closer of getUserProfile(token: String) -> User will then call checkIfUserAvatarChanged()
 //***END VIEWDIDLOAD***//
 
 
 */
