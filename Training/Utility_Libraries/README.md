# Utility Libraries Training (105 Examples)

Learn to build reusable utilities, work with system APIs, and master advanced AutoHotkey v2 techniques.

## 📚 Learning Path

### Tier 1: Beginner (40 examples)
**Prerequisites:** Basic AHK v2 syntax

**Core Concepts:**
- File I/O operations
- String manipulation
- Math and type utilities
- Basic system information
- Simple function libraries
- Error handling basics

**Key Files:**
- `FileCountLines.ahk` - Count lines in files
- `String.ahk` - String utilities
- `Math.ahk` - Mathematical functions
- `Hash.ahk` - Hash generation
- `Thread.ahk` - Thread management basics

**Pattern Examples:**

#### File Operations
```ahk
; Read entire file
content := FileRead("myfile.txt")

; Read line by line
Loop Read, "myfile.txt" {
    line := A_LoopReadLine
    MsgBox("Line " A_Index ": " line)
}

; Write file
FileAppend("Hello, World!`n", "output.txt")

; File exists check
if FileExist("myfile.txt")
    MsgBox("File exists!")

; Delete file
if FileExist("temp.txt")
    FileDelete("temp.txt")

; Directory operations
if !DirExist("mydir")
    DirCreate("mydir")

; List files in directory
Loop Files, "C:\MyFolder\*.txt" {
    MsgBox("Found: " A_LoopFileName)
}
```

#### String Utilities
```ahk
; Common string operations
str := "Hello, World!"

; Length
len := StrLen(str)  ; 13

; Substring
sub := SubStr(str, 1, 5)  ; "Hello"

; Find
pos := InStr(str, "World")  ; 8

; Replace
newStr := StrReplace(str, "World", "AHK")  ; "Hello, AHK!"

; Split
parts := StrSplit(str, ",")  ; ["Hello", " World!"]

; Upper/Lower
upper := StrUpper(str)  ; "HELLO, WORLD!"
lower := StrLower(str)  ; "hello, world!"

; Trim
trimmed := Trim("  spaces  ")  ; "spaces"

; RegEx
if RegExMatch(str, "W\w+", &match)
    MsgBox("Found: " match[0])  ; "World"
```

#### Math Functions
```ahk
; Basic arithmetic
sum := 10 + 5      ; 15
diff := 10 - 5     ; 5
product := 10 * 5  ; 50
quotient := 10 / 5 ; 2
remainder := 10 // 3  ; 1 (modulo)
power := 10 ** 2   ; 100

; Built-in math functions
abs := Abs(-5)        ; 5
ceil := Ceil(4.3)     ; 5
floor := Floor(4.7)   ; 4
round := Round(4.5)   ; 5
sqrt := Sqrt(16)      ; 4
max := Max(1, 5, 3)   ; 5
min := Min(1, 5, 3)   ; 1

; Random numbers
random := Random(1, 100)  ; Random int 1-100
```

### Tier 2: Intermediate (35 examples)
**Prerequisites:** Completed Tier 1, basic networking concepts

**Core Concepts:**
- HTTP requests and responses
- Socket programming
- Process management
- Registry operations
- Windows services
- COM object basics
- Advanced file operations
- Asynchronous operations

**Key Files:**
- `Socket.ahk` - Network socket programming
- `WinHttpRequest.ahk` - HTTP client
- `Services.ahk` - Windows service management
- `Registry.ahk` - Registry access
- `StdoutToVar.ahk` - Capture command output

**Pattern Examples:**

#### HTTP Requests
```ahk
; Simple GET request
whr := ComObject("WinHttp.WinHttpRequest.5.1")
whr.Open("GET", "https://api.example.com/data")
whr.Send()
response := whr.ResponseText
MsgBox(response)

; POST with JSON
whr := ComObject("WinHttp.WinHttpRequest.5.1")
whr.Open("POST", "https://api.example.com/users")
whr.SetRequestHeader("Content-Type", "application/json")
jsonData := '{"name":"John","age":30}'
whr.Send(jsonData)
MsgBox("Status: " whr.Status " " whr.StatusText)
```

#### Process Management
```ahk
; Run program
Run("notepad.exe",, , &PID)
MsgBox("Started process with PID: " PID)

