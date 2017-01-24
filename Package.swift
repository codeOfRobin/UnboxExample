import PackageDescription

let package = Package(
    name: "UnboxExample",
    dependencies: [
	.Package(url: "https://github.com/JohnSundell/Unbox.git", "2.3.0")
	]
)
