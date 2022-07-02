import UIKit

//1.     დაწერეთ ფუნქცია, რომელსაც გადაეცემა ტექსტი  და აბრუნებს პალინდრომია თუ არა. (პალინდრომი არის ტექსტი რომელიც ერთნაირად იკითხება ორივე მხრიდან).
//Boolean isPalindrome(String text);

func isPalindrome(_ value: String) -> Bool {
    let lenght = value.count / 2
    
    for i in 0..<lenght {
        let first = value.index(value.startIndex, offsetBy: i)
        let second = value.index(value.endIndex, offsetBy: (i * -1) - 1)
        
        if value[first] == value[second] {
            return true
        }
    }
    return false
}

print(isPalindrome("anna"))

//2.     გვაქვს 1,5,10,20 და 50 თეთრიანი მონეტები. დაწერეთ ფუნქცია, რომელსაც გადაეცემა თანხა (თეთრებში) და აბრუნებს მონეტების მინიმალურ რაოდენობას, რომლითაც შეგვიძლია ეს თანხა დავახურდაოთ.
//
//Int minSplit(Int amount);

func minSplit(_ amount : Int) -> Int {
    let coinArray = [50, 20, 10, 5, 1]
    var newValue = amount
    var quantity = 0
    
    for coin in coinArray {
        if newValue / coin > 0 {
            quantity += (newValue/coin)
            newValue %= coin
        }
        if newValue == 0 {
            break
        }
    }
    return quantity
}
print(minSplit(102))
print(minSplit(100))

//3.     მოცემულია მასივი, რომელიც შედგება მთელი რიცხვებისგან. დაწერეთ ფუნქცია რომელსაც გადაეცემა ეს მასივი და აბრუნებს მინიმალურ მთელ რიცხვს, რომელიც 0-ზე მეტია და ამ მასივში არ შედის.
//
//Int notContains(Int[] array);

func notContains(_ array : [Int]) -> Int {
    for number in 1...Int.max { if !array.contains(number) {return number}
    }
    return Int.max
}
var randomElements =  (1...5).map( {_ in Int.random(in: 1...20)})

print(notContains(randomElements))
print(notContains([4, 3, 2, 1]))

//4.     მოცემულია String რომელიც შედგება „(„ და „)“ ელემენტებისგან. დაწერეთ ფუნქცია რომელიც აბრუნებს ფრჩხილები არის თუ არა მათემატიკურად სწორად დასმული.
//
//Boolean isProperly(String sequence);
//
//მაგ: (()()) სწორი მიმდევრობაა,  ())() არასწორია

func isProperly(_ sequence : String) -> Bool {
    var chArray = [String]()
    
    for ch in sequence {
        if ch == "(" {
            chArray.append(String(ch))
        }
        else if ch == ")" {
            if chArray.count > 0 && "(" == chArray[chArray.count - 1] {chArray.removeLast()}
            else {return false}
        }
    }
    
    if chArray.count == 0 {return true}
    else {return false}
}
print(isProperly("()()()"))
print(isProperly("((())()()"))

//5.     გვაქვს n სართულიანი კიბე, ერთ მოქმედებაში შეგვიძლია ავიდეთ 1 ან 2 საფეხურით. დაწერეთ ფუნქცია რომელიც დაითვლის n სართულზე ასვლის ვარიანტების რაოდენობას.
//
//Int countVariants(Int stearsCount);

func countVariants(_ stearsCount : Int) -> Int {
    if (stearsCount == 1 || stearsCount == 2) {
        return stearsCount
    }
    
    var cur = 0
    var befPrev = 1
    var prev = 2
    
    for _ in (3..<stearsCount + 1) {
        cur = befPrev + prev
        befPrev = prev
        prev = cur
    }
    return cur
}

print(countVariants(9))

//6.     დაწერეთ საკუთარი მონაცემთა სტრუქტურა, რომელიც საშუალებას მოგვცემს O(1) დროში წავშალოთ ელემენტი.

public class Node {
    var value: String
    var next: Node?
    
    weak var previous: Node?
    
    init(value: String) {
        self.value = value
    }
}

public class LinkedList {
    fileprivate var head: Node?
    private var tail: Node?
    
    public var isEmpty: Bool {
        return head == nil
    }
    public var first: Node? {
        return head
    }
    public var last: Node? {
        return tail
    }
}

extension LinkedList {
    public func removeAll() {
        head = nil
        tail = nil
    }
    
    public func remove(node: Node) -> String {
        let prev = node.previous
        let next = node.next
        if let prev = prev {
            prev.next = next
        } else {
            head = next
        }
        next?.previous = prev
        
        if next == nil {
            tail = prev
        }
        node.previous = nil
        node.next = nil
        return node.value
    }
}