; Run and wait
RunWait("ping.exe google.com",, , &PID)
MsgBox("Process completed")

; Check if process exists
if ProcessExist("notepad.exe")
    MsgBox("Notepad is running")

; Close process
if PID := ProcessExist("notepad.exe")
    ProcessClose(PID)

; Get process name
name := ProcessGetName(PID)
```

#### Registry Operations
```ahk
; Read registry value
value := RegRead("HKEY_CURRENT_USER\Software\MyApp", "Setting")

; Write registry value
RegWrite("MyValue", "REG_SZ", "HKEY_CURRENT_USER\Software\MyApp", "Setting")

; Delete registry key
RegDelete("HKEY_CURRENT_USER\Software\MyApp", "OldSetting")

; Check if key exists
try {
    value := RegRead("HKEY_CURRENT_USER\Software\MyApp", "Setting")
    exists := true
} catch {
    exists := false
}
```

### Tier 3: Advanced (30 examples)
**Prerequisites:** Strong programming background, Tier 2 completed

**Core Concepts:**
- COM/ActiveX programming
- .NET CLR integration
- DLL calls and WinAPI
- Cryptography and security
- Advanced WinAPI functions
- Memory management
- Low-level operations
- Inter-process communication

**Key Files:**
- `CLR.ahk` - .NET Common Language Runtime
- `Cipher.ahk` - Encryption and decryption
- `Crypt.ahk` - Cryptographic operations
- `Class_NVML.ahk` - NVIDIA Management Library
- `Chrome.ahk` - Chrome DevTools Protocol

**Pattern Examples:**

#### COM Object Usage
```ahk
; Excel automation
xl := ComObject("Excel.Application")
xl.Visible := true
wb := xl.Workbooks.Add()
ws := wb.Worksheets(1)

; Write data
ws.Cells(1, 1).Value := "Name"
ws.Cells(1, 2).Value := "Age"
ws.Cells(2, 1).Value := "John"
ws.Cells(2, 2).Value := 30

; Save and close
wb.SaveAs(A_ScriptDir "\output.xlsx")
wb.Close()
xl.Quit()
```

#### .NET CLR Integration
```ahk
; Load CLR
clr := CLR_Start()

; Use .NET classes
StringBuilder := clr.GetType("System.Text.StringBuilder")
sb := StringBuilder.CreateInstance()
sb.Append("Hello, ")
sb.Append("World!")
result := sb.ToString()
MsgBox(result)

; Use .NET methods
DateTime := clr.GetType("System.DateTime")
now := DateTime.Now
formatted := now.ToString("yyyy-MM-dd HH:mm:ss")
MsgBox("Current time: " formatted)
```

#### DLL Calls and WinAPI
```ahk
; Simple DLL call
result := DllCall("MessageBox"
    , "Ptr", 0        ; hWnd
    , "Str", "Hello!"  ; lpText
    , "Str", "Title"   ; lpCaption
    , "UInt", 0)       ; uType

; Get system metrics
screenWidth := DllCall("GetSystemMetrics", "Int", 0)  ; SM_CXSCREEN
screenHeight := DllCall("GetSystemMetrics", "Int", 1) ; SM_CYSCREEN
MsgBox("Screen: " screenWidth "x" screenHeight)

; Advanced: Create structure
VarSetStrCapacity(&OSVersionInfo, 284, 0)
NumPut("UInt", 284, OSVersionInfo)
DllCall("GetVersionEx", "Ptr", &OSVersionInfo)
MajorVersion := NumGet(OSVersionInfo, 4, "UInt")
MinorVersion := NumGet(OSVersionInfo, 8, "UInt")
```

#### Cryptography
```ahk
; Hash a string (SHA256)
text := "Hello, World!"
hash := HashString(text, "SHA256")
MsgBox("SHA256: " hash)

