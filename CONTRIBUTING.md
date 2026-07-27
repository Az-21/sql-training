# How to Submit Your Answers

## Step 1 — Fork the Repo

1. Go to the repo on GitHub
2. Click **Fork** (top right)
3. This creates your own copy of the repo

---

## Step 2 — Set Up the Database

Choose whichever option works best for you.

---

### Option A — Online (No Install)

1. Go to [sqliteonline.com](https://sqliteonline.com)
2. Click **SQLite** on the left panel
3. Click **File → Open SQL** and open `00_setup.sql` — or just paste its contents into the editor
4. Click **Run** to create all the tables
5. You're ready — start writing queries in the editor

---

### Option B — Local Setup

**1. Install PostgreSQL**
- Download from [postgresql.org/download](https://www.postgresql.org/download)
- Install with default settings
- Remember the password you set for the `postgres` user

**2. Install DBeaver (free SQL client)**
- Download from [dbeaver.io](https://dbeaver.io/download)
- Open DBeaver → New Connection → PostgreSQL
- Enter: host `localhost`, user `postgres`, password (what you set above)
- Click **Test Connection** → Finish

**3. Load the data**
- In DBeaver, right-click your database → **SQL Editor**
- Open `00_setup.sql` and run it
- You should see all 5 tables appear on the left

---

## Step 3 — Solve the Exercises

Work through the files in order:

| File | Level |
|------|-------|
| `01_beginner.sql` | Beginner |
| `02_intermediate.sql` | Intermediate |
| `03_advanced.sql` | Advanced |

Write your query below each exercise comment and run it to see the results.

---

## Step 4 — Submit Your Answers

1. In your fork, create a folder: `submissions/your-name/`
2. For each exercise file, save your queries as a `.sql` file in that folder
   - e.g. `submissions/bob/01_beginner.sql`
3. Take a **screenshot** of the results for each exercise and save them in the same folder
   - e.g. `submissions/bob/screenshots/01_ex01.png`
4. Commit and push to your fork
5. Open a **Pull Request** to the main repo

---

## Folder Structure Example

```
submissions/
  bob/
    01_beginner.sql
    02_intermediate.sql
    screenshots/
      01_ex01.png
      01_ex02.png
      ...
```

---

## Tips

- You don't have to finish everything in one go — submit a PR when you're done with each file
- If a query isn't working, try breaking it into smaller parts
- Google is allowed — learning how to find answers is part of the job
