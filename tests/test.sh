#!/bin/bash

echo "========== SQL Assignment =========="

rm -f library.db

echo "Executing solution.sql..."

sqlite3 library.db < solution.sql

echo ""
echo "========== TABLES =========="
sqlite3 library.db ".tables"

echo ""
echo "========== SCHEMA =========="
sqlite3 library.db ".schema"

echo ""
echo "========== DATA =========="
sqlite3 library.db "SELECT * FROM Library;" 2>/dev/null

echo ""
echo "Checking Library table..."

tables=$(sqlite3 library.db ".tables")

if echo "$tables" | grep -iq "Library"; then
    echo "PASS : Library table created"
else
    echo "FAIL : Library table not found"
    exit 1
fi
