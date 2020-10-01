import Foundation

func exampleDispatchGroup() {
    
    let dispatchGroup = DispatchGroup()
    var array = [Int]()
    
    for index in 0...3 {
        
        someOperation(dispatchGroup, wait: Double.random(in: 0...3)) {
            
            array.append(index)
        }
    }

    dispatchGroup.notify(queue: DispatchQueue.main) {
        
        print(array)
    }
}

func someOperation(_ group: DispatchGroup, wait: Double, completion: @escaping () -> Void) {
    
    group.enter()
    
    DispatchQueue.main.asyncAfter(deadline: .now() + wait) {
        
        completion()
        
        group.leave()
    }
}

exampleDispatchGroup()
