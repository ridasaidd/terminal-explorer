# Week 2 Lesson — Changing the Persistent Filesystem Safely

## Purpose

Week 2 builds directly on Week 1.

Students already have these important ideas:

1. The filesystem is a tree of directories and files.
2. Paths describe locations in that tree.
3. A command line has a structure: command + options + arguments.
4. Spaces divide shell words, and path names must be read exactly.
5. Observation commands can confirm where they are and what exists.

Week 2 adds another mental model:

6. Many Linux commands change the tree by creating, copying, moving, renaming, or removing entries.

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

# Part 3 — Files and Directories Are Different Kinds of Entries

Before changing the filesystem, students should be able to distinguish a regular file from a directory.

Introduce:

```bash
ls -l
```

but do **not** teach the full permission string yet.

For Week 2, only read the first character:

```text
d    directory
-    regular file
```

Example:

```text
drwxr-xr-x  ... archive
-rw-r--r--  ... blueprint.txt
```

For now:

- `d` tells us `archive` is a directory;
- `-` tells us `blueprint.txt` is a regular file.

The remaining permission characters belong to a later lesson.

This gives students a concrete way to verify whether an entry is a room or an object.

---

# Part 4 — Mental Model: Commands Change the Tree

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

## Create more than one file

A command can receive several positional arguments:

```bash
touch chair.txt table.txt lamp.txt
```

```text
COMMAND    ARGUMENT 1    ARGUMENT 2    ARGUMENT 3
touch      chair.txt     table.txt     lamp.txt
```

This reinforces that arguments are separate pieces of information passed to one command.

---

# Part 5 — Source and Destination Arguments

`cp` and `mv` reinforce the command/argument model because they commonly use source and destination arguments.

General shape:

```text
command SOURCE DESTINATION
```

The order matters.

## Copy with `cp`

The workshop contains `blueprint.txt`.

The archive is another directory in the service wing.

A student may use:

```bash
cp blueprint.txt ../archive/
```

when currently inside the workshop.

Break it apart:

```text
COMMAND    SOURCE          DESTINATION
cp         blueprint.txt   ../archive/
```

This combines Week 1 navigation with Week 2 file management:

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

## Move and rename with `mv`

From the workshop:

```bash
mv broken_lamp.txt ../storage/repaired_lamp.txt
```

```text
COMMAND    SOURCE             DESTINATION
mv         broken_lamp.txt    ../storage/repaired_lamp.txt
```

The destination path can identify both a new location and a new name.

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

This is a good place to distinguish:

```bash
mv lamp.txt ../storage/
```

from:

```bash
mv lamp.txt ../storage/repaired_lamp.txt
```

The first keeps the basename `lamp.txt`.

The second supplies a new basename and therefore renames it while moving it.

---

# Part 6 — Directory Creation with Paths

Once students understand a single `mkdir`, introduce an option in a useful context:

```bash
mkdir -p guest_room/storage
```

Break it apart:

```text
COMMAND    OPTION    ARGUMENT
mkdir      -p        guest_room/storage
```

For this lesson:

> `-p` allows `mkdir` to create missing parent directories in the path.

This is valuable because it combines all three Week 1 command-line parts with a Week 2 filesystem change.

Do not rush this before students understand plain `mkdir`.

---

# Part 7 — Removing Things Safely

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

Make this explicit:

> `rm` in the shell is not the same as moving something to a graphical Trash or Recycle Bin.

Terminal Explorer only asks students to remove disposable lesson objects.

## Remove an empty directory with `rmdir`

Inside the restoration zone:

```bash
rmdir rubble
```

`rmdir` only removes an empty directory.

That limitation is useful for beginners because Linux refuses if the directory still contains something.

## Recursive removal is deliberately deferred

Week 2 should **not** normalize:

```bash
rm -r
```

or especially:

```bash
rm -rf
```

Students should first become comfortable distinguishing files from directories, reading paths, identifying the target argument, and predicting the resulting tree.

Recursive deletion belongs in a later file-management challenge after the safe habits are established.

---

# Part 8 — Predict Before Executing

For every Week 2 task:

1. `pwd` if unsure of location.
2. `ls` or `ls -l` to inspect the current location.
3. Read the intended command.
4. Identify command, options, and arguments.
5. Read any path argument from left to right.
6. Identify source and destination when applicable.
7. Predict what will change in the tree.
8. Run the command.
9. Inspect both the source and destination when relevant.
10. Verify the resulting state.

