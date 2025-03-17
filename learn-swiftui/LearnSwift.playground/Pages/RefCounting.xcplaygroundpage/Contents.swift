//: [Previous](@previous)

import Foundation

/*
 Detailed documentation -
 https://docs.swift.org/swift-book/documentation/the-swift-programming-language/automaticreferencecounting/
 */

// Example of a memory leak where both A and B hold strong references to each other.
class A {
    var b: B?
    
    init() {
        print("Allocating A")
    }
    
    deinit {
        print("Deallocating A")
    }
}

class B {
    var a: A?
    
    init() {
        print("Allocating B")
    }
    
    deinit {
        print("Deallocating B")
    }
}

var a: A? = A()
var b: B? = B()
a!.b = b
b!.a = a
a = nil
b = nil
/* Output:
 Allocating A
 Allocating B
 */
// Neither A() nor B() is deallocated resulting in a memory leak.

/*
 There are three different scenarios where this can occur -
 1. Where both the objects can become nil, their lifetimes are independant of each other.
 2. Where only one of the objects can become nil, the other one's life is depedant on the nil'able one.
 3. Where both the objects cannot be nil, their lifetimes are tied to each other.
 
 In case 1, I can use weak refs. In case 2, I can use unowned refs. In case 3, I can still use
 unowned refs but with implicitly unwrapped optionals.
 */

// One way to counter this memory leak is to use weak references. AFAIK - it does not matter
// which one of A or B is a weak ref as long as one of them is. And I can set either of them to nil
// first, it will not matter, things will keep working. When an object has only weak refs pointing
// to it, it is deallocated. Weak refs don't count towards ref counting. Weak refs have to be
// optional. In this case Y() has a weak ref to X(). When X() gets deallocated, the ARC (Swift's
// reference counter) will set Y()'s weak ref to nil.
class X {
    var y: Y?
    
    init() {
        print("Allocating X")
    }
    
    deinit {
        print("Deallocating X")
    }
}

class Y {
    // A weak ref has to be optional, compile error otherwise
    weak var x: X?
    
    init() {
        print("Allocating Y")
    }
    
    deinit {
        print("Deallocating Y")
    }
}

var x1: X? = X()
var y1: Y? = Y()
x1!.y = y1
y1!.x = x1

// Once I set x1 to nil, the only ref to X() is from Y(), which is  a weak ref so it doesn't
// count. It will be deallocated. ARC will automatically set y.x to nil. Or when I set y <- nil,
// then Y() too will get deallocated, thus no memory leak.
x1 = nil
print(y1!.x)
/* Output:
 Allocating X
 Allocating Y
 Deallocating X
 nil
 */

// I can also set y to nil first, but nothing will get deallocated because x.y is still holding a
// strong reference to Y(). Once I set x <- nil, X() will get deallocated (because weak ref from Y
// does not count. And then because there are no strong refs pointing to Y(), it too will get
// deallocated.
var x2: X? = X()
var y2: Y? = Y()
x2!.y = y2
y2!.x = x2
y2 = nil // Nothing will get deallocated.
/* Output:
 Allocating X
 Allocating Y
 Deallocating X
 Deallocating Y
 */

x2 = nil
/* Ouput:
 Deallocating X
 Deallocating Y
 */

// Another way to counter memory leaks arising out of cyclic deps is to use unowned refs. Just like
// weak refs, they don't count during ref counting. But unlike weak refs, the ARC will not
// automatically set them to nil. The shorter lived object should hold an unowned ref to the longer
// lived object.

class P {
    var q: Q?
    
    init() {
        print("Allocating P")
    }
    
    deinit {
        print("Deallocating P")
    }
}

class Q {
    // This tells me that P is supposed to be longer lived than Q
    unowned var p: P
    
    init(p: P) {
        self.p = p
        print("Allocating Q")
    }
    
    deinit {
        print("Deallocating Q")
    }
}

