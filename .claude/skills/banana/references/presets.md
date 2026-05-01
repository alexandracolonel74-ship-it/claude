# Brand/Style Presets Reference

> Load this when the user mentions brand consistency, presets, or style templates.

## What Are Presets?

Presets are JSON files stored in `~/.banana/presets/` that define reusable visual and stylistic parameters. They ensure consistent brand identity across multiple generations.

## Preset Structure

```json
{
  "name": "preset-name",
  "description": "Brief description",
  "colors": ["#hex1", "#hex2", "#hex3"],
  "style": "Visual style description",
  "typography": "Font weight and style description",
  "lighting": "Lighting approach",
  "mood": "Emotional tone and descriptors",
  "default_ratio": "16:9",
  "default_resolution": "2K"
}
```

## Built-in Example Presets

### tech-saas
- **Colors:** Blue and white palette
- **Style:** Clean minimal tech illustration, flat vectors, soft shadows
- **Mood:** Professional, trustworthy, modern
- **Default:** 16:9, 2K

### luxury-brand
- **Colors:** Black, gold, cream
- **Style:** Elegant photography with selective focus
- **Typography:** Light italic serif
- **Lighting:** Studio, diffused, soft
- **Mood:** Exclusive, sophisticated, aspirational
- **Default:** 3:4, 2K

### editorial-magazine
- **Colors:** High-contrast black, white, and red
- **Style:** Bold editorial photography
- **Typography:** Heavy condensed sans-serif
- **Lighting:** High-contrast, dramatic
- **Mood:** Bold, provocative, contemporary
- **Default:** 2:3, 2K

## How Presets Integrate

When a preset is loaded, its attributes merge into the prompt brief:
1. Color palette values inform descriptions (e.g., "deep navy background")
2. Style description becomes the base visual direction
3. Typography/lighting/mood shape the overall composition
4. Default ratio and resolution apply unless overridden

**User instructions always take priority over preset values.**

## Managing Presets

```bash
# List all presets
python3 scripts/presets.py list

# Show full preset details
python3 scripts/presets.py show luxury-brand

# Create a new preset
python3 scripts/presets.py create my-brand \
  --colors "#FF6B35,#FFFFFF,#1A1A2E" \
  --style "warm editorial photography with grain" \
  --mood "approachable, energetic, creative" \
  --ratio "16:9" \
  --resolution "2K"

# Delete a preset
python3 scripts/presets.py delete my-brand --confirm
```

**Note:** Preset names must use only letters, numbers, hyphens, and underscores.
