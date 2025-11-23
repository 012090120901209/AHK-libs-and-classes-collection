# AutoHotkey v2 Training Examples

A comprehensive collection of **225 curated AutoHotkey v2 examples** organized by functional domain and difficulty level for systematic learning.

## 📚 Directory Structure

```
Training/
├── GUI_Applications/          (77 examples)
│   ├── Tier1_Beginner/        (40 files) - Basic GUI controls and events
│   ├── Tier2_Intermediate/    (31 files) - Complex layouts and interactions
│   └── Tier3_Advanced/        (6 files)  - Custom frameworks and advanced UI
│
├── Data_Structures/           (43 examples)
│   ├── Tier1_Beginner/        (31 files) - Arrays, Maps, Objects basics
│   ├── Tier2_Intermediate/    (10 files) - JSON, XML, YAML parsing
│   └── Tier3_Advanced/        (2 files)  - Trees, Graphs, Hash tables
│
└── Utility_Libraries/         (105 examples)
    ├── Tier1_Beginner/        (40 files) - File I/O, strings, math
    ├── Tier2_Intermediate/    (35 files) - HTTP, sockets, processes
    └── Tier3_Advanced/        (30 files) - COM, DLL, WinAPI interop
```

## 🎯 Learning Path

### Start Here: Tier 1 (Beginner)
**Prerequisites:** Basic programming concepts, AHK v2 installed

**Focus Areas:**
- GUI basics (buttons, text, events)
- Array and Map operations
- File reading/writing
- String manipulation
- Basic hotkeys

**Recommended Files:**
- `GUI_Applications/Tier1_Beginner/GUI.ahk` - GUI fundamentals
- `Data_Structures/Tier1_Beginner/Array.ahk` - Array operations
- `Utility_Libraries/Tier1_Beginner/FileCountLines.ahk` - File I/O

### Progress To: Tier 2 (Intermediate)
**Prerequisites:** Completed Tier 1, familiar with classes

**Focus Areas:**
- Event-driven architecture
- Data parsing (JSON, XML, CSV)
- Network operations (HTTP, WebSocket)
- Complex GUI layouts (ListView, TreeView, Tabs)
- Hotkey context sensitivity

**Recommended Files:**
- `GUI_Applications/Tier2_Intermediate/Scintilla.ahk` - Advanced text editor
- `Data_Structures/Tier2_Intermediate/XML.ahk` - XML parsing
- `Utility_Libraries/Tier2_Intermediate/Socket.ahk` - Network sockets

### Master With: Tier 3 (Advanced)
**Prerequisites:** Solid OOP understanding, Tier 2 completed

**Focus Areas:**
- COM/CLR interop
- Custom GUI frameworks
- Advanced data structures
- WinAPI integration
- Design patterns

**Recommended Files:**
- `GUI_Applications/Tier3_Advanced/Webview2.ahk` - Modern web UI
- `Data_Structures/Tier3_Advanced/HashTable.ahk` - Custom hash tables
- `Utility_Libraries/Tier3_Advanced/CLR.ahk` - .NET integration

## 📊 Statistics

| Category | Beginner | Intermediate | Advanced | Total |
|----------|----------|--------------|----------|-------|
| GUI Applications | 40 | 31 | 6 | **77** |
| Data Structures | 31 | 10 | 2 | **43** |
| Utility Libraries | 40 | 35 | 30 | **105** |
| **TOTAL** | **111** | **76** | **38** | **225** |

## 🔍 How to Use These Examples

### 1. **Read the Code**
Each example is a complete, runnable script demonstrating specific AHK v2 concepts.

### 2. **Run and Experiment**
```bash
# Run any .ahk file
AutoHotkey.exe path/to/example.ahk

# Or double-click the file in Windows Explorer
```

### 3. **Modify and Learn**
- Change parameters
- Add new features
- Combine concepts from multiple examples
- Break things and fix them

### 4. **Build Your Own**
Use these examples as templates for your own scripts.

## 📖 Category Guides

### GUI_Applications (77 examples)
**What You'll Learn:**
- Window creation and management
- Control types (Button, Edit, ListBox, ListView, TreeView, Tab, etc.)
- Event handling and callbacks
- Layout management
- Dark mode and theming
- Custom controls
- Multi-window applications

**Key Patterns:**
- `.Gui()` constructor and options
- `.AddControl()` methods
- `.OnEvent()` binding
- Layout positioning (`xm`, `Section`, `ym`)
- Custom drawing and painting

[See detailed guide →](GUI_Applications/README.md)

### Data_Structures (43 examples)
**What You'll Learn:**
- Array manipulation and iteration
- Map/Object operations
- Data transformation pipelines
- Parsing structured data (JSON, XML, YAML, CSV)
- Sorting and searching algorithms
- Custom data structures (Stack, Queue, Tree, Graph)

**Key Patterns:**
- Functional array methods
- Map construction and iteration
- JSON/XML parsing
- Data validation
- Deep cloning and comparison

[See detailed guide →](Data_Structures/README.md)

### Utility_Libraries (105 examples)
**What You'll Learn:**
- File and directory operations
- String processing and regex
- Math and type operations
- HTTP and network requests
- Process management
- System information
- COM object interaction
- DLL calls and WinAPI
- Cryptography and security
- Design patterns

**Key Patterns:**
- Class design and OOP
- Error handling
- API wrapping
- Resource management
- Synchronization primitives

[See detailed guide →](Utility_Libraries/README.md)

## 🚀 Quick Start

1. **Choose Your Level**
   - New to AHK v2? Start with `Tier1_Beginner`
   - Experienced? Jump to `Tier2_Intermediate` or `Tier3_Advanced`

2. **Pick a Category**
   - Building GUIs? → `GUI_Applications/`
   - Working with data? → `Data_Structures/`
   - Need utilities? → `Utility_Libraries/`

3. **Find Examples**
   - Browse the tier directories
   - Check the category README for recommendations
   - Use the [Pattern Index](PATTERN_INDEX.md) for specific concepts

4. **Learn and Build**
   - Read the code comments
   - Run the examples
   - Experiment with modifications
   - Build your own variations

## 📝 Code Quality Standards

All examples in this collection meet these criteria:

✓ **AHK v2 Compliance** - Uses modern v2 syntax
✓ **Runnable** - Executes without errors
✓ **Well-Commented** - Key concepts explained
✓ **Focused** - Demonstrates specific patterns
✓ **Best Practices** - Follows AHK v2 conventions

## 🔗 Additional Resources

- **Official Docs**: https://www.autohotkey.com/docs/v2/
- **Pattern Index**: [PATTERN_INDEX.md](PATTERN_INDEX.md)
- **Concept Map**: [CONCEPTS.md](CONCEPTS.md)
- **Examples Collection**: [../examples-2024/](../examples-2024/)

## 📄 License

All examples are sourced from open-source AutoHotkey projects. See individual files for attribution and licensing.

---

**Ready to learn?** Start with `GUI_Applications/Tier1_Beginner/` or jump to your skill level!
