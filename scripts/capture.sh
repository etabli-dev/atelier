#!/usr/bin/env bash
# capture.sh — deterministic screenshot harness for etabli-atelier (v0.1.0)
# Flutter app. Prereqs: adb on PATH; emulator/device booted; debug APK installed.
set -euo pipefail
PKG=com.raban.etabli.atelier
OUT="$(cd "$(dirname "$0")/.." && pwd)/vignettes/assets/0.1.0"; mkdir -p "$OUT"
cap(){ for t in 1 2 3; do adb exec-out screencap -p > "$OUT/$1.png"; [ "$(wc -c < "$OUT/$1.png")" -gt 1000 ] && break; sleep 1; done; echo "  + $1.png"; }
nav(){ adb shell input tap "$1" 2253; sleep 1.5; }   # bottom nav row
adb shell pm clear "$PKG" >/dev/null 2>&1 || true
adb shell monkey -p "$PKG" -c android.intent.category.LAUNCHER 1 >/dev/null 2>&1
sleep 14   # WebR/Pyodide WASM runtimes unpack on first launch
cap 01-editor
nav 450; cap 02-console
nav 628; cap 03-plots
nav 808; cap 04-packages
nav 90;  cap 05-files
nav 988; cap 06-settings
echo "Captured $(ls "$OUT"/*.png|wc -l) frames"
