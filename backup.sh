#!/bin/bash

set -e

# ============================
# PostgreSQL Backup Script
# ============================

# Configuration
DB_HOST="localhost"
DB_PORT="5432"
DB_USER="postgres"
DB_NAME="dms"

# Backup directory
BACKUP_DIR="/backup"

# Timestamp
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")

# Backup file
BACKUP_FILE="${BACKUP_DIR}/${DB_NAME}_${TIMESTAMP}.backup"

# Create backup directory if it doesn't exist
mkdir -p "$BACKUP_DIR"

echo "========================================"
echo "PostgreSQL Backup"
echo "Database : $DB_NAME"
echo "Started  : $(date)"
echo "========================================"

pg_dump \
  -h "$DB_HOST" \
  -p "$DB_PORT" \
  -U "$DB_USER" \
  -d "$DB_NAME" \
  -Fc \
  -f "$BACKUP_FILE"

echo ""
echo "✅ Backup completed successfully!"
echo "Backup File: $BACKUP_FILE"
echo "Finished: $(date)"
