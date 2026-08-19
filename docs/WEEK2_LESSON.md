# Week 2 Lesson — Changing the Persistent Filesystem Safely

## Purpose

Week 2 builds directly on Week 1.

Students already have three important ideas:

1. The filesystem is a tree of directories and files.
2. Paths describe locations in that tree.
3. A command line has a structure: command + options + arguments.

Week 2 adds another mental model:

4. Many Linux commands change the tree by creating, copying, moving, renaming, or removing entries.

The manor is persistent. Week 2 does not create a second Blackthorn Manor. Installing Week 2 opens new areas inside the same estate the students explored in Week 1.

The core Week 2 habit is:

```text
OBSERVE → PREDICT → CHANGE → VERIFY
```

---

# Part 1 — Extend the Manor for Week 2

After Week 1 has been installed, run from the Terminal Explorer repository:

```bash
./install.sh 2
```

This extends:

```text
~/terminal-explorer/manor/
```

with new areas:

```text
manor/
├── service_wing/
│   ├── steward_office/
│   ├── workshop/
│   ├── storage/
│   └── archive/
└── ground_floor/
    └── east_corridor/
        └── restoration_zone/
            └── rubble/
```

Begin Week 2 here:

```bash
cd ~/terminal-explorer/manor/service_wing/steward_office
cat clue.txt
```

This is a useful moment to ask students:

> Is this a different filesystem world?

No. The directory tree they learned in Week 1 has grown.

---

# Part 2 — Reuse Week 1 Navigation

Before students modify anything, make them navigate between the old and new areas.

For example, from the steward's office:

```text
manor/service_wing/steward_office/
```

ask them to reach:

```text
manor/ground_floor/east_corridor/restoration_zone/
```

They can use a relative path or a home-based path.

The exact route is less important than being able to explain it.

Ask:

- Where are you now?
- Which directories are parents?
- Where is the destination relative to you?
- Would a relative path or a `~/...` path be easier to read?

This keeps Week 1 navigation alive while introducing filesystem changes.

---

# Part 3 — Mental Model: Commands Change the Tree

For every modifying command, ask:

> What will the filesystem tree look like after this command runs?

That question should come before memorization.

## Create a directory with `mkdir`

Inside the restoration zone:

```bash
mkdir restored_room
```

Before:

```text
restoration_zone/
└── rubble/
```

After:

```text
restoration_zone/
├── rubble/
└── restored_room/
```

Break the command apart:

```text
COMMAND    ARGUMENT
mkdir      restored_room
```

The argument names the new directory.

---

## Create a file with `touch`

After entering the new room:

```bash
touch inventory.txt
```

Before:

```text
restored_room/
```

After:

```text
restored_room/
└── inventory.txt
```

For this lesson, `touch` is used to create an empty file.

---

# Part 4 — Source and Destination Arguments

`cp` and `mv` reinforce the command/argument model because they commonly use two positional arguments.

General shape:

```text
command SOURCE DESTINATION
```

The order matters.

## Copy with `cp`

The workshop contains `blueprint.txt`.

The archive is another directory in the service wing.

A student may use a command such as:

```bash
cp blueprint.txt ../archive/
```

when currently inside the workshop.

Break it apart:

```text
COMMAND    SOURCE          DESTINATION
cp         blueprint.txt   ../archive/
```

This combines two Week 1 ideas with one Week 2 idea:

- `blueprint.txt` is the source argument;
- `../archive/` is a relative destination path;
- `cp` creates another copy while leaving the source in place.

Before:

```text
workshop/
└── blueprint.txt

archive/
```

After:

```text
workshop/
└── blueprint.txt

archive/
└── blueprint.txt
```

The original remains.

---

## Move and rename with `mv`

From the workshop, the student can move the damaged lamp into storage and rename it:

```bash
mv broken_lamp.txt ../storage/repaired_lamp.txt
```

```text
COMMAND    SOURCE             DESTINATION
mv         broken_lamp.txt    ../storage/repaired_lamp.txt
```

The destination path also supplies a new filename.

Before:

```text
workshop/
└── broken_lamp.txt

storage/
```

After:

```text
workshop/

storage/
└── repaired_lamp.txt
```

This is a good place to ask students to read the relative path instead of treating `../storage/repaired_lamp.txt` as one mysterious string.

