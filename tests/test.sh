#!/bin/bash

echo "Running SQL Assignment..."

rm -f library.db

sqlite3 library.db < solution.sql

echo "--------------------------------"

echo "Checking Library table..."

tables=$(sqlite3 library.db ".tables")

if echo "$tables" | grep -q "Library"
then
    echo "PASS (1/8): Library table created"
else
    echo "FAIL (1/8): Library table not found"
    exit 1
fi

echo "Checking number of books..."

count=$(sqlite3 library.db "SELECT COUNT(*) FROM Library;")

if [ "$count" -eq 4 ]
then
    echo "PASS (2/8): Correct number of books"
else
    echo "FAIL (2/8): Expected 4 books, Found $count"
    exit 1
fi

echo "Checking Database category..."

dbcount=$(sqlite3 library.db "SELECT COUNT(*) FROM Library WHERE Category='Database';")

if [ "$dbcount" -eq 2 ]
then
    echo "PASS (3/8): Database books found"
else
    echo "FAIL (3/8)"
    exit 1
fi

echo "Checking Updated Price..."

price=$(sqlite3 library.db "SELECT Price FROM Library WHERE BookID=105;")

if [ "$price" = "650" ] || [ "$price" = "650.0" ]
then
    echo "PASS (4/8): Price Updated"
else
    echo "FAIL (4/8)"
    exit 1
fi

echo "Checking Deleted Book..."

deleted=$(sqlite3 library.db "SELECT COUNT(*) FROM Library WHERE BookID=102;")

if [ "$deleted" -eq 0 ]
then
    echo "PASS (5/8): Book Deleted"
else
    echo "FAIL (5/8)"
    exit 1
fi

echo "Checking Highest Price..."

highest=$(sqlite3 library.db "SELECT MAX(Price) FROM Library;")

if [ "$highest" = "820" ] || [ "$highest" = "820.0" ]
then
    echo "PASS (6/8): Highest Price Correct"
else
    echo "FAIL (6/8)"
    exit 1
fi

echo "Checking Programming Books..."

prog=$(sqlite3 library.db "SELECT COUNT(*) FROM Library WHERE Category='Programming';")

if [ "$prog" -eq 1 ]
then
    echo "PASS (7/8): Programming Books"
else
    echo "FAIL (7/8)"
    exit 1
fi

echo "Checking Total Price..."

total=$(sqlite3 library.db "SELECT SUM(Price) FROM Library;")

if [ "$total" = "2900.0" ] || [ "$total" = "2900" ]
then
    echo "PASS (8/8): Total Price Correct"
else
    echo "FAIL (8/8)"
    exit 1
fi

echo "--------------------------------"

echo "🎉 ALL TEST CASES PASSED"
