//: [Previous](@previous)

import Foundation

// Expanding the ~ in path name.
var goodDirPath = "~/projects/bitbucket/learn/"
goodDirPath = NSString(string: goodDirPath).expandingTildeInPath
print(goodDirPath)

var goodFilePath = "/Users/avilayparekh/.zshrc"

// Checking if the path is a file or a directory (don't be fooled by the method name!)
var isFileOrDir = FileManager.default.fileExists(atPath: goodDirPath)
print("Is this a file or a directory? \(isFileOrDir)")

// Check if the path is a directory
var isDir_: ObjCBool = false
var isDir: Bool

isFileOrDir = FileManager.default.fileExists(atPath: goodDirPath, isDirectory: &isDir_)
isDir = isDir_.boolValue
print("Is this a directory? \(isDir)")

print()
print(goodFilePath)
isFileOrDir = FileManager.default.fileExists(atPath: goodFilePath, isDirectory: &isDir_)
isDir = isDir_.boolValue
print("Is this a file/directory? \(isFileOrDir)")
print("Is this a directory? \(isDir)")

// Read a file all at once
print()
if let contents = try? String(contentsOfFile: goodFilePath) {
    print(contents)
} else {
    print("Unable to read file.")
}

// Data class also has a similar API where I can read the file as bytes
if let data = try? Data(contentsOf: URL(filePath: goodFilePath)) {
    print(type(of: data))
    var contents = String(data: data, encoding: .utf8)
    print(contents!)
}

// Read a file line by line
// Could not find a way to read line by line.
// But here is how to access line by line
if let contents = try? String(contentsOfFile: goodFilePath) {
    let lines = contents.components(separatedBy: .newlines)
    print("Type is \(type(of: lines)). There are \(lines.count) number of lines.")
    print(lines[0])
}

// Write to a file all at once
// Will overwrite the file if it exists, so I have to do all the safety checks myself I guess?
var path = "/Users/avilayparekh/projects/bitbucket/learn/learn-swift/tp.txt"
var contents = "Hello, World!\n"
var data = contents.data(using: .utf8)
FileManager.default.createFile(atPath: path, contents: data)

// Write to a file line by line
// TODO

// Get some well known paths
// URL class has some convenience properties to get some well known paths. These paths can be obtained from
// FileManager class as well, but using URL is more convenient
var homedir = URL.homeDirectory
print("Home dir is \(homedir)")

var docdir = URL.documentsDirectory
print("Documents dir is \(docdir)")

//: [Next](@next)
