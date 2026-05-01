#!/bin/bash
set -euo pipefail

# Only run in Claude Code on the web
if [ "${CLAUDE_CODE_REMOTE:-}" != "true" ]; then
  exit 0
fi

PROJECT_DIR="${CLAUDE_PROJECT_DIR:-$(pwd)}"

# ── 1. Require GOOGLE_AI_API_KEY ─────────────────────────────────────────────
if [ -z "${GOOGLE_AI_API_KEY:-}" ]; then
  echo "ERROR: GOOGLE_AI_API_KEY is not set." >&2
  echo "Set it in your claude.ai project environment variables and restart the session." >&2
  exit 1
fi

# Persist it for the session so scripts and MCP server can read it
if [ -n "${CLAUDE_ENV_FILE:-}" ]; then
  echo "export GOOGLE_AI_API_KEY=\"${GOOGLE_AI_API_KEY}\"" >> "$CLAUDE_ENV_FILE"
fi

# ── 2. Pre-install the MCP package ───────────────────────────────────────────
echo "Installing @ycse/nanobanana-mcp..."
npm install --prefix "$PROJECT_DIR" --save-dev @ycse/nanobanana-mcp 2>&1 | tail -3

# ── 3. Write .mcp.json (gitignored) with the API key ─────────────────────────
cat > "$PROJECT_DIR/.mcp.json" << EOF
{
  "mcpServers": {
    "nanobanana-mcp": {
      "command": "node",
      "args": ["$PROJECT_DIR/node_modules/@ycse/nanobanana-mcp/dist/index.js"],
      "env": {
        "GOOGLE_AI_API_KEY": "${GOOGLE_AI_API_KEY}",
        "NANOBANANA_MODEL": "gemini-3.1-flash-image-preview"
      }
    }
  }
}
EOF

echo "Banana skill ready. MCP server: nanobanana-mcp"
