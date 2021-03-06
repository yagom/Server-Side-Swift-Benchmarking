import Vapor
import HTTP

#if os(Linux)
import Glibc
public func arc4random_uniform(_ max: UInt32) -> Int {
    return random() % Int(max)
}
#endif

let drop = Droplet()

drop.get("json") { request in
    
    return try JSON(node: JSONCreator().generateJSON())
}

drop.middleware = []
let port = drop.config["app", "port", "host"]?.int ?? 80

// Print what link to visit for default port
print("Visit http://localhost:\(port)")
drop.run()
