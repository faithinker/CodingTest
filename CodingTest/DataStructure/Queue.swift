/*
  Queue

  A queue is a list where you can only insert new items at the back and
  remove items from the front. This ensures that the first item you enqueue
  is also the first item you dequeue. First come, first serve!

  A queue gives you a FIFO or first-in, first-out order. The element you
  inserted first is also the first one to come out again. It's only fair!

  In this implementation, enqueuing is an O(1) operation, dequeuing is O(n).
*/

import Foundation

public struct Queue<T> {
  fileprivate var array = [T]()

  public var isEmpty: Bool {
    return array.isEmpty
  }

  public var count: Int {
    return array.count
  }

  public mutating func enqueue(_ element: T) {
    array.append(element)
  }

  public mutating func dequeue() -> T? {
    if isEmpty {
      return nil
    } else {
      return array.removeFirst()
    }
  }

  public var front: T? {
    return array.first
  }
}
