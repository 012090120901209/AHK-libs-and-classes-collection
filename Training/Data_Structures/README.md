# Data Structures Training (43 Examples)

Master data manipulation, transformation, and storage patterns in AutoHotkey v2.

## 📚 Learning Path

### Tier 1: Beginner (31 examples)
**Prerequisites:** Basic AHK v2 syntax

**Core Concepts:**
- Array creation and manipulation
- Map/Object basics
- Iteration patterns (`for`, `loop`)
- Basic sorting and searching
- Type checking and conversion
- String operations on collections

**Key Files:**
- `Array.ahk` - Array operations and methods
- `Misc.ahk` - Mixed data structure patterns
- `String.ahk` - String manipulation utilities
- `Math.ahk` - Mathematical operations on arrays
- `HashFile.ahk` - File hash calculations

**Pattern Examples:**

#### Array Operations
```ahk
; Creating arrays
numbers := [1, 2, 3, 4, 5]
names := ["Alice", "Bob", "Charlie"]

; Common operations
numbers.Push(6)              ; Add to end
firstNum := numbers[1]       ; Access element (1-based!)
numbers.RemoveAt(1)          ; Remove by index
length := numbers.Length     ; Get length

; Iteration
for index, value in numbers {
    MsgBox("Index: " index ", Value: " value)
}

; Built-in methods
numbers.Sort()               ; Sort in place
doubled := numbers.Map(n => n * 2)  ; Transform
evens := numbers.Filter(n => Mod(n, 2) = 0)  ; Filter
```

#### Map/Object Operations
```ahk
; Creating maps
person := Map(
    "name", "John Doe",
    "age", 30,
    "email", "john@example.com"
)

; Or using object syntax
person := {
    name: "John Doe",
    age: 30,
    email: "john@example.com"
}

; Accessing values
name := person["name"]       ; Map syntax
name := person.name          ; Object syntax

; Iteration
for key, value in person {
    MsgBox(key ": " value)
}

; Common operations
person["phone"] := "555-1234"  ; Add/update
person.Delete("email")         ; Remove
exists := person.Has("name")   ; Check existence
```

### Tier 2: Intermediate (10 examples)
**Prerequisites:** Completed Tier 1, familiar with text formats

**Core Concepts:**
- JSON parsing and generation
- XML document processing
- YAML configuration files
- CSV data handling
- Nested data structures
- Data validation
- Serialization/deserialization
- Advanced sorting algorithms

**Key Files:**
- `JSON.ahk` - JSON parsing and generation
- `XML.ahk` - XML document handling
- `YAML.ahk` - YAML configuration parsing
- `_Jxon2.ahk` - Advanced JSON library
- `_YAML.ahk` - Enhanced YAML support

**Pattern Examples:**

#### JSON Operations
```ahk
#Include <JSON>

; Parse JSON string
jsonText := '{"name":"John","age":30,"hobbies":["reading","coding"]}'
data := JSON.Parse(jsonText)

; Access parsed data
name := data["name"]
firstHobby := data["hobbies"][1]

; Create and stringify
person := Map(
    "name", "Jane",
    "age", 25,
    "active", true
)
jsonOutput := JSON.Stringify(person)
MsgBox(jsonOutput)
```

#### XML Processing
```ahk
#Include <XML>

; Load XML
xml := ComObject("MSXML2.DOMDocument.6.0")
xml.async := false
xml.load("config.xml")

; Query with XPath
nodes := xml.selectNodes("//setting[@name='theme']")
for node in nodes {
    value := node.getAttribute("value")
    MsgBox("Theme: " value)
}

; Create XML
root := xml.createElement("config")
setting := xml.createElement("setting")
setting.setAttribute("name", "theme")
setting.setAttribute("value", "dark")
root.appendChild(setting)
xml.appendChild(root)
```

#### CSV Handling
```ahk
; Read CSV
csv := FileRead("data.csv")
lines := StrSplit(csv, "`n", "`r")
headers := StrSplit(lines[1], ",")

data := []
Loop lines.Length - 1 {
    row := StrSplit(lines[A_Index + 1], ",")
    record := Map()
    Loop headers.Length {
        record[headers[A_Index]] := row[A_Index]
    }
    data.Push(record)
}

; Write CSV
output := "Name,Age,Email`n"
for record in data {
    output .= record["Name"] "," record["Age"] "," record["Email"] "`n"
}
FileAppend(output, "output.csv")
```

### Tier 3: Advanced (2 examples)
**Prerequisites:** Strong algorithmic understanding, Tier 2 completed

**Core Concepts:**
- Custom data structure implementation
- Hash tables and hash functions
- Tree structures (Binary, AVL, B-Tree)
- Graph algorithms
- Advanced parsing (custom formats)
- Performance optimization
- Memory management

**Key Files:**
- `HashTable.ahk` - Custom hash table implementation
- `Jxon.ahk` - High-performance JSON parser

**Pattern Examples:**

#### Hash Table Implementation
```ahk
class HashTable {
    __New(capacity := 16) {
        this.capacity := capacity
        this.buckets := []
        this.size := 0

        Loop capacity {
            this.buckets.Push([])
        }
    }

