# GUI Applications Training (77 Examples)

Learn AutoHotkey v2 GUI programming from basic controls to advanced frameworks.

## 📚 Learning Path

### Tier 1: Beginner (40 examples)
**Prerequisites:** None - start here!

**Core Concepts:**
- Creating a basic window with `.Gui()`
- Adding controls (`.AddButton()`, `.AddEdit()`, `.AddText()`)
- Handling events (`.OnEvent("Click", callback)`)
- Basic layout with positioning
- Reading control values (`.Value`)
- Message boxes and user input

**Key Files:**
- `GUI.ahk` - Complete GUI fundamentals
- `MsgBox2.ahk` - Enhanced message boxes
- `Color_Picker_Dialog.ahk` - Color selection dialog
- `MouseHook.ahk` - Mouse event handling
- `Custom.ahk` - Custom control examples

**Pattern Examples:**

#### Basic Window Creation
```ahk
myGui := Gui()
myGui.Title := "My First GUI"
myGui.Add("Text", , "Hello, World!")
myGui.Add("Button", "Default", "Click Me").OnEvent("Click", ButtonClick)
myGui.Show("w300 h200")

ButtonClick(ctrl, info) {
    MsgBox("Button was clicked!")
}
```

#### Reading Input
```ahk
myGui := Gui()
edit := myGui.Add("Edit", "w200")
myGui.Add("Button", "Default", "Submit").OnEvent("Click", Submit)
myGui.Show()

Submit(*) {
    MsgBox("You entered: " edit.Value)
}
```

### Tier 2: Intermediate (31 examples)
**Prerequisites:** Completed Tier 1, basic OOP knowledge

**Core Concepts:**
- ListView and TreeView controls
- Tab controls for multi-pane UIs
- Custom painting and drawing
- Event-driven architecture
- Menu systems
- Progress bars and status updates
- GUI options and styling

**Key Files:**
- `Scintilla.ahk` - Advanced text editor component
- `Toolbar.ahk` - Toolbar implementation
- `Idler.ahk` - Idle detection GUI
- `Progress2.ahk` - Enhanced progress bars
- `Debug.ahk` - Debug GUI utilities

**Pattern Examples:**

#### ListView with Data
```ahk
myGui := Gui()
lv := myGui.Add("ListView", "r10 w500", ["Name", "Email", "Status"])
lv.Add(, "John Doe", "john@example.com", "Active")
lv.Add(, "Jane Smith", "jane@example.com", "Inactive")
lv.OnEvent("DoubleClick", EditRow)
myGui.Show()

EditRow(ctrl, rowNum) {
    MsgBox("Editing row: " rowNum)
}
```

#### Tab Control
```ahk
myGui := Gui()
tab := myGui.Add("Tab3", , ["General", "Advanced", "About"])

tab.UseTab(1)
myGui.Add("Text", "xm", "General Settings:")
myGui.Add("Edit", "w300")

tab.UseTab(2)
myGui.Add("Text", "xm", "Advanced Options:")
myGui.Add("CheckBox", , "Enable debugging")

tab.UseTab()  ; End tab section
myGui.Show()
```

### Tier 3: Advanced (6 examples)
**Prerequisites:** Strong OOP, completed Tier 2

**Core Concepts:**
- Custom GUI frameworks
- WebView2 integration
- Scintilla editor control
- Advanced custom controls
- Complex toolbar systems
- Multi-window coordination
- State management patterns

**Key Files:**
- `Webview2.ahk` - Modern web-based UI
- `Toolbar.ahk` - Full toolbar implementation
- `_Class_Toolbar.ahk` - OOP toolbar framework
- `Class_Rebar.ahk` - Rebar control system
- `Class_Toolbar.ahk` - Advanced toolbar class

**Pattern Examples:**

#### WebView2 Integration
```ahk
#Requires AutoHotkey v2.0
#Include <WebView2>

myGui := Gui()
wv := myGui.Add("ActiveX", "w800 h600", "Shell.Explorer")
myGui.Show()

; Load webpage
wv.Navigate("https://example.com")
```

