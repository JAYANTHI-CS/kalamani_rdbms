# kalamani_rdbms
# Library Management System

## Objective

Learn basic SQL commands using SQLite.

## Tasks

1. Create Library table.
2. Insert five records.
3. Display all books.
4. Display Database books.
5. Display books having price greater than 600.
6. Update BookID 105 price to 650.
7. Delete BookID 102.
8. Display final Library table.

---

## Table Structure

| Column | Type |
|----------|---------|
| BookID | INTEGER PRIMARY KEY |
| BookTitle | TEXT |
| Author | TEXT |
| Category | TEXT |
| Price | REAL |

---

## Records

| BookID | BookTitle | Author | Category | Price |
|---------|--------------------------|---------------|-------------|------|
|101|Database System Concepts|Silberschatz|Database|750|
|102|Programming in C|Balagurusamy|Programming|550|
|103|Operating System|Galvin|System|680|
|104|Data Mining|Han|Database|820|
|105|Python Programming|Reema Thareja|Programming|600|

---

## Submission

- Complete `solution.sql`.
- Commit and push your work.
- GitHub Actions will automatically evaluate your solution.

### Passing Output

```
PASS (1/8): Library table created
PASS (2/8): Correct number of books
PASS (3/8): Database books found
PASS (4/8): Price Updated
PASS (5/8): Book Deleted
PASS (6/8): Highest Price Correct
PASS (7/8): Programming Books
PASS (8/8): Total Price Correct

ALL TEST CASES PASSED
```
