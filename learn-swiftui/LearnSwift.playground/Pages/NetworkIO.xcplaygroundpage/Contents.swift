//: [Previous](@previous)

import Foundation

//: Helper function used in the rest of this notebook
func printResponse(_ heading: String, _ data: Data, _ resp: URLResponse) throws {
    print("\n\(heading) -")
    if let httpResp = resp as? HTTPURLResponse {
        print("Status code: \(httpResp.statusCode)")
        for (header, value) in httpResp.allHeaderFields {
            print("\(header): \(value)")
        }
    }
    print("data:")
    let obj = try JSONSerialization.jsonObject(with: data, options: [])
    print(obj)
}


/*:
 Main documentation links -
 https://developer.apple.com/documentation/foundation/urlsession/
 https://developer.apple.com/documentation/foundation/url_loading_system
 
 The heart of Swift Networking APIs is the URLSession class. This has a bunch of class and instance level methods to
 do various things with URLs like uploading and downloading data. The session can be configured using a URLSessionConfiguration
 object which can be used to configure the timeout values, caching policies, connection requirements, whether or not
 network activity can happen in the background, proxies, etc. I can even create custom protocols like `s3://` and create sessions
 for that, but it is a bit more complicated and not covered in this tutorial. Apps should strive to use the same URLSession
 object as much as possible. For the most part I'll not need to create a URLSession object from scratch, I can just use
 the existing default for my app available as URLSession.shared.
 */

print(type(of: URLSession.shared))

/*:
 URLSession has a bunch of methods but the most useful to me are the async/await instance methods. These are `data`,
 `download`, and `upload`. To get the contents of a URL in memory use the `data` method, to download data to a file
 use the `download` method. There are two overloads of `upload` that can be used to upload data from memory and from
 a file. The input to these APIs is either a URL object or a URLRequest object.
 */
 

//: For simple GET requests without any special headers, I can use the URL object directly.
var url = URL(string: "https://httpbin.org/get?flavor=chocolate&calories=200")!
Task {
    let (data, resp) = try await URLSession.shared.data(from: url)
    try printResponse("GET request", data, resp)
}

/*:
 If I want to set specific headers, specify an HTTP verb other than GET, set cache policies, set timeouts, etc. then I
 can use the URLRequest object.
 */

//: Using authorization header
url = URL(string: "https://httpbin.org/bearer")!
req = URLRequest(url: url)
req.setValue("Bearer quantumrandom", forHTTPHeaderField: "Authorization")
Task {
    let (data, resp) = try await URLSession.shared.data(for: req)
    try printResponse("Auth request", data, resp)
}

//: POST request using `upload` method
url = URL(string: "https://httpbin.org/post")!
var req = URLRequest(url: url)
req.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
req.httpMethod = "POST"
let formData = "flavor=chocolate&calories=200".data(using: .utf8)!
Task {
    let (data, resp) = try await URLSession.shared.upload(for: req, from: formData)
    try printResponse("POST request", data, resp)
}

//: Typical flow with proper error checking
func typical() {
    struct Slide: Codable {
        var title: String
        var type: String
        var items: [String]?
        
        func repr() -> String {
            var itemRepr = "[ "
            if let items {
                for item in items {
                    itemRepr += "\(item) "
                }
            }
            itemRepr += "]"
            
            return """
    Slide {
      title: \(title)
      type: \(type)
      items:-
        \(itemRepr)
    }
    """
            
        }
    }

    struct Slideshow: Codable {
        var title: String
        var author: String
        var date: String
        var slides: [Slide]
        
        func repr() -> String {
            var slidesRepr = "[ "
            for slide in slides {
                slidesRepr += slide.repr() + " "
            }
            slidesRepr += "]"
            
            return """
    Slideshow {
      title: \(title)
      author: \(author)
      date: \(date)
      slides:-
        \(slidesRepr)
    }
    """
        }
    }

    struct SlideshowResponse: Codable {
        var slideshow: Slideshow
        
        func repr() -> String {
            return slideshow.repr()
        }
    }

    let url = URL(string: "https://httpbin.org/json")!
    Task {
        do {
            let (data, resp) = try await URLSession.shared.data(from: url)
            if let httpResp = resp as? HTTPURLResponse {
                guard httpResp.statusCode == 200 else {
                    print("Got http error \(httpResp.statusCode)")
                    if let strdata = String(data: data, encoding: .utf8) {
                        print(strdata)
                    }
                    return
                }
                let slideshow = try JSONDecoder().decode(SlideshowResponse.self, from: data)
                print(slideshow.repr())
            }
        } catch {
            print("Error in GETting url \(url)")
            print(error.localizedDescription)
        }
    }
}
//typical()


//: [Next](@next)
