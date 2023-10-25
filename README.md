### 🌵 Input

```swift
// String
let text = readLine()!

// Int
let n = Int(readLine()!)!

// splited input string
let array = readLine()!.components(separatedBy: " ")
```

<br>

### Dictionary

```swift
// array to dict
let dict = Dictionary(uniqueKeysWithValues: array.enumerated().map { ($0, $1) })

// array1 = [1,2,3], array2 = ['a','b','c']
// 조건: array1.count == array2.count
let dict = Dictionary(uniqueKeysWithValues: zip(array1, array2))

// sort
// 이렇게 sorted 만 하면 Dictionary<...>.Element Type이 됨
dict.sorted { $0.1 < $1.1 }
```