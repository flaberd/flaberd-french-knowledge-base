# Workflow

## Purpose

This file defines the required workflow for processing French lesson materials and updating the knowledge base.

The agent must follow this workflow whenever a new lesson source is added to the repository.

## Input

New lesson source files must be placed in:

```text
resources/raw/
```

A source may be:

* PDF;
* image;
* scanned document;
* text file;
* lesson notes;
* another supported lesson format.

The agent must process only the source file explicitly requested by the user unless instructed otherwise.

After successful processing, the original source file must be moved to:

```text
resources/processed/
```

The original source file must always be preserved.

---

## Required Processing Flow

When processing a new lesson, the agent must:

1. Read the source file from `resources/raw/`.
2. Extract and preserve the lesson content.
3. Determine the next lesson number.
4. Create a structured Markdown lesson.
5. Save the lesson in `lessons/`.
6. Create or update the relevant grammar topic files.
7. Create or update the relevant vocabulary entries.
8. Update all affected indexes.
9. Move the processed source file from `resources/raw/` to `resources/processed/`.
10. Verify that no duplicate files or entries were created.


## Lesson File

The Markdown version of the lesson must be saved in:

```text
lessons/
```

Lesson files must use a sequential five-digit number:

```text
lesson_00001.md
lesson_00002.md
lesson_00003.md
```

The next lesson number must be determined from the lesson files.

Each lesson file should preserve the structure and content of the original source as accurately as possible.

The lesson record may contain:

* lesson title;
* lesson date, if available;
* grammar topics;
* vocabulary;
* examples;
* exercises;
* pronunciation notes;
* teacher comments;
* corrections;
* other material explicitly present in the source.

Do not add unrelated French theory to make the lesson appear more complete.

Update lessons/index.md

## Grammar Processing

Grammar topic files are stored in:

```text
grammar/
```

Each grammar topic must have its own Markdown file.

The filename must represent the grammar topic and use lowercase kebab-case.

Examples:

```text
grammar/negation.md
grammar/possessive-adjectives.md
grammar/passe-compose.md
grammar/direct-object-pronouns.md
```

When a grammar topic is found in a lesson, the agent must:

1. Search for an existing file covering the same topic.
2. Update the existing file when it already exists.
3. Create a new file only when the topic is genuinely new.
4. Add only the information studied in the lesson.
5. Preserve useful examples from the lesson.
6. Link the grammar topic to the lesson where appropriate.

Do not create multiple files for minor naming variations of the same grammar topic.

Update grammar/index.md

## Vocabulary Processing

All studied words are stored in:

```text
vocabulary/
```

Each word must have its own Markdown file.

Words must be organized by part of speech.

```text
vocabulary/
├── index.md
├── adjectives/
├── adverbs/
├── conjunctions/
├── determiners/
├── interjections/
├── nouns/
├── numbers/
├── prepositions/
├── pronouns/
└── verbs/
```

The main vocabulary index:

```text
vocabulary/index.md
```

must contain links only to the indexes of the part-of-speech directories.

Individual word links must not be added directly to the main vocabulary index.

## Part-of-Speech Indexes

Each part-of-speech directory must contain its own:

```text
index.md
```

Example:

```text
vocabulary/nouns/index.md
vocabulary/adjectives/index.md
vocabulary/adverbs/index.md
```

Each local index must contain links to all word files in that directory.

Links must be sorted alphabetically by the French base form.

When a new vocabulary entry is created, the agent must immediately add it to the correct local index.

## Word Entries

Words must be added according to the applicable vocabulary template.

Before creating a new word file, the agent must:

1. Search for an existing entry with the same base form.
2. Check whether the word is already stored under another part of speech.
3. Update the existing entry when appropriate.
4. Create a new file only when no suitable canonical entry exists.

Create or update the entry according to the appropriate template located in instructions/templates/word.md

Do not create separate files for regular gender or plural forms when they belong to the same lexical entry.

## Verb Organization

Verb entries are stored in:

```text
vocabulary/verbs/
```

Verbs must be divided into three groups:

```text
vocabulary/verbs/
├── index.md
├── group-1/
│   └── index.md
├── group-2/
│   └── index.md
└── group-3/
    └── index.md
```

The file:

```text
vocabulary/verbs/index.md
```

must contain links to the three verb-group indexes.

Example:

```markdown
- [Group 1](group-1/index.md)
- [Group 2](group-2/index.md)
- [Group 3](group-3/index.md)
```

Each verb must be placed in the correct group directory:

```text
vocabulary/verbs/group-1/parler.md
vocabulary/verbs/group-2/finir.md
vocabulary/verbs/group-3/venir.md
```

Each group index must contain links to all verbs in that group.

Verb links must be sorted alphabetically.

## Verb Entries

Follow "Word Entries" rules

## Handling Repeated Content

When a lesson repeats previously studied material:

* do not create duplicate files;
* do not create duplicate sections;
* add genuinely new information to the existing entry;
* add the new lesson as another source reference when useful;
* preserve the lesson record even when its content is repetitive.

## Index Updates

The agent must update every affected index after creating a new file.

This may include:

* the main repository `index.md`;
* grammar indexes, if used;
* `vocabulary/index.md`;
* part-of-speech indexes;
* verb group indexes;
* the lessons index, if used.

A file creation task is incomplete until the required index links have been added.

## Source Preservation

The Markdown lesson file must distinguish between:

* content explicitly present in the source;
* corrections made by the teacher;
* corrections made by the agent;
* supplementary explanations.

Do not silently rewrite incorrect source content as though it was originally correct.

If text is unreadable or ambiguous, mark it clearly instead of guessing.

## Final Verification

Before completing the task, verify that:

* the source file was fully processed;
* the lesson file uses the correct sequential number;
* the lesson file was saved in `lessons/`;
* grammar files were created or updated as needed;
* vocabulary files were created or updated as needed;
* verbs were placed in the correct group;
* all required indexes were updated;
* links are valid;
* entries are alphabetically sorted;
* no duplicate topic or word files were created;
* no unsupported information was added.
