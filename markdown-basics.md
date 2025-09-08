# 📘 What is Markdown?
Markdown is a lightweight **markup language** used to format text.  
It’s designed to be easy to write and easy to read in plain text, while still converting nicely into **HTML**, **PDF**, or **docs**.

Markdown files usually use the extension:

- `.md` (most common)  
- `.markdown` (less common)

---

# 🛠 How to Create a Markdown File
1. Open any text editor (Notepad, VS Code, Sublime, Obsidian, etc.).  
2. Save a file with the extension `.md`, e.g., `notes.md`.  
3. Write Markdown syntax inside.

---

# ✍️ Basic Markdown Syntax

## Headings
```md
# Heading 1
## Heading 2
### Heading 3
```

## Emphasis
```md
*italic*   or   _italic_
**bold**   or   __bold__
~~strikethrough~~
```

## Lists
**Unordered list:**
```md
- Item 1
- Item 2
  - Subitem
```

**Ordered list:**
```md
1. First
2. Second
3. Third
```

## Links & Images
```md
[OpenAI](https://openai.com)
![Alt text](https://example.com/image.png)
```

## Code
**Inline code:**
```md
Here is `inline code`.
```

**Code block:**
```python
print("Hello Markdown!")
```

## Blockquotes
```md
> This is a blockquote.
```

## Tables
```md
| Column A | Column B |
|----------|----------|
| Value 1  | Value 2  |
| Value 3  | Value 4  |
```

---

# 🎨 Extra Features (depending on platform)

- **Task lists:**
```md
- [x] Done task
- [ ] Pending task
```

- **Footnotes (some Markdown engines):**
```md
This is a note.[^1]

[^1]: Footnote text.
```

- **Math (with extensions like KaTeX/MathJax):**
```md
$$ E = mc^2 $$
```

---

# 📂 Where You Can Use Markdown
- **GitHub & GitLab** → README files, docs.  
- **Static site generators** → Jekyll, Hugo, MkDocs.  
- **Note-taking apps** → Obsidian, Notion (supports Markdown import/export), Logseq.  
- **Docs/blogs** → Many blogging platforms.  
- **Converters** → You can convert `.md` to PDF, HTML, DOCX using tools like `pandoc`.

---

# ⚡ Tools to Make Working with Markdown Easier
- **Editors**: VS Code (with Markdown preview), Typora, Obsidian.  
- **Converters**: `pandoc`, `grip`, or `markdown-it`.  
- **Previewers**: GitHub (auto-renders `.md`), Markdown apps with live preview.
