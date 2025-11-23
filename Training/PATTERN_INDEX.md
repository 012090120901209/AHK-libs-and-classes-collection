# AutoHotkey v2 Pattern Index

Quick reference for common AutoHotkey v2 patterns and idioms. Find examples organized by concept.

## 🎯 Table of Contents

- [GUI Patterns](#gui-patterns)
- [Data Structure Patterns](#data-structure-patterns)
- [File I/O Patterns](#file-io-patterns)
- [String Patterns](#string-patterns)
- [Network Patterns](#network-patterns)
- [OOP Patterns](#oop-patterns)
- [Async/Event Patterns](#asyncevent-patterns)
- [System Interaction](#system-interaction)
- [Error Handling](#error-handling)

---

## GUI Patterns

### Basic Window Creation
**Difficulty:** Beginner | **Files:** `GUI_Applications/Tier1_Beginner/GUI.ahk`

```ahk
myGui := Gui()
myGui.Title := "My Application"
myGui.Add("Text", , "Hello, World!")
myGui.Add("Button", "Default", "Click Me").OnEvent("Click", ButtonClick)
myGui.Show("w300 h200")

ButtonClick(ctrl, info) {
    MsgBox("Button clicked!")
}
```

### Form with Input Validation
**Difficulty:** Intermediate | **Files:** `GUI_Applications/Tier2_Intermediate/`

```ahk
myGui := Gui()
nameEdit := myGui.Add("Edit", "w200")
emailEdit := myGui.Add("Edit", "w200")
myGui.Add("Button", "Default", "Submit").OnEvent("Click", Submit)
myGui.Show()

Submit(*) {
    name := Trim(nameEdit.Value)
    email := Trim(emailEdit.Value)

    if !name or !email {
        MsgBox("Please fill all fields")
        return
    }

    if !RegExMatch(email, "^[\w\.-]+@[\w\.-]+\.\w+$") {
        MsgBox("Invalid email format")
        return
    }

    MsgBox("Submitted: " name ", " email)
}
```

### ListView with Data Binding
**Difficulty:** Intermediate | **Files:** `GUI_Applications/Tier2_Intermediate/`

```ahk
myGui := Gui()
lv := myGui.Add("ListView", "r10 w500", ["ID", "Name", "Status"])

; Populate data
data := [
    {id: 1, name: "Alice", status: "Active"},
    {id: 2, name: "Bob", status: "Inactive"}
]

for item in data {
    lv.Add(, item.id, item.name, item.status)
}

lv.OnEvent("DoubleClick", EditRow)
myGui.Show()

EditRow(ctrl, rowNum) {
    id := lv.GetText(rowNum, 1)
    name := lv.GetText(rowNum, 2)
    MsgBox("Editing: " name " (ID: " id ")")
}
```

### Dark Mode GUI
**Difficulty:** Intermediate | **Files:** `GUI_Applications/Tier1_Beginner/Color_Picker_Dialog.ahk`

```ahk
myGui := Gui()
myGui.BackColor := "0x1e1e1e"
myGui.SetFont("s10 cWhite", "Segoe UI")

myGui.Add("Text", , "Dark Mode Example")
myGui.Add("Edit", "w300 Background0x2d2d2d cWhite")
myGui.Add("Button", "w100", "Submit")
myGui.Show()
```

---

## Data Structure Patterns

### Array Operations
**Difficulty:** Beginner | **Files:** `Data_Structures/Tier1_Beginner/Array.ahk`

```ahk
; Create and manipulate
numbers := [1, 2, 3, 4, 5]

; Add elements
numbers.Push(6)              ; Add to end
numbers.InsertAt(1, 0)       ; Insert at beginning

; Remove elements
last := numbers.Pop()        ; Remove from end
first := numbers.RemoveAt(1) ; Remove by index

; Transform
doubled := numbers.Map(n => n * 2)
evens := numbers.Filter(n => Mod(n, 2) = 0)
sum := numbers.Reduce((acc, n) => acc + n, 0)

; Sort
numbers.Sort()               ; Ascending
numbers.Sort((a, b) => b - a) ; Descending
```

### Map/Dictionary Operations
**Difficulty:** Beginner | **Files:** `Data_Structures/Tier1_Beginner/`

```ahk
; Create map
person := Map(
    "name", "John",
    "age", 30,
    "email", "john@example.com"
)

; Access and modify
name := person["name"]
person["phone"] := "555-1234"
person.Delete("email")

; Check existence
if person.Has("phone")
    MsgBox("Phone exists")

; Iterate
for key, value in person {
    MsgBox(key ": " value)
}

; Get all keys/values
keys := [key for key in person]
values := [value for key, value in person]
```

### JSON Parsing
**Difficulty:** Intermediate | **Files:** `Data_Structures/Tier2_Intermediate/JSON.ahk`

```ahk
#Include <JSON>

; Parse JSON
jsonText := '{"name":"Alice","age":25,"active":true}'
data := JSON.Parse(jsonText)

; Access nested data
name := data["name"]
age := data["age"]

; Create and stringify
person := Map(
    "name", "Bob",
    "age", 30,
    "hobbies", ["coding", "gaming"]
)
jsonOutput := JSON.Stringify(person)
FileAppend(jsonOutput, "person.json")
```

### Deep Clone Object
**Difficulty:** Advanced | **Files:** `Data_Structures/Tier3_Advanced/`

```ahk
DeepClone(obj) {
    if !IsObject(obj)
        return obj

    if obj is Array {
        clone := []
        for item in obj
            clone.Push(DeepClone(item))
        return clone
    }

    if obj is Map {
        clone := Map()
        for key, value in obj
            clone[key] := DeepClone(value)
        return clone
    }

    ; Handle regular objects
    clone := {}
    for key, value in obj.OwnProps()
        clone.%key% := DeepClone(value)
    return clone
}
```

---

## File I/O Patterns

### Read Entire File
**Difficulty:** Beginner | **Files:** `Utility_Libraries/Tier1_Beginner/FileCountLines.ahk`

```ahk
; Read entire file
content := FileRead("myfile.txt")

; Read with encoding
content := FileRead("myfile.txt", "UTF-8")

; Check if file exists first
if FileExist("myfile.txt")
    content := FileRead("myfile.txt")
else
    MsgBox("File not found")
```

### Read File Line by Line
**Difficulty:** Beginner | **Files:** `Utility_Libraries/Tier1_Beginner/`

```ahk
; Process each line
Loop Read, "myfile.txt" {
    line := A_LoopReadLine
    MsgBox("Line " A_Index ": " line)
}

; Store lines in array
lines := []
Loop Read, "myfile.txt"
    lines.Push(A_LoopReadLine)
```

### Write File
**Difficulty:** Beginner | **Files:** `Utility_Libraries/Tier1_Beginner/`

```ahk
; Append to file
FileAppend("New line`n", "myfile.txt")

; Overwrite file
FileDelete("myfile.txt")
FileAppend("First line`n", "myfile.txt")

; Write with encoding
FileAppend("UTF-8 content`n", "myfile.txt", "UTF-8")
```

### List Files in Directory
**Difficulty:** Beginner | **Files:** `Utility_Libraries/Tier1_Beginner/`

```ahk
; List all .txt files
files := []
Loop Files, "C:\MyFolder\*.txt"
    files.Push(A_LoopFilePath)

; Recursive search
Loop Files, "C:\MyFolder\*.*", "R"
    files.Push(A_LoopFilePath)

; Get file details
Loop Files, "C:\MyFolder\*.*" {
    MsgBox("File: " A_LoopFileName
        "`nSize: " A_LoopFileSize
        "`nModified: " A_LoopFileTimeModified)
}
```

---

## String Patterns

### Common String Operations
**Difficulty:** Beginner | **Files:** `Utility_Libraries/Tier1_Beginner/String.ahk`

```ahk
str := "Hello, World!"

; Length
len := StrLen(str)

; Substring
sub := SubStr(str, 1, 5)  ; "Hello"
last3 := SubStr(str, -3)  ; "ld!"

; Find
pos := InStr(str, "World")

; Replace
newStr := StrReplace(str, "World", "AHK")

; Split
parts := StrSplit(str, ",")

; Case conversion
upper := StrUpper(str)
lower := StrLower(str)
title := StrTitle(str)

; Trim whitespace
trimmed := Trim("  text  ")
```

### Regular Expressions
**Difficulty:** Intermediate | **Files:** `Utility_Libraries/Tier2_Intermediate/RegEx.ahk`

```ahk
text := "Email: john@example.com"

; Simple match
if RegExMatch(text, "(\w+@\w+\.\w+)", &match)
    MsgBox("Email: " match[1])

; Multiple matches
emails := []
pos := 1
while pos := RegExMatch(text, "(\w+@\w+\.\w+)", &match, pos) {
    emails.Push(match[1])
    pos += StrLen(match[0])
}

; Replace with regex
newText := RegExReplace(text, "\d+", "X")

; Named groups
if RegExMatch(text, "(?P<user>\w+)@(?P<domain>\w+\.\w+)", &match)
    MsgBox("User: " match["user"] "`nDomain: " match["domain"])
```

### String Formatting
**Difficulty:** Beginner | **Files:** `Utility_Libraries/Tier1_Beginner/`

```ahk
; Basic concatenation
name := "John"
age := 30
msg := "Name: " name ", Age: " age

; Format function
msg := Format("Name: {1}, Age: {2}", name, age)

; Number formatting
num := 1234.5678
formatted := Format("{:.2f}", num)  ; "1234.57"

; Padding
padded := Format("{:10}", "text")  ; "text      "
```

---

## Network Patterns

### HTTP GET Request
**Difficulty:** Intermediate | **Files:** `Utility_Libraries/Tier2_Intermediate/WinHttpRequest.ahk`

```ahk
whr := ComObject("WinHttp.WinHttpRequest.5.1")
whr.Open("GET", "https://api.example.com/data")
whr.Send()

if whr.Status = 200
    response := whr.ResponseText
else
    MsgBox("HTTP Error: " whr.Status)
```

### HTTP POST with JSON
**Difficulty:** Intermediate | **Files:** `Utility_Libraries/Tier2_Intermediate/`

```ahk
whr := ComObject("WinHttp.WinHttpRequest.5.1")
whr.Open("POST", "https://api.example.com/users")
whr.SetRequestHeader("Content-Type", "application/json")

jsonData := '{"name":"John","email":"john@example.com"}'
whr.Send(jsonData)

response := whr.ResponseText
MsgBox("Response: " response)
```

### WebSocket Connection
**Difficulty:** Advanced | **Files:** `Utility_Libraries/Tier3_Advanced/`

```ahk
#Include <WebSocket>

ws := WebSocket("wss://example.com/socket")
ws.OnOpen := (*) => MsgBox("Connected!")
ws.OnMessage := (data) => MsgBox("Received: " data)
ws.OnError := (err) => MsgBox("Error: " err)
ws.OnClose := (*) => MsgBox("Disconnected")

ws.Connect()
ws.Send("Hello, Server!")
```

---

## OOP Patterns

### Basic Class
**Difficulty:** Beginner | **Files:** All categories

```ahk
class Person {
    __New(name, age) {
        this.name := name
        this.age := age
    }

    Greet() {
        MsgBox("Hello, I'm " this.name)
    }

    Birthday() {
        this.age++
    }
}

john := Person("John", 30)
john.Greet()
john.Birthday()
```

### Property Getters/Setters
**Difficulty:** Intermediate | **Files:** `Utility_Libraries/Tier2_Intermediate/`

```ahk
class Person {
    __New(name) {
        this._name := name
        this._age := 0
    }

    name {
        get => this._name
        set => this._name := StrUpper(value)
    }

    age {
        get => this._age
        set {
            if value < 0
                throw ValueError("Age cannot be negative")
            this._age := value
        }
    }
}
```

### Inheritance
**Difficulty:** Intermediate | **Files:** `Utility_Libraries/Tier2_Intermediate/`

```ahk
class Animal {
    __New(name) {
        this.name := name
    }

    Speak() {
        MsgBox(this.name " makes a sound")
    }
}

class Dog extends Animal {
    Speak() {
        MsgBox(this.name " barks: Woof!")
    }

    Fetch() {
        MsgBox(this.name " fetches the ball")
    }
}

dog := Dog("Rex")
dog.Speak()   ; "Rex barks: Woof!"
dog.Fetch()   ; "Rex fetches the ball"
```

### Singleton Pattern
**Difficulty:** Advanced | **Files:** `Utility_Libraries/Tier3_Advanced/`

```ahk
class Config {
    static instance := ""

    static GetInstance() {
        if !this.instance
            this.instance := Config()
        return this.instance
    }

    __New() {
        if Config.instance
            throw Error("Use GetInstance()")
        this.settings := Map()
    }

    Set(key, value) => this.settings[key] := value
    Get(key) => this.settings[key]
}

; Usage
config := Config.GetInstance()
config.Set("theme", "dark")
```

---

## Async/Event Patterns

### Timer Events
**Difficulty:** Beginner | **Files:** All categories

```ahk
; Run function after delay
SetTimer(MyFunction, -5000)  ; Run once after 5 seconds

; Run function repeatedly
SetTimer(MyFunction, 1000)   ; Run every second

; Stop timer
SetTimer(MyFunction, 0)

MyFunction() {
    MsgBox("Timer triggered!")
}
```

### Event Callbacks
**Difficulty:** Intermediate | **Files:** `GUI_Applications/`

```ahk
class EventEmitter {
    __New() {
        this.handlers := Map()
    }

    On(event, handler) {
        if !this.handlers.Has(event)
            this.handlers[event] := []
        this.handlers[event].Push(handler)
    }

    Emit(event, data*) {
        if this.handlers.Has(event) {
            for handler in this.handlers[event]
                handler(data*)
        }
    }
}
```

---

## System Interaction

### Run External Program
**Difficulty:** Beginner | **Files:** `Utility_Libraries/Tier2_Intermediate/`

```ahk
; Run and continue
Run("notepad.exe")

; Run and wait
RunWait("ping.exe google.com")

; Run with PID
Run("notepad.exe",, , &PID)
MsgBox("PID: " PID)

; Run hidden
Run("script.bat",, "Hide")
```

### Registry Access
**Difficulty:** Intermediate | **Files:** `Utility_Libraries/Tier2_Intermediate/Registry.ahk`

```ahk
; Read value
value := RegRead("HKEY_CURRENT_USER\Software\MyApp", "Setting")

; Write value
RegWrite("MyValue", "REG_SZ", "HKEY_CURRENT_USER\Software\MyApp", "Setting")

; Delete
RegDelete("HKEY_CURRENT_USER\Software\MyApp", "OldSetting")
```

### Clipboard Operations
**Difficulty:** Beginner | **Files:** Multiple categories

```ahk
; Get clipboard text
text := A_Clipboard

; Set clipboard text
A_Clipboard := "New text"

; Wait for clipboard change
A_Clipboard := ""
Send("^c")
ClipWait(1)
if !ErrorLevel
    MsgBox("Copied: " A_Clipboard)
```

---

## Error Handling

### Try-Catch
**Difficulty:** Beginner | **Files:** All categories

```ahk
try {
    content := FileRead("nonexistent.txt")
} catch as err {
    MsgBox("Error: " err.Message)
}
```

### Custom Exceptions
**Difficulty:** Intermediate | **Files:** Multiple

```ahk
class ValidationError extends Error {
    __New(message, field := "") {
        super.__New(message)
        this.field := field
    }
}

ValidateEmail(email) {
    if !RegExMatch(email, "^[\w\.-]+@[\w\.-]+\.\w+$")
        throw ValidationError("Invalid email format", "email")
}

try {
    ValidateEmail("invalid")
} catch ValidationError as err {
    MsgBox("Validation failed for field: " err.field "`n" err.Message)
}
```

---

## Quick Reference

| Pattern | Category | Difficulty | Location |
|---------|----------|-----------|----------|
| Basic GUI | GUI | Beginner | GUI_Applications/Tier1 |
| Form Validation | GUI | Intermediate | GUI_Applications/Tier2 |
| Array Map/Filter | Data | Beginner | Data_Structures/Tier1 |
| JSON Parse | Data | Intermediate | Data_Structures/Tier2 |
| File Read | Utility | Beginner | Utility_Libraries/Tier1 |
| HTTP Request | Utility | Intermediate | Utility_Libraries/Tier2 |
| COM Objects | Utility | Advanced | Utility_Libraries/Tier3 |

---

[← Back to Training](README.md)
