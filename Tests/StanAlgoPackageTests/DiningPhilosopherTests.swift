import XCTest

@testable import Problems

final class DiningPhilosopherTests: XCTestCase {
 
    
    func testTable() {
        var table = Table()
        var philo: Set<Philosopher> = []
        
        for i in 6..<11 {
            philo.insert(Philosopher(i))
        }
        
        for _ in 0..<100000 {
            let p: Philosopher = philo.randomElement()!
            if Bool.random() {
                print("requested food for: \(p.id % 5) \(table.requestFood(for: p) ? "success" : "failure")")
                
            } else {
                print("\(p.id % 5) put down forks \(table.stopEating(for: p))")
            }
        }
        
        print(table.eatRecords)
        
    }
}
