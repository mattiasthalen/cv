# RenderCV PDF Theme — Website Alignment

## Goal

Make the RenderCV-generated PDF feel visually cohesive with the website by adopting the website's color palette and a complementary serif font, while keeping the existing layout and structure.

## Approach

YAML-only configuration changes to the existing `engineeringclassic` theme. No custom templates.

## Design Decisions

### Colors

Adopt the website's primary blue (`#4A9EFF`) as the single accent color. May need darkening for print contrast on white paper.

| Element | Current | New |
|---------|---------|-----|
| Name | `rgb(0, 79, 144)` | `rgb(74, 158, 255)` |
| Headline | `rgb(0, 79, 144)` | `rgb(74, 158, 255)` |
| Section titles | `rgb(0, 79, 144)` | `rgb(74, 158, 255)` |
| Connections/Links | `rgb(0, 79, 144)` | `rgb(74, 158, 255)` |
| Body text | `rgb(0, 0, 0)` | `rgb(30, 30, 30)` |
| Footer/Top note | `rgb(128, 128, 128)` | `rgb(136, 136, 136)` |

### Typography

Switch all fonts from Source Sans 3 to **Merriweather** — a modern serif designed for screen and print readability that complements the website's Inter.

Font sizes and spacing remain unchanged.

### Layout

No changes. Keep the existing `engineeringclassic` theme layout, section ordering from the YAML, margins, photo, section title style, link formatting, and templates.

### Photo

Kept as-is for brand consistency.

## What's NOT Changing

- Theme: `engineeringclassic`
- Page size, margins
- Section order (YAML-defined)
- Section title style (`with_partial_line`)
- Font sizes and spacing
- Link styling (no underline, no icon)
- Footer/date templates