#### Custom Control Class
```ahk
class CustomButton extends Gui.Button {
    __New(guiObj, options, text) {
        super.__New(guiObj, options, text)
        this.bgColor := "0x3498db"
        this.OnEvent("Click", this.Click.Bind(this))
    }

    Click(ctrl, info) {
        this.bgColor := (this.bgColor = "0x3498db") ? "0xe74c3c" : "0x3498db"
        this.Redraw()
    }
}
```

## 🎯 Common Patterns

### Event Handling Patterns

#### Method 1: Function Reference
```ahk
myGui := Gui()
myGui.Add("Button", , "Click Me").OnEvent("Click", MyHandler)
myGui.Show()

MyHandler(ctrl, info) {
    MsgBox("Button clicked!")
}
```

#### Method 2: Lambda/Fat Arrow
```ahk
myGui := Gui()
myGui.Add("Button", , "Click Me").OnEvent("Click", (*)=> MsgBox("Clicked!"))
myGui.Show()
```

#### Method 3: Bound Method
```ahk
class MyApp {
    __New() {
        this.gui := Gui()
        this.gui.Add("Button", , "Click").OnEvent("Click", this.HandleClick.Bind(this))
        this.gui.Show()
    }

    HandleClick(ctrl, info) {
        MsgBox("Handled by class method!")
    }
}
```

### Layout Patterns

#### Absolute Positioning
```ahk
myGui := Gui()
myGui.Add("Text", "x10 y10", "Name:")
myGui.Add("Edit", "x60 y10 w200")
myGui.Add("Button", "x10 y40", "Submit")
myGui.Show()
```

#### Relative Positioning (Recommended)
```ahk
myGui := Gui()
myGui.Add("Text", "xm ym", "Name:")
myGui.Add("Edit", "x+10 yp w200")
myGui.Add("Text", "xm y+10", "Email:")
myGui.Add("Edit", "x+10 yp w200")
myGui.Add("Button", "xm y+20 Section", "Submit")
myGui.Show()
```

#### Section-Based Layout
```ahk
myGui := Gui()

; Left section
myGui.Add("Text", "xm ym Section", "Left Panel:")
myGui.Add("ListBox", "xs w200 r10", ["Item 1", "Item 2"])

; Right section
myGui.Add("Text", "x+20 ym Section", "Right Panel:")
myGui.Add("Edit", "xs w300 r10")

myGui.Show()
```

## 🔧 Common Tasks

### Creating a Form
See: `Tier1_Beginner/GUI.ahk`

### Building a Settings Dialog
See: `Tier2_Intermediate/Progress2.ahk`

### Implementing Dark Mode
See: `Tier1_Beginner/Color_Picker_Dialog.ahk`

### Data Entry with ListView
See: `Tier2_Intermediate/Scintilla.ahk`

### Custom Toolbar
See: `Tier3_Advanced/Toolbar.ahk`

### WebView Integration
See: `Tier3_Advanced/Webview2.ahk`

## 📖 Key Concepts Reference

| Concept | Difficulty | Example Files |
|---------|-----------|---------------|
| Basic Window | Beginner | GUI.ahk |
| Button Events | Beginner | All Tier 1 |
| Text Input | Beginner | GUI.ahk, Editable.ahk |
| ListView | Intermediate | Scintilla.ahk |
| TreeView | Intermediate | Multiple |
| Tab Control | Intermediate | Multiple |
| Toolbar | Advanced | Toolbar.ahk |
| WebView2 | Advanced | Webview2.ahk |
| Custom Controls | Advanced | All Tier 3 |

## 🚀 Project Ideas

After completing the tiers, try building:

**Beginner:**
- Simple calculator
- Note-taking app
- Color picker tool
- File searcher GUI

**Intermediate:**
- Todo list manager
- Settings manager
- Log file viewer
- Multi-tab notepad

**Advanced:**
- Code editor
- File manager
- Dashboard application
- Multi-window suite

## 🔗 Related Resources

- [Data Structures](../Data_Structures/README.md) - For managing GUI data
- [Utility Libraries](../Utility_Libraries/README.md) - Helper functions
- [Pattern Index](../PATTERN_INDEX.md) - Quick reference

---

[← Back to Training](../README.md)
