#!/usr/bin/env bash
# update-lab-guide.sh
# Pull the latest lab guide from the repo and push it to the nginx web root.
# Safe to run manually or from the systemd service.
#
# Usage:
#   sudo /opt/wais-lab-guide/scripts/update-lab-guide.sh
#
# Edit REPO_DIR and WEB_ROOT below if the paths differ in your deployment.

set -euo pipefail

REPO_DIR="/opt/wais-lab-guide"
WEB_ROOT="/srv/wais-lab-guide"
LOG="/var/log/wais-lab-guide-update.log"
BRANCH="main"

log() { echo "$(date -Iseconds) $*" | tee -a "$LOG"; }

log "--- lab guide update start ---"
log "repo: $REPO_DIR  web: $WEB_ROOT  branch: $BRANCH"

# Pull latest
cd "$REPO_DIR"
git fetch origin "$BRANCH" 2>&1 | tee -a "$LOG"
git reset --hard "origin/$BRANCH" 2>&1 | tee -a "$LOG"

# Sync docs/ to nginx web root
rsync -av --delete "$REPO_DIR/docs/" "$WEB_ROOT/" 2>&1 | tee -a "$LOG"

log "--- lab guide update complete ---"