    Hash(key) {
        hash := 0
        Loop StrLen(key) {
            hash := Mod(hash * 31 + Ord(SubStr(key, A_Index, 1)), this.capacity)
        }
        return hash + 1  ; 1-based indexing
    }

    Set(key, value) {
        index := this.Hash(key)
        bucket := this.buckets[index]

        ; Check if key exists
        for entry in bucket {
            if entry[1] = key {
                entry[2] := value
                return
            }
        }

        ; Add new entry
        bucket.Push([key, value])
        this.size++
    }

    Get(key) {
        index := this.Hash(key)
        bucket := this.buckets[index]

        for entry in bucket {
            if entry[1] = key {
                return entry[2]
            }
        }
        throw Error("Key not found: " key)
    }

    Has(key) {
        try {
            this.Get(key)
            return true
        }
        return false
    }
}
```

#### Binary Tree
```ahk
class TreeNode {
    __New(value) {
        this.value := value
        this.left := ""
        this.right := ""
    }
}

class BinaryTree {
    __New() {
        this.root := ""
    }

    Insert(value) {
        if !this.root {
            this.root := TreeNode(value)
            return
        }
        this._InsertNode(this.root, value)
    }

    _InsertNode(node, value) {
        if value < node.value {
            if !node.left
                node.left := TreeNode(value)
            else
                this._InsertNode(node.left, value)
        } else {
            if !node.right
                node.right := TreeNode(value)
            else
                this._InsertNode(node.right, value)
        }
    }

    InOrderTraversal(callback) {
        this._InOrder(this.root, callback)
    }

    _InOrder(node, callback) {
        if !node
            return
        this._InOrder(node.left, callback)
        callback(node.value)
        this._InOrder(node.right, callback)
    }
}
```

## 🎯 Common Operations

### Array Transformations

```ahk
; Map (transform each element)
numbers := [1, 2, 3, 4, 5]
doubled := numbers.Map(n => n * 2)  ; [2, 4, 6, 8, 10]

; Filter (keep elements matching condition)
evens := numbers.Filter(n => Mod(n, 2) = 0)  ; [2, 4]

; Reduce (combine elements)
sum := numbers.Reduce((acc, n) => acc + n, 0)  ; 15

; Custom iteration
result := []
for index, value in numbers {
    if value > 2
        result.Push(value * 10)
}
```

### Nested Data Access

```ahk
; Deep nested structure
data := {
    users: [
        {name: "Alice", age: 30, roles: ["admin", "user"]},
        {name: "Bob", age: 25, roles: ["user"]}
    ],
    settings: {
        theme: "dark",
        language: "en"
    }
}

; Safe access with checking
firstUserName := data.users[1].name  ; "Alice"
isAdmin := data.users[1].roles.IndexOf("admin") > 0  ; true
theme := data.settings.theme  ; "dark"
```

### Data Validation

```ahk
ValidatePerson(data) {
    required := ["name", "age", "email"]

    for field in required {
        if !data.Has(field) or data[field] = ""
            throw Error("Missing required field: " field)
    }

    if !IsInteger(data["age"]) or data["age"] < 0
        throw Error("Invalid age")

    if !RegExMatch(data["email"], "^[\w\.-]+@[\w\.-]+\.\w+$")
        throw Error("Invalid email format")

    return true
}
```

## 🔧 Common Tasks

### Parse JSON File
See: `Tier2_Intermediate/JSON.ahk`

### Read CSV Data
See: Pattern examples above

### Build Hash Table
See: `Tier3_Advanced/HashTable.ahk`

### Sort Custom Objects
See: `Tier1_Beginner/Array.ahk`

### Deep Clone Objects
See: Advanced patterns

## 📖 Key Concepts Reference

| Concept | Difficulty | Example Files |
|---------|-----------|---------------|
| Arrays | Beginner | Array.ahk |
| Maps/Objects | Beginner | Misc.ahk |
| Iteration | Beginner | All Tier 1 |
| JSON | Intermediate | JSON.ahk, _Jxon2.ahk |
| XML | Intermediate | XML.ahk |
| YAML | Intermediate | YAML.ahk, _YAML.ahk |
| Hash Tables | Advanced | HashTable.ahk |
| Trees | Advanced | Custom implementation |

## 🚀 Project Ideas

**Beginner:**
- Contact list manager
- Simple database (array of maps)
- CSV converter
- Configuration file reader

**Intermediate:**
- JSON API client
- XML config manager
- Data transformer pipeline
- CSV analyzer

**Advanced:**
- Custom database engine
- Graph data processor
- Advanced caching system
- Query language parser

## 🔗 Related Resources

- [GUI Applications](../GUI_Applications/README.md) - Display your data
- [Utility Libraries](../Utility_Libraries/README.md) - Data utilities
- [Pattern Index](../PATTERN_INDEX.md) - Quick reference

---

[← Back to Training](../README.md)
