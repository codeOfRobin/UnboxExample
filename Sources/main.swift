import Foundation
import Unbox

struct Locale {
	let id: Int
	let	locale: String
	let name: String
}

extension Locale: Unboxable {
	init(unboxer: Unboxer) throws {
		self.id = try unboxer.unbox(key: "id")
		self.locale = try unboxer.unbox(key: "locale")
		self.name = try unboxer.unbox(key: "name")
	}
}


let config = URLSessionConfiguration.default
let session = URLSession(configuration: config)


let localeURL = URL(string: "https://kayako-mobile-testing.kayako.com/api/v1/locales")!

session.dataTask(with: localeURL) { (data, response, error) in
	
	
	let locales: [Locale] = try! unbox(data: data!, atKeyPath: "data", allowInvalidElements: false)
	print(locales.map{$0.name})
	exit(0)
}.resume()

RunLoop.main.run()
