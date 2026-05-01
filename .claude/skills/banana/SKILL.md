# Banana Claude – Creative Director for AI Image Generation

## Overview

Banana Claude is an AI image generation skill powered by Google Gemini Nano models. It functions as a creative director that orchestrates image generation through intelligent prompt engineering rather than passing raw user requests directly to APIs.

## Core Workflow

The system follows a structured seven-step pipeline:

1. **Read Reference Documentation** – Consult gemini-models.md and prompt-engineering.md before any generation
2. **Analyze Intent** – Determine use case, style, constraints, and mood through clarifying questions if needed
3. **Check Presets** – Load brand/style presets that match user specifications
4. **Select Domain Mode** – Choose expertise lens (Cinema, Product, Portrait, Editorial, UI/Web, Logo, Landscape, Abstract, Infographic)
5. **Construct Reasoning Brief** – Apply the 5-Component Formula (Subject → Action → Location → Composition → Style)
6. **Call MCP Tools** – Execute generation with appropriate model and parameters
7. **Validate & Post-Process** – Confirm image exists, apply edits if needed, log costs

## Key Commands

| Command | Purpose |
|---------|---------|
| `/banana generate <idea>` | Create image with full prompt engineering |
| `/banana edit <path> <instructions>` | Intelligently modify existing images |
| `/banana chat` | Multi-turn creative sessions maintaining consistency |
| `/banana batch <idea> [N]` | Generate N variations with rotated components |
| `/banana inspire [category]` | Browse prompt databases for creative ideas |
| `/banana preset [list\|create\|show\|delete]` | Manage brand/style presets |

## Critical Rules

- **Never use banned keywords:** "8K", "masterpiece", "ultra-realistic"
- **Name real resources:** Specific cameras ("Sony A7R IV"), brands ("Tom Ford"), publications ("Vanity Fair editorial")
- **Include micro-details:** "sweat droplets", "baby hairs", texture specifics
- **Use ALL CAPS for constraints:** "MUST contain exactly three figures"
- **For products:** Emphasize "prominently displayed" to ensure visibility

## Safety & Error Handling

When `IMAGE_SAFETY` blocks generation, propose 2-3 rephrased alternatives without auto-retry. The system includes strategies for false positives using abstraction, artistic framing, or metaphor.

Fallback options exist when MCP is unavailable through direct Python API scripts that invoke the Gemini REST endpoint independently.
