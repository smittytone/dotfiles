---
name: prose-style
description: Enforce personal prose/writing style rules (e.g., no Oxford commas, one-line paragraphs in Markdown) whenever writing or editing Markdown, documentation, comments, or other prose. Use this whenever generating or revising written content, not just code.
---

# Prose Style Rules

Apply these rules whenever writing or editing prose: Markdown files, documentation, comments, commit messages, or other free-text content. Code identifiers, code blocks, and quoted/verbatim text (e.g., direct quotations, log output) are exempt.

This skill is a living checklist. When the user asks to add a new style rule, add it as a new numbered rule below, following the same format (a short imperative statement plus a concrete example). Do not remove or renumber existing rules when adding new ones — append to the end instead, unless the user asks you to change an existing rule.

## Rules

1. **No Oxford (serial) comma.** In a list of three or more items, omit the comma before the final "and" or "or".
   - Correct: "paragraphs, list items and headings"
   - Incorrect: "paragraphs, list items, and headings"

2. **One line per paragraph/list item in Markdown.** Format paragraphs and list items so each one is a single unwrapped line (no manual line breaks in the middle of a paragraph). Use blank lines only as separators between paragraphs, list items, headings and code blocks.

3. **Use "e.g.," for all variants of "for example" mid-sentence or in a parenthetical.** Always write "e.g.," (with the period after "g" and a following comma) rather than spelling out or abbreviating it another way. This does not apply when "For example" starts a sentence or independent clause (e.g., "For example, you might...") — retain that phrasing as-is; do not contract it to "e.g."
   - Correct: "some tools (e.g., GCC, Clang)"
   - Incorrect: "some tools (for example, GCC, Clang)", "some tools (e.g. GCC, Clang)", "some tools (eg. GCC, Clang)"
   - Also correct (sentence-starting, not contracted): "For example, you might use this for synchronisation."

4. **Use "i.e.," for all variants of "that is."** Always write "i.e.," (with periods after both "i" and "e" and a following comma). Never use "ie.", "ie", "i.e." (no comma), or "that is".
   - Correct: "the default value, i.e., zero"
   - Incorrect: "the default value, that is, zero", "the default value, ie. zero", "the default value, i.e. zero"

5. **Do not capitalise the first word of a clause after a colon.** Unless it starts a proper noun or an acronym, lowercase the word immediately following a colon, even if the clause is a complete sentence. This rule does not apply within structured function/method documentation in code comments (e.g., docstring `Args:`/`Returns:` parameter description lines), where existing capitalisation and spacing conventions should be left as-is.
   - Correct: "I could understand his point of view: that such behaviour was wrong."
   - Incorrect: "I could understand his point of view: That such behaviour was wrong."
   - Also correct (docstring param line, exempt from this rule): "char (string):  The character to show."

6. **Use British English spellings and conventions.** Prefer British spellings (e.g., "colour", "behaviour", "synchronisation", "licence" as a noun) over American ones (e.g., "color", "behavior", "synchronization", "license" as a noun), except where a proper noun, API name, code identifier or established American term must be preserved verbatim.
   - Correct: "the display's colour and behaviour"
   - Incorrect: "the display's color and behavior"

<!--
Add new rules below this line, following the same "short imperative rule + example" format.
Example of how to add a rule:

7. **Use "e.g.," instead of "for example."** Prefer the abbreviation "e.g.," over spelling out "for example" in running prose.
   - Correct: "some tools (e.g., GCC, Clang)"
   - Incorrect: "some tools (for example, GCC, Clang)"
-->