var p1: P? = P()
var q1: Q? = Q(p: p1!)
p1!.q = q1
/* Output:
 Allocating P
 Allocating Q
 */

// p1 is supposed to be longer lived so lets set q1 to nil. Nothing happens because Q() is still
// being strongly referenced by P(). In fact that is the natural state because I'd typically
// instantiate Q like -
// p1.q = Q(p: p1). There is no q1.
q1 = nil

// When I set p1 to nil, then P() will be deallocated because nobody is strongly refing it, the
// unowned ref from Q does not count. After P() is deallocated, there are no strong refs to Q()
// so that gets deallocated as well.
p1 = nil
/* Output:
 Deallocating P
 Deallocating Q
 */

// However, what happens if I set p, the longer lived object to nil while still holding a ref to
// Q()? P() gets deallocated. But, contrary to unowned refs, ARC will not set the Q().p to nil.
// I have to remember to do it. If I don't, and try to access Q().p, I'll get a SIGABRT core dump.
var p2: P? = P()
var q2: Q? = Q(p: p2!)
p2!.q = q2!
p2 = nil  // P() gets deallocated, but Q() is still there with a dangling ref to P()
/* Output:
 Allocating P
 Allocating Q
 Deallocating P
 */
// print(q2.p)  // Will coredump
// This is why it is a better practice to instantiate both the objects like -
// p2.q = Q(p: p2)
// There is no danger of q2 holding a ref to Q() after p2 has been deallocated.

// Now we come to the third scenario where both objects are dependant on each other, neither can
// become nil independant of the other.

// One way to define the two classes is as follows -
/*
class M {
    var n: N
    
    init(n: N) {
        self.n = n
    }
}

class N {
    unowned var m: M
    
    init(m: M) {
        self.m = m
    }
}
 
var m = M()  --> cannot do this because I need N()
var n = N(m: m)
 
var n = N()  ---> cannot do this either
var m = M(n: n)
*/
// There is no way to initialize the two objects! I can of course make one of them optional -
/*
class M {
    var n: N?
}

class N {
    unowned var m: M
    
    init(m: M) {
        self.m = m
    }
}

var m = M()
var n = N(m: m)
m.n = n
*/
// But this means that M() can exist without a reference to N(). Semantically speaking, this is not
// what I want, neither of the two objects should be able to exist without the other. I can try -
/*
class M {
    var n: N
    
    init() {
        n = N(m: self)
    }
}

class N {
    unowned var m: M
    
    init(m: M) {
        self.m = m
    }
}

var m = M()
print(m.n)
*/
// But this won't work because in M's initializer I cannot pass self anywhere because self has not
// been fully constructed. It still needs M.n to be set before it is fully constructed before I am
// able to pass it around. And that cannot happen until I construct N() which in turn needs M().
// Seems like I am back to square 1. But Swift has special syntax to deal with this - implicitly
// unwrapped optionals. Here is how they work -

class M {
    // N! means it is an optional, but I, the programmer, am assuring Swift ARC that it will always
    // have a valid object.
    var n: N!
    
    init() {
        print("Allocating M")
        self.n = N(m: self)
    }
    
    deinit {
        print("Deallocating M")
    }
}

class N {
    unowned var m: M
    
    init(m: M) {
        print("Allocating N")
        self.m = m
    }
    
    deinit {
        print("Deallocating N")
    }
}

var m1: M? = M()
/* Outputs:
 Allocating M
 Allocating N
 */
// Now when I set m1 to nil, both M() and N() get deallocated.
m1 = nil
/* Output:
 Deallocating M
 Deallocating N
 */
print("\n\n")
var m2: M? = M()
m2!.n = N(m: m2!)
// This will deallocate the old N and allocate a new N. At no point will N exist without pointing
// to an M.
/* Output:
 Allocating M
 Allocating N
 Allocating N
 Deallocating N
 */

// Of course I can do this, but then it is my fault, because I assured the Swift ARC that M will
// always have a valid N.
//m2!.n = nil

//: [Next](@next)
