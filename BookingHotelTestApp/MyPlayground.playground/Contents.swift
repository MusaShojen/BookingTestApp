

class Node<Value> {

  public var value: Value
  public var next: Node?
  
  public init(value: Value, next: Node? = nil) {
    self.value = value
    self.next = next
  }
}

extension Node: CustomStringConvertible {

  public var description: String {
    guard let next = next else {
      return "\(value)"
    }
    return "\(value) -> " + String(describing: next) + " "
  }
}


struct LinkedList<Value> {

 public var head: Node<Value>?
 public var tail: Node<Value>?
 
 public init() {}

 public var isEmpty: Bool {
   head == nil
 }
    
    
    public mutating func push(_ value: Value) {
      head = Node(value: value, next: head)
      if tail == nil {
        tail = head
      }
    }
    
    
    public mutating func append(_ value: Value) {

      // 1
      guard !isEmpty else {
        push(value)
        return
      }
      
      // 2
      tail!.next = Node(value: value)
      
      // 3
      tail = tail!.next
    }
    
    
    
    public mutating func remove(after node: Node<Value>) -> Value? {
      defer {
        if node.next === tail {
          tail = node
        }
        node.next = node.next?.next
      }
      return node.next?.value
    }
}

extension LinkedList: CustomStringConvertible {

 public var description: String {
   guard let head = head else {
     return "Empty list"
   }
   return String(describing: head)
 }
}



let phoneNumber = "+7 (9289) ***-**-**"
 var list = LinkedList<Character>()


for char in phoneNumber {
    
    
    list.append(char)
    
}

var current = list.head
var back : Node<Character>
var result = ""
while let node = current {
    
    
    
  
    
    
    result.append(node.value)
    
    if let nextNode = node.next {
        if node.value.isNumber && nextNode.value == "*" {
            list.remove(after: node)
        }

        
    }
    
    current = node.next
}

print(result)
