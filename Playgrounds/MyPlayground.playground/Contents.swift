
var str = "Hello, playground"

//Variables & Constantes

//Typées fortement
// Type est déduit, précisions du type limité a des cas spécifiques

let languageName = "Swift"
var version: Float = 5.1
let isAwesome = true
let introductionYear: UInt = 2014

let test: String
version = 5.2

test = "test"

//Fonctions

// Simple
func doSomething() {
    print("I do Something")
}
doSomething()

// 1param
func eat(something: String) {
    print("I eat" + something)
}
eat(something: "Pizza")

// multiple param
func changeColor(red: Int, blue: Int, green: Int, alpha: Int) {}
func changeColor(blue: Int, red: Int, green: Int, alpha: Int) {}
func changeColor(cyan: Int, magenta: Int, yellow: Int, black: Int) {}
changeColor(red: 255, blue: 125, green: 255, alpha: 0)

// Changed argument labels
func add<T: AdditiveArithmetic>(_ firstNumber: T, to secondNumber: T) -> T {
    print(firstNumber + secondNumber)
    return firstNumber + secondNumber
}
add(10, to: 5)
add(10.0, to: 5.0)

func eat(_ food: String, with friend: String = "jfjh") {

}
eat("Pizza", with: "Paul")

let result = add(10, to: 5)

func substract(_ firstNumber: Int, to secondNumber: Int) -> (firstOperand: Int, secondOperand: Int, result: Int) {

    return (firstNumber, secondNumber, secondNumber - firstNumber)
}

let resultSub = substract(56, to: 100)
print(resultSub.firstOperand, resultSub.secondOperand, resultSub.result)

// Variadic params
func sum(number: Int...) -> Int {

    let doubles = number.map { (intValue) -> Double in
        return Double(intValue)
    }

    return number.reduce(0) { (res, new) -> Int in
        return res + new
    }
}

sum(number: 10, 20, 30, 40)

// POO

// Struct can have methods and properties
// Struct are value types, assign = copy
struct Human {

    let name: String
    var age: Int

    init(name: String, age: Int = 0) {
        self.name = name
        self.age = age
    }

    func sayHello() {
        print("Hello my name is \(name)")
    }

    mutating func happyBirthday() {
        print("Happy birthday! ")
        age = age + 1
    }
}

var me = Human(name: "Ludovic", age: 33)
me.sayHello()

let you = me
me.happyBirthday()

me
you

let toto = Human(name: "Toto", age: 8)

// Class can have methods and properties
// Class are reference types, assign = reference/pointer

class Animal {
    let name: String
    var age: Int

    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }

}

class Dog: Animal {

    var owner: Human

    init(name: String, owner: Human, age: Int = 0) {
        self.owner = owner
        super.init(name: name, age: age)
    }

    init(owner: Human) {
        self.owner = owner
        super.init(name: "Médor", age: 0)
    }

    func sayHello() {
        print("Whooff \(name)")
    }

    func happyBirthday() {
        print("Happy birthday! ")
        age = age + 1
    }
}

var aDog = Dog(owner: me)

var aDog2 = aDog

aDog.happyBirthday()

aDog
aDog2

enum FuelType {
    case gazoline
    case diesel
    case electric
    case hybrid
}
