#!/usr/bin/env bash
set -euo pipefail
ROOT="${1:-.}"
TARGET="${2:-./restored-s20.1}"
PARTS="$ROOT/release/S20.1/parts"
ARCHIVE="${TMPDIR:-/tmp}/pnl_Leads_MKT_S20_1.tar.xz"
EXPECTED="13bdfb7b0599f7759dd2f9eae13381d9a744d8d11a2f44eebf81830a0b658c0a"
cat "$PARTS"/part* > "$ARCHIVE"
echo "$EXPECTED  $ARCHIVE" | sha256sum -c -
mkdir -p "$TARGET"
tar -xJf "$ARCHIVE" -C "$TARGET"
test -f "$TARGET/pnl_Leads_MKT.pbip"
test -f "$TARGET/pnl_Leads_MKT.Report/definition.pbir"
test -f "$TARGET/pnl_Leads_MKT.SemanticModel/definition.pbism"
test -f "$TARGET/pnl_Leads_MKT.SemanticModel/definition/model.tmdl"
echo "S20.1 restored successfully: $TARGET"
rm -f "$ARCHIVE"