```text
OBSERVE → PREDICT → CHANGE → VERIFY
```

This workflow matters more than completing the adventure quickly.

---

# Part 9 — File and Directory Management Progression

Terminal Explorer should introduce management commands in layers.

## Week 2 — safe single-entry management

Teach and practice:

```text
mkdir
mkdir -p
touch
cp
mv
rm
rmdir
ls -l  (only file-vs-directory recognition)
```

The student should understand:

- what is being changed;
- the exact path being changed;
- source versus destination;
- whether the original remains;
- how to verify the result.

## Later — recursive management

Only after those habits are stable, introduce:

```text
cp -r
rm -r
```

These commands act on directory trees rather than one ordinary file or an empty directory.

The conceptual prerequisite is:

> A recursive operation affects a directory and the descendants beneath it.

That should be taught visually against the manor map before execution.

## Much later — forceful recursive deletion

Do not make this an early-course convenience:

```bash
rm -rf
```

If it is eventually introduced, teach `-r` and `-f` separately, explain the reduced safeguards, and only use it against an isolated disposable training tree.

The learner should never leave Terminal Explorer thinking `rm -rf` is the normal way to clean up.

---

# Part 10 — How to Play Week 2

Students will:

1. navigate from the service wing to the restoration zone;
2. distinguish files and directories with `ls -l`;
3. create `restored_room/`;
4. create `inventory.txt` inside it;
5. return to the service wing;
6. copy `blueprint.txt` from the workshop to the archive while preserving the original;
7. move and rename `broken_lamp.txt` into storage as `repaired_lamp.txt`;
8. remove `obsolete_note.txt`;
9. remove the empty `rubble/` directory;
10. optionally practice `mkdir -p` and multiple `touch` arguments in disposable lesson space;
11. run the Week 2 verifier.

The installed verifier is located at:

```text
~/terminal-explorer/week2/verify.sh
```

Run it with:

```bash
~/terminal-explorer/week2/verify.sh
```

---

# Part 11 — Suggested Classroom Demonstration

Draw only the relevant extension:

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

First run:

```bash
ls -l
```

Ask which entries are files and which are directories without teaching permissions yet.

Then ask students to explain:

```bash
cp blueprint.txt ../archive/
```

and:

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
- Did the second command also rename the file?

Before deletion, ask students to run `pwd` and `ls` and identify the exact target.

---

# Part 12 — Week 2 Commands

Students should become comfortable with:

```text
mkdir      create a directory
mkdir -p   create missing directories along a path
touch      create an empty file for this lesson
cp         copy
mv         move or rename
rm         remove a file
rmdir      remove an empty directory
ls -l      inspect entry type; permissions come later
```

They should continue using:

```text
pwd
ls
cd
cat
```

Week 2 should force students to reuse Week 1 skills in a larger filesystem.

---

# Part 13 — What Students Should Understand Before Moving On

At the end of Week 2, students should be able to explain:

- that files and directories are different entry types;
- how to recognize a regular file versus directory from the first character of `ls -l`;
- that Blackthorn Manor is one persistent directory tree;
- that later weeks can extend that tree without replacing it;
- how to navigate between regions using paths;
- how `mkdir` changes the tree;
- what `mkdir -p` does at a basic level;
- how `touch` can create one or several empty files;
- the difference between copying and moving;
- that `mv` can also rename;
- why `cp` and `mv` commonly use source and destination arguments;
- how relative paths can be command arguments;
- why argument order matters;
- what `rm` removes;
- why `rm` should not be treated as a Trash command;
- what `rmdir` removes;
- why recursive deletion is intentionally more dangerous;
- how to predict a filesystem change before running a command;
- how to verify both source and destination afterward.

The most important habit remains:

> **Observe → Predict → Change → Verify**

---

# Need More Explanation?

Students can use the freeCodeCamp Linux handbook in `docs/LEARNING_RESOURCES.md` as a companion reference:

https://www.freecodecamp.org/news/learn-linux-for-beginners-book-basic-to-advanced/

Read the conventional explanation when needed, then return to the same Blackthorn Manor and test the concept in a real Linux filesystem.