---

# Part 5 — Removing Things Safely

Week 2 introduces destructive commands.

Teach the safety habit:

> **Observe before you remove.**

If location is uncertain:

```bash
pwd
ls
```

before using `rm` or `rmdir`.

## Remove a file with `rm`

```bash
rm obsolete_note.txt
```

The argument identifies the file to remove.

Terminal Explorer only asks students to remove disposable lesson objects.

## Remove an empty directory with `rmdir`

Inside the restoration zone:

```bash
rmdir rubble
```

`rmdir` only removes an empty directory.

Week 2 intentionally does not teach `rm -rf`.

The objective is understanding and safe habits before speed.

---

# Part 6 — Predict Before Executing

For every Week 2 task:

1. `pwd` if unsure of location.
2. `ls` to inspect the current location.
3. Read the intended command.
4. Identify command, options, and arguments.
5. Read any path argument from left to right.
6. Predict what will change in the tree.
7. Run the command.
8. Use `ls`, `pwd`, or another observation command to verify.

```text
OBSERVE → PREDICT → CHANGE → VERIFY
```

This workflow matters more than completing the adventure quickly.

---

# Part 7 — How to Play Week 2

The adventure starts in the service wing's steward office.

Students will:

1. navigate from the service wing to the east-corridor restoration zone;
2. create `restored_room/`;
3. create `inventory.txt` inside it;
4. return to the service wing;
5. copy `blueprint.txt` from the workshop to the archive while preserving the original;
6. move and rename `broken_lamp.txt` into storage as `repaired_lamp.txt`;
7. remove `obsolete_note.txt`;
8. remove the empty `rubble/` directory;
9. run the Week 2 verifier.

The installed verifier is located at:

```text
~/terminal-explorer/week2/verify.sh
```

It checks the actual state of the persistent manor.

Run it with:

```bash
~/terminal-explorer/week2/verify.sh
```

---

# Part 8 — Suggested Classroom Demonstration

Draw only the relevant extension to the existing map:

```text
manor/
├── service_wing/
│   ├── steward_office/
│   ├── workshop/
│   │   ├── blueprint.txt
│   │   ├── broken_lamp.txt
│   │   └── obsolete_note.txt
│   ├── storage/
│   └── archive/
└── ground_floor/
    └── east_corridor/
        └── restoration_zone/
            └── rubble/
```

Start in `service_wing/workshop/`.

Ask students to explain:

```bash
cp blueprint.txt ../archive/
```

Then:

```bash
mv broken_lamp.txt ../storage/repaired_lamp.txt
```

Ask:

- Which argument is the source?
- Which argument is the destination?
- Which path is relative?
- What does `..` mean in that path?
- Which operation leaves the original behind?
- Which operation removes the source from its old location?

This single exercise reinforces navigation, paths, arguments, copying, moving, and renaming.

---

# Part 9 — Week 2 Commands

Students should become comfortable with:

```text
mkdir   create a directory
touch   create an empty file for this lesson
cp      copy
mv      move or rename
rm      remove a file
rmdir   remove an empty directory
```

They should continue using:

```text
pwd
ls
cd
cat
```

Week 2 should not replace Week 1 skills. It should force students to reuse them in a larger filesystem.

---

# Part 10 — What Students Should Understand Before Moving On

At the end of Week 2, students should be able to explain:

- that Blackthorn Manor is one persistent directory tree;
- that a later week can extend that tree without replacing it;
- how to navigate between regions using paths;
- how `mkdir` changes the tree;
- how `touch` can create a file;
- the difference between copying and moving;
- that `mv` can also rename;
- why `cp` and `mv` commonly use source and destination arguments;
- how relative paths can be used as command arguments;
- why argument order matters;
- what `rm` removes;
- what `rmdir` removes;
- why destructive commands require extra care;
- how to predict a filesystem change before running a command;
- how to verify the result afterward.

The most important habit remains:

> **Observe → Predict → Change → Verify**

---

# Need More Explanation?

Students can use the freeCodeCamp Linux handbook in `docs/LEARNING_RESOURCES.md` as a companion reference:

https://www.freecodecamp.org/news/learn-linux-for-beginners-book-basic-to-advanced/

Read the conventional explanation when needed, then return to the same Blackthorn Manor and test the concept in a real Linux filesystem.
