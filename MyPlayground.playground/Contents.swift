/// Interview Questions
///*********************
///
/// 1. Differences between structs and classes
///   Structs are value typed and use stack-allocated memory while classes are reference typed meaning and use heap-allocated memory. Thus structs are faster than classes. Struct objects cannot change or mutate member variables when declared as let while class objects can. Classes can use inheritance while structs cannot. Struct member variables are immutable by default, so functions must be declared as "mutable" in order to mutate those variables. Class member variables have no such restriction.
/// 2. What is reference type and value type? Explain with example.
///   Reference type means that when assigning an object to another object, it only changes the reference to the object and does not copy any underlying data. Value type means that when assigning an object to another object, it actually copies the data between the two.
        class Cat {
            var breed = ""
            func meow(){
                print("Meow! says the \(breed)")
            }
        }

        struct Dog {
            var breed = ""
            func woof(){
                print("woof woof! exclaims the \(breed)")
            }
        }

        // Reference type
        let felix = Cat()
        felix.breed = "Persian Short Hair"
        let sammy = felix
        sammy.breed = "Siamese"
        sammy.meow() // Meow! says the Siamese
        felix.meow() // Meow! says the Siamese

        // Value type
        var rufus = Dog()
        rufus.breed = "Labrador Retriever"
        var max = rufus
        max.breed = "Golden Retriever"
        max.woof()   // woof woof! exclaims the Golden Retriever
        rufus.woof() // woof woof! exclaims the Labrador Retriever

/// 3. Why structs are faster compared to classes?
///   Structs are faster than classes because they use stack-allocated meaning the data making up the object is located on the same stack as the function and is all local and therefore very "close". Allocating memory in the heap is much more dynamic, and thus requires additional steps in the data as it has to be fragmented across different regions of memory.
/// 4. How to mutate structs?
        struct Example {
            var value: String
            mutating func edit() {
                value = value + " edited!"
            }
        }
/// 5. What is use of mutating keyword?
///   The mutating keyword is used for structs to allow the function to mutate the struct's member variables as it requires copying data to a new struct object.
/// 6. What is enum?
///   Enum is used to create a custom data type that denotes and specifies a state.
/// 7. What is associated value?
///   Associated value allows you to input custom data into an enum. Not all states in the enum need an associated value
/// 8. Difference between associated value and raw value
///   Raw value is used in enum to assign a value e.g. an Int, a String, a double, etc. that's fixed to a state. The raw value data type needs to be declared for the enum though not all states need a raw value to actually be assigned. Associated values are specific to a state in an enum and different states in the same enum can have different data types. An enum cannot have both an associated value and a raw value.
/// 9. What is protocol?
///   Protocol is like a java interface. It's declared like a class but only has methods with no implementation. Classes and structs that implement a protocol must conform all of that protocol's functions.
/// 10. What is extension?
///   Extension allows you to implement and add functions to classes, structs, and protocols.
/// 11. What is use of protocols?
///   Protocols allow to define functionality that objects may use. Protocols allow functionality to be seperately implemented among classes and structs, so that no code is repeated and no functionality is unnecessarily added. Protocols also allow structs to share functionality as structs cannot inherit.
/// 12. How to make function optional in protocol?
///   Implement a blank implementation in an extension for the protocol.
/// 13. Difference between heap memory and stack memory?
///   Stack memory is memory that is located on the stack frame and is fixed in size. Heap memory lives in the heap and is fragmented and has to be actively managed. Stack memory is faster than heap memory.
/// 14. Where is struct object data stored? And where does class's object data get stored?
///   Struct object data is stored in the stack whereas the class's object data is stored in the heap.

/// Excerises
/// 1. Create a Calculator Class with basic mathematics operations (add, subtract, multiply, divide). Define first rules using protocol.
protocol Operations {
    func add (a: Double, b: Double) -> Double
    func subtract (a: Double, b: Double) -> Double
    func multiply (a: Double, b: Double) -> Double
    func divide (a: Double, b: Double) -> Double
}
class Calculator : Operations {
    func add(a: Double, b: Double) -> Double {
        return a + b
    }
    func subtract(a: Double, b: Double) -> Double {
        return a - b
    }
    func multiply(a: Double, b: Double) -> Double {
        return a * b
    }
    func divide(a: Double, b: Double) -> Double {
        return a / b
    }
}
/// 2. Create an integer array and write sorting logic (use any best sorting algorithm, don't use inbuilt sort function)

func selectionSort(_ input: [Int]) -> [Int] {
    var arr = input
    for index in 0..<arr.count{
        // find the smallest number to swap
        var smallestIndex = index
        for i in index+1..<arr.count{
            if arr[i] < arr[smallestIndex]{
                smallestIndex = i
            }
        }
        // swap indicies
        let temp = arr[index]
        arr[index] = arr[smallestIndex]
        arr[smallestIndex] = temp
    }
    return arr
}

var arr = [-8, 0, 318, 123, 348, 12, 5, 31, 5672, 624, 74, 654, 54, 63, -66, 3, -65, 63]
// Just use a simple selection sort algorithm
print(selectionSort(arr))

