
import Foundation

class Table {
    
    private let queue = DispatchQueue(label: "table")
    
    private var forkAvailable: [Bool] = .init(repeating: true, count: 5) // true == available
    
    private(set) var eatRecords: [Int] = .init(repeating: 0, count: 5)
    
    func requestFood(for philo: Philosopher) -> Bool {
        queue.sync {
            if pickLeftFork(for: philo) {
                if pickRightFork(for: philo) {
                    eatRecords[philo.id % 5] += 1
                  return true
                } else {
                    putBackLeftFork(for: philo)
                }
            }
            return false
        }
    }
    
    func stopEating(for philo: Philosopher) {
        queue.sync {
            putBackLeftFork(for: philo)
            putBackRightFork(for: philo)
        }
    }
    
    private func pickLeftFork(for philo: Philosopher) -> Bool {
        if self.forkAvailable[(philo.id - 1) % 5] {
            self.forkAvailable[(philo.id - 1) % 5].toggle()
            return true
        }
        return false
    }
    
    private func pickRightFork(for philo: Philosopher) -> Bool {
        if self.forkAvailable[philo.id % 5] {
            self.forkAvailable[philo.id % 5].toggle()
            return true
        }
        return false
    }
    
    func putBackLeftFork(for philo: Philosopher) {
        self.forkAvailable[(philo.id - 1) % 5] = true
    }
    
    func putBackRightFork(for philo: Philosopher) {
        self.forkAvailable[philo.id % 5] = true
    }
}

struct Philosopher: Hashable {
    let id: Int
    private let queue: DispatchQueue
    
    init(_ id: Int) {
        self.id = id
        self.queue = DispatchQueue(label: "\(id)")
    }
    
    
}
