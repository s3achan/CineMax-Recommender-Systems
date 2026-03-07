#!/bin/bash

# 1. Clear cache
git rm -r --cached .ipynb_checkpoints/

# 2. Make sure .gitignore has the right pattern
echo "**/.ipynb_checkpoints/" >> .gitignore

# 3. Commit both
git add .gitignore
git commit -m "Ignore checkpoints forever"
git push

# ── Add, commit and push ───────────────────────────────────────────────────
# Usage: bash push.sh "your commit message"

MESSAGE=${1:-"Update files"}

echo "📦 Staging all changes..."
git add .

echo "✅ Committing: $MESSAGE"
git commit -m "$MESSAGE"

echo "🚀 Pushing..."
git push

echo ""
echo "🎉 Done!"