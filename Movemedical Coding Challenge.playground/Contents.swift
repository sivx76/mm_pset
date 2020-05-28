import UIKit
/*
 Ben Alemu | May 28th, 2020
 
 
 Design decisions:
 
 (1) Use structs for the data model, since they are passed by value and not by reference. I do this to avoid pointers referencing the same memory location. Because of this, no inheritance is used.
 (2) Many properties are made optional, since they are not as important as other data - and do not have to be passed into the constructor, initially. They can later be given a value. To enable this, I use the var keyword for the property definitions.
 (3) Use enumerations (colors, genres, phoneOS ...) to restrict possible parameter types and enfore logic on accceptable values..
 (4) To keep things simple, we provide only a few available methods for each struct.
 (5) For time's sake, I won't store these objects in a collection object, place them in a tableView and etc.
 */


// MARK: - Data Models
struct Book {
    
    //Properties:
    let identifier = UUID().uuidString
    let title : String
    let author: String

    let pageCount : Int
    let numberChapters: Int
    let textContent: [String]
    
    var genres: [bookGenres]?
    var haveRead: Bool = false
    
    
    var yearPublished: Int?
    var gradeReadingLevel: Int?
    
    
    //Methods:
    mutating func finishedBook() {
        
        print("Congratulations on reading the book!")
        haveRead = true
    }
    
    mutating func readBook() {
        print("Reading the book: \(textContent)")
        
        haveRead = true
    }
    
}



struct Phone {
    
    //Properties:
    let identifier = UUID().uuidString
    let name : String
    let manufacturer: phoneManufactuer
    let networkCarrier: String
    let operatingSystem: phoneOS
    let priceUnlockedUSD: Int

    var phoneNumber: String?
    
    var color: colors
    var screenSize: Int?
    var memoryCapacityGB: String?
    var launchYear: Int?
    
    
    //Methods:
    func turnOnPhone() {
        print("Phone is booting up!")
    }
    
    func turnOffPhone() {
        print("Phone is shutting down ...")
    }
    
    func call(recipient: String) {
        print("Calling: \(recipient) ...")
    }
    
    func text(recipeint: String, message: String) {
        print("Texting \(recipeint): \(message)")
    }

}



struct Car {
    
    //Properties:
    let identifier = UUID().uuidString
    let model: String
    var manufacturer : carManufacturer
    let type: carType
    let color: colors
    let mpg: Int
    var usedCar: Bool = false
    
    var passengerCapacity: Int?

    var launchYear: Int?
    
    //Methods:
    func driveCar(destinationDistanceMiles: Float, speedLimit: Float) {
        let hours = destinationDistanceMiles / speedLimit
        
        print("The drive will take: \(hours) hours to reach the destination.")
    }


}


// MARK: - Enums
enum bookGenres {
    case fantasy
    case fiction
    case horror
    case scifi
    case comic
    case comedy
    case mystery
    case reference
    case others
}



//Enums for phones

enum phoneOS {
    case ios
    case android
    case windows
    case palm
    case blackberry
    case nokia
    case other
}

enum phoneManufactuer {
    case apple
    case samsung
    case google
    case htc
    case motorola
    case lg
    case sony
    case palm
    case nokia
    case rim
    case asus
    case microsoft
}

enum phoneCarriers {
    case verizon
    case att
    case sprint
    case tmobile
    case cricket
    case boost
    case vodafone
}

enum colors {
    case white
    case black
    case blue
    case green
    case silver
    case purple
    case pink
    case orange
    case other
}


//Enums for cars

enum carManufacturer {
    case toyota
    case ford
    case kia
    case nissan
    case lexus
    case tesla
    case honda
    case other
}

enum carType {
    case gas
    case electric
    case hybrid
}



// MARK: - Testing Book Model
var socStone = Book(title: "Harry Potter and the Sorceror's Stone", author: "JK Rowling", pageCount: 324, numberChapters: 14, textContent: ["chapter 1 ... Harry is bullied", "chapter 2 ... Harry you are a wizard!"])

print("Showcasing the unique identifier: \(socStone.identifier)")

socStone.haveRead
socStone.readBook()
socStone.haveRead

//assign an optional property
socStone.genres = [.fiction]


//unwrap the optional
if let genres = socStone.genres {
    print("These are the book genres: \(genres)")
}

print("----")


// MARK: - Testing Phone Model
var iPhone = Phone(name: "iPhone 11", manufacturer: .apple, networkCarrier: "Verizon", operatingSystem: .ios, priceUnlockedUSD: 1400, color: .black)

iPhone.call(recipient: "Dustin")
iPhone.text(recipeint: "Movemedical", message: "Hello!")

iPhone.turnOffPhone()

print("----")



// MARK: - Testing Car Model
var kiaOptima = Car(model: "Forte", manufacturer: .kia, type: .gas, color: .black, mpg: 32)

print("Car's model: \(kiaOptima.manufacturer) \(kiaOptima.model)" )

kiaOptima.driveCar(destinationDistanceMiles: 120, speedLimit: 32)
