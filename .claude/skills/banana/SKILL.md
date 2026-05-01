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

## Image-In → Image-Out (Edit Flow)

When the user provides an existing image and wants a new image back:

1. Receive `image_path` + editing instruction from the user
2. Call `gemini_edit_image` MCP tool with the image path and an engineered edit prompt
3. The tool sends the image + prompt to Gemini and returns a new PNG saved to `~/Documents/nanobanana_generated/`
4. Show the user the output file path

**MCP call:**
```
gemini_edit_image(imagePath="<path>", prompt="<engineered edit instruction>")
```

**Fallback** (if MCP unavailable):
```bash
python3 .claude/skills/banana/scripts/edit.py --image <path> --prompt "<instruction>"
```

The `GOOGLE_AI_API_KEY` is pre-configured in the project `.mcp.json`. No additional setup required.

## Key Commands

| Command | Purpose |
|---------|---------|
| `/banana generate <idea>` | Create image from text with full prompt engineering |
| `/banana edit <path> <instructions>` | Image-in → image-out: modify an existing image |
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
