# flaberd-french-knowledge-base

A personal knowledge base for tracking my French learning progress — built and maintained by an AI agent (Claude Code), not by hand.

## Why this exists

I take French lessons with a tutor and wanted to practice grammar with ChatGPT/Claude between sessions. Re-explaining every time which topics I'd already covered got tedious. So instead of retyping context, I built a system that turns my lesson notes into a structured, queryable knowledge base — which then drives exercise generation matched to my actual progress.

## How it works

1. **Drop a PDF** — after each lesson, I add the tutor's PDF conspectus to `lessons/`.
2. **Agent processes it** — Claude Code reads the PDF, creates a markdown copy for the archive, and extracts new vocabulary and grammar points.
3. **Merge, don't duplicate** — before creating a new file, the agent checks whether a file on that topic already exists and updates it. A new file is created only if the topic is genuinely new.
4. **Structured output** — extracted data lands in `vocabulary/` (organized by part of speech: nouns, verbs, adjectives, etc.) and `grammar/`, not scattered across lesson-dated notes.

Full rules the agent follows: [`AGENTS.md`](./AGENTS.md) (also used by other agents via [`CLAUDE.md`](./CLAUDE.md)). Detailed processing steps: [`instructions/workflow.md`](./instructions/workflow.md).

## Structure

```
lessons/        raw lesson records — historical, never edited after the fact
vocabulary/      canonical vocabulary, grouped by part of speech
grammar/         canonical grammar rules and patterns
instructions/    the agent's processing workflow
resources/       supporting reference material
```

## Note

This is a personal learning tool, not a production project — no tests, no CI, built for one user (me). Sharing it because a few people found the workflow itself interesting.