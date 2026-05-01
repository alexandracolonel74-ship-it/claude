# MCP Tools Reference -- @ycse/nanobanana-mcp

> Load this when executing generation or editing commands via MCP.

## Package

`@ycse/nanobanana-mcp` — provides Claude with Gemini image generation tools.

**Requirements:**
- Node.js 18+
- `GOOGLE_AI_API_KEY` environment variable
- npx available in PATH

**Output directory:** `~/Documents/nanobanana_generated/`

## Available Tools

### `gemini_generate_image`
Generate an image from a text prompt.

| Parameter | Type | Required | Notes |
|-----------|------|----------|-------|
| `prompt` | string | ✅ | Engineered generation prompt |
| `aspectRatio` | string | — | e.g. `"16:9"`, `"1:1"` (default: `"1:1"`) |
| `imageSize` | string | — | `"512"`, `"1K"`, `"2K"`, `"4K"` — **MUST be uppercase** |
| `model` | string | — | Model ID (default: `gemini-3.1-flash-image-preview`) |
| `thinkingLevel` | string | — | `"minimal"`, `"low"`, `"medium"`, `"high"` |
| `imageOnly` | boolean | — | Return image without text response |

**Critical:** Gemini generates **ONE image per call** — there is no `numberOfImages` batch parameter.

**Not supported:** `negativePrompt`, `seed` — these parameters do not exist in the API.

---

### `gemini_edit_image`
Modify an existing image with instructions.

| Parameter | Type | Required | Notes |
|-----------|------|----------|-------|
| `imagePath` | string | ✅ | Path to source image |
| `prompt` | string | ✅ | Edit instruction |
| `model` | string | — | Default: `gemini-3.1-flash-image-preview` |

---

### `gemini_chat`
Multi-turn creative session with context preservation.

| Parameter | Type | Required | Notes |
|-----------|------|----------|-------|
| `message` | string | ✅ | User message or generation request |
| `aspectRatio` | string | — | Aspect ratio for generated images |
| `imageSize` | string | — | Resolution |

---

### `set_aspect_ratio`
Set default aspect ratio for subsequent generations.

Supported values: `"1:1"`, `"16:9"`, `"9:16"`, `"4:3"`, `"3:4"`, `"2:3"`, `"3:2"`, `"4:5"`, `"5:4"`, `"21:9"`, `"1:4"`, `"4:1"`, `"1:8"`, `"8:1"`

---

### `set_model`
Switch between Gemini models for subsequent calls.

Default: `gemini-3.1-flash-image-preview`

---

### `get_image_history`
Retrieve list of images generated in the current session.

---

### `clear_conversation`
Reset conversation context and history.

## Common Errors

| Error | Cause | Fix |
|-------|-------|-----|
| HTTP 429 | Rate limit exceeded | Wait and retry with exponential backoff |
| HTTP 400 `FAILED_PRECONDITION` | Billing not enabled | Enable billing at aistudio.google.com |
| `IMAGE_SAFETY` finishReason | Safety filter blocked output | Rephrase prompt; see SKILL.md for strategies |
| `PROHIBITED_CONTENT` | Policy violation | Do not retry; reframe topic entirely |
| Silent wrong resolution | Lowercase `imageSize` | Always use uppercase: `"2K"` not `"2k"` |

## Fallback: Direct API Scripts

When MCP is unavailable, use the scripts in `scripts/`:

```bash
# Generate
python3 scripts/generate.py --prompt "your prompt" --resolution 2K --aspect-ratio 16:9

# Edit
python3 scripts/edit.py --image path/to/image.png --prompt "edit instructions"
```

Both scripts use only Python stdlib and accept `GOOGLE_AI_API_KEY` from the environment.
