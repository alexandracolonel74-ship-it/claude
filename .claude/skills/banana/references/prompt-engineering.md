# Prompt Engineering Reference -- Banana Claude

> Load this reference before constructing any generation prompt.

## Core Framework: 5-Component Formula

Every prompt must integrate five components as flowing narrative, not a keyword list:

1. **Subject** — Specific physical characteristics rather than generic labels
2. **Action** — Strong present-tense verbs describing what's occurring
3. **Location/Context** — Environmental details including time and atmosphere
4. **Composition** — Camera perspective, framing, and spatial relationships
5. **Style** — Visual register, medium, and lighting combined

Allocate optical weight deliberately: ~30% subject, ~25% style, distribute remainder across action, location, and composition.

## Banned Keywords (Never Use)

Using these degrades output quality:
- `4K`, `8K`, `HD`, `ultra-HD`
- `masterpiece`, `best quality`
- `highly detailed`, `extremely detailed`
- `hyperrealistic`, `photorealistic`, `ultra-realistic`
- `sharp focus` (use "tack-sharp lens" instead)

**Alternative:** Use prestigious context anchors — "Pulitzer Prize-winning cover photograph", "double-page spread in Vogue Italia", "Cannes Palme d'Or cinematography".

## Domain-Specific Style Libraries

### Cinema / Landscape
- Camera: ARRI Alexa 65, Panavision Millennium DXL2, anamorphic lens flares
- Lighting: golden hour, magic hour, practical lighting, motivated sources
- Style: documentary photography, film stock grain (Kodak Vision3 500T), color grading references
- Anchors: "Roger Deakins lighting", "Emmanuel Lubezki long take", "National Geographic double-page spread"

### Product
- Camera: Hasselblad H6D-400c, Fujifilm GFX 100S, tilt-shift lens
- Lighting: softbox key, butterfly lighting, product photography setup, controlled studio
- Emphasis: "prominently displayed", material specificity (brushed aluminum, matte ceramic)
- Anchors: "Wallpaper* magazine product shot", "Dezeen editorial"

### Portrait
- Camera: Sony A7R IV with 85mm f/1.4, medium format film
- Lighting: Rembrandt, split, clamshell, beauty dish
- Details: skin texture, micro-expressions, "baby hairs at temples", catchlights
- Anchors: "Annie Leibovitz portrait", "Vanity Fair Hollywood Issue", "W Magazine editorial"

### Editorial / Fashion
- Camera: Leica M11, Mamiya RZ67
- Lighting: high-contrast, fashion editorial, natural window
- Style: "Steven Meisel lighting", "Helmut Newton composition"
- Anchors: "Vogue Italia double spread", "i-D magazine"

### UI / Web
- Emphasis: structural clarity, grid-based layout, component hierarchy
- Style: flat design, material design, glassmorphism, neumorphism
- Anchors: "Dribbble shot", "Awwwards site of the day"
- Use search grounding for factual interface patterns

### Logo
- Keep text under 25 characters for accuracy
- Style: vector-clean, minimal, scalable
- Anchors: "Pentagram identity system", "corporate identity manual"
- Specify font characteristics explicitly

### Infographic
- Structure: clear hierarchy, data visualization principles
- Style: "Information is Beautiful", "Edward Tufte data-ink ratio"
- Use search grounding for accuracy on factual content

### Abstract
- Art movements: Abstract Expressionism, De Stijl, Bauhaus, Suprematism
- Media: oil on canvas, watercolor bleed, digital generative
- Anchors: "Rothko color field", "Kandinsky composition"

## Key Techniques

### Character Consistency
Maintain physical anchors across multi-turn conversations:
- Define specific features in first generation
- Reference same descriptors in follow-ups
- Use reference images (up to 4 character refs)

### Positive Framing
Rephrase exclusions constructively:
- ❌ "no blur" → ✅ "sharp detail throughout the frame"
- ❌ "no background" → ✅ "on a solid bright green chroma key background"
- ❌ "not dark" → ✅ "bright, well-lit, high-key lighting"

### Text Rendering
- Keep all text under 25 characters for best accuracy
- Specify font weight: "bold sans-serif", "light italic serif"
- Specify placement: "centered at bottom third"
- Quote desired text: `"OPEN" in white Helvetica Neue Bold`

### Search-Grounded Generation
For factual or reference-based imagery:
1. Search request: "Search for [subject/reference]"
2. Analytical task: "analyze [specific attributes]"
3. Visual translation: "then generate a photorealistic image of..."

## Prompt Structure Template

```
[Subject with specific physical characteristics] [present-tense action verb] [location with atmospheric detail], [camera/lens specification] [composition technique], [lighting setup], [style anchor / publication reference], [micro-detail 1], [micro-detail 2], MUST [critical constraint in caps].
```

## Common Pitfalls

- **Keyword stuffing**: Use flowing prose, not comma-separated lists
- **Vague style directions**: Name specific photographers, publications, or movements
- **Missing lighting**: Always specify lighting; it defines mood and realism
- **Buried constraints**: Place critical requirements early or use ALL CAPS
- **Generic subject labels**: "woman" → "a 30-year-old South Asian woman with sharp cheekbones and close-cropped natural hair"
- **Overlooking format**: Match aspect ratio to intended use before generating