; Encrypt/Decrypt (example pattern)
class SimpleCrypto {
    static Encrypt(text, key) {
        ; XOR encryption (simple example)
        result := ""
        Loop StrLen(text) {
            char := Ord(SubStr(text, A_Index, 1))
            keyChar := Ord(SubStr(key, Mod(A_Index - 1, StrLen(key)) + 1, 1))
            result .= Chr(char ^ keyChar)
        }
        return result
    }

    static Decrypt(encrypted, key) {
        ; XOR is symmetric
        return this.Encrypt(encrypted, key)
    }
}
```

## 🎯 Common Patterns

### Error Handling
```ahk
; Try-catch pattern
try {
    content := FileRead("nonexistent.txt")
} catch as err {
    MsgBox("Error: " err.Message)
    return
}

; File operation with error handling
SafeFileWrite(filename, content) {
    try {
        FileAppend(content, filename)
        return true
    } catch as err {
        MsgBox("Failed to write file: " err.Message)
        return false
    }
}
```

### Class-Based Utilities
```ahk
class StringUtils {
    static IsPalindrome(str) {
        str := StrReplace(str, " ", "")
        str := StrLower(str)
        reversed := ""
        Loop StrLen(str)
            reversed := SubStr(str, A_Index, 1) reversed
        return str = reversed
    }

    static CountWords(str) {
        words := StrSplit(Trim(str), " ", "`t`r`n")
        return words.Length
    }

    static Truncate(str, maxLen, suffix := "...") {
        if StrLen(str) <= maxLen
            return str
        return SubStr(str, 1, maxLen - StrLen(suffix)) suffix
    }
}
```

### Design Patterns

#### Singleton
```ahk
class DatabaseConnection {
    static instance := ""

    static GetInstance() {
        if !this.instance
            this.instance := DatabaseConnection()
        return this.instance
    }

    __New() {
        if DatabaseConnection.instance
            throw Error("Use GetInstance() instead")
        ; Initialize connection
        this.connected := true
    }
}
```

#### Factory
```ahk
class ShapeFactory {
    static Create(type, params*) {
        switch type {
            case "circle":
                return Circle(params*)
            case "rectangle":
                return Rectangle(params*)
            case "triangle":
                return Triangle(params*)
            default:
                throw Error("Unknown shape type: " type)
        }
    }
}

class Circle {
    __New(radius) {
        this.radius := radius
    }
    Area() => 3.14159 * this.radius ** 2
}
```

## 🔧 Common Tasks

### Read/Write Files
See: `Tier1_Beginner/FileCountLines.ahk`

### HTTP API Client
See: `Tier2_Intermediate/WinHttpRequest.ahk`

### Process Automation
See: `Tier2_Intermediate/Services.ahk`

### COM Object Usage
See: `Tier3_Advanced/CLR.ahk`

### Encryption
See: `Tier3_Advanced/Cipher.ahk`

## 📖 Key Concepts Reference

| Concept | Difficulty | Example Files |
|---------|-----------|---------------|
| File I/O | Beginner | FileCountLines.ahk |
| String Utils | Beginner | String.ahk |
| Math | Beginner | Math.ahk |
| HTTP | Intermediate | WinHttpRequest.ahk |
| Sockets | Intermediate | Socket.ahk |
| Registry | Intermediate | Registry.ahk |
| COM | Advanced | CLR.ahk |
| DLL Calls | Advanced | Multiple |
| Crypto | Advanced | Cipher.ahk, Crypt.ahk |

## 🚀 Project Ideas

**Beginner:**
- File renamer utility
- Text file analyzer
- Simple calculator
- System info viewer

**Intermediate:**
- HTTP API client library
- Log file monitor
- Registry backup tool
- Process manager

**Advanced:**
- COM automation suite
- Encryption tool
- System monitor
- Plugin system with DLL loading

## 🔗 Related Resources

- [GUI Applications](../GUI_Applications/README.md) - Build UIs for utilities
- [Data Structures](../Data_Structures/README.md) - Data handling
- [Pattern Index](../PATTERN_INDEX.md) - Quick reference

---

[← Back to Training](../README.md)
