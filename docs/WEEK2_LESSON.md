# Week 2 Lesson — Changing the Filesystem Safely

## Purpose

Week 2 builds directly on the two mental models from Week 1:

1. The filesystem is a tree of directories and files.
2. A command line has a structure: command + options + arguments.

Week 2 adds a third mental model:

3. Many Linux commands change the filesystem by creating, copying, moving, renaming, or removing entries in that tree.

The goal is not to memorize `mkdir`, `touch`, `cp`, `mv`, `rm`, and `rmdir` as isolated commands. Students should learn to predict what each command will do to the filesystem before pressing Enter.

---

## Part 1 — Start Week 2

Install Terminal Explorer from the repository:

```bash
./install.sh
```

Then enter Week 2:

```bash
cd ~/terminal-explorer/week2/manor/steward_office
cat clue.txt
```

Week 2 is called **Restoration of the Estate**.

The manor is no longer something the student only explores. The student now begins changing it.

---

# Part 2 — Mental Model Three: Commands Change the Tree

Start with a simple filesystem:

```text
manor/
├── steward_office/
├── workshop/
├── storage/
├── archive/
└── east_wing/
```

In Week 1, students mostly observed and moved through the tree.

In Week 2 they will change it.

For every command, ask:

> What will the tree look like after this command runs?

That question should come before memorization.

---

## Creating a directory with `mkdir`

```bash
mkdir restored_room
```

Before:

```text
east_wing/
```

After:

```text
east_wing/
└── restored_room/
```

Break the command apart:

```text
COMMAND    ARGUMENT
mkdir      restored_room
```

- `mkdir` says what action to perform.
- `restored_room` says what directory to create.

The argument becomes a new entry in the filesystem tree.

---

## Creating a file with `touch`

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

```text
COMMAND    ARGUMENT
touch      inventory.txt
```

Ask students what changed in the tree.

---

# Part 3 — Source and Destination Arguments

`cp` and `mv` are especially useful for reinforcing arguments because they commonly use two positional arguments.

The general pattern is:

```text
command SOURCE DESTINATION
```

The order matters.

---

## Copying with `cp`

```bash
cp blueprint.txt archive/
```

Break it apart:

```text
COMMAND    SOURCE ARGUMENT    DESTINATION ARGUMENT
cp         blueprint.txt      archive/
```

Read it as:

> Copy `blueprint.txt` into `archive/`.

The source remains where it was, and another copy appears at the destination.

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

This is an important distinction:

**copying creates another entry; it does not remove the original.**

---

## Moving with `mv`

```bash
mv broken_lamp.txt storage/repaired_lamp.txt
```

Break it apart:

```text
COMMAND    SOURCE ARGUMENT      DESTINATION ARGUMENT
mv         broken_lamp.txt      storage/repaired_lamp.txt
```

`mv` can move an entry to another location.

It can also rename an entry because the destination can contain a new name.

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

The same operation both moved and renamed the file.

This is a useful moment to reinforce that arguments are not decoration. Their position carries meaning.

---

# Part 4 — Removing Things Safely

Week 2 introduces destructive commands.

Students should learn a safety habit before learning speed:

> **Observe before you remove.**

Use `pwd` and `ls` before `rm` or `rmdir` whenever location is uncertain.

---

## Removing a file with `rm`

```bash
rm obsolete_note.txt
```

```text
COMMAND    ARGUMENT
rm         obsolete_note.txt
```

The file is removed from the tree.

Unlike moving a file, there is no new destination.

Terminal Explorer only asks students to remove disposable files created specifically for the lesson.

---

## Removing an empty directory with `rmdir`

```bash
rmdir rubble
```

`rmdir` removes an empty directory.

That constraint is pedagogically useful. If the directory is not empty, Linux refuses the operation rather than recursively deleting its contents.

Week 2 intentionally avoids teaching `rm -rf`.

Students should first develop the habit of understanding what they are deleting.

---

# Part 5 — Predict Before You Execute

For each Week 2 task, encourage students to do this:

1. Run `pwd` if they are unsure where they are.
2. Run `ls` to inspect the current location.
3. Read the command they intend to run.
4. Identify the command, options if any, and arguments.
5. Predict what will change in the filesystem tree.
6. Run the command.
7. Run `ls` again to verify the result.

This is the core Week 2 workflow:

```text
OBSERVE → PREDICT → CHANGE → VERIFY
```

That workflow is more important than completing the chapter quickly.

---

# Part 6 — How to Play Week 2

The Week 2 adventure begins in the steward's office.

The estate needs restoration.

Students will be asked to:

1. create a new room in the east wing;
2. create an inventory file inside it;
3. preserve a workshop blueprint by copying it into the archive;
4. move and rename a damaged object into storage;
5. remove an obsolete note;
6. remove an empty rubble directory;
7. run the Week 2 verifier.

The room text starts with explicit command guidance and gradually becomes less direct.

Students should continue using Week 1 skills throughout:

```text
pwd
ls
cd
cat
```

Week 2 does not replace Week 1. It builds on it.

---

# Part 7 — Suggested Classroom Demonstration

Draw this tree:

```text
manor/
├── steward_office/
├── workshop/
│   ├── blueprint.txt
│   ├── broken_lamp.txt
│   └── obsolete_note.txt
├── storage/
├── archive/
└── east_wing/
    └── rubble/
```

Ask students to predict the result of:

```bash
mkdir east_wing/restored_room
```

Then draw the new directory.

Next:

```bash
touch east_wing/restored_room/inventory.txt
```

Then:

```bash
cp workshop/blueprint.txt archive/
```

Ask:

> Does the original blueprint still exist?

It should.

Next:

```bash
mv workshop/broken_lamp.txt storage/repaired_lamp.txt
```

Ask:

> Which argument is the source?
> Which is the destination?
> Did we only move it, or did we rename it too?

Finally show:

```bash
rm workshop/obsolete_note.txt
rmdir east_wing/rubble
```

Before running each destructive command, ask students to identify the current path and the exact target.

---

# Part 8 — Week 2 Commands

Students should become comfortable with:

```text
mkdir   create a directory
touch   create an empty file for this lesson
cp      copy a file or directory when used appropriately
mv      move or rename a file or directory
rm      remove a file
rmdir   remove an empty directory
```

And they should continue using:

```text
pwd
ls
cd
cat
```

---

# Part 9 — What Students Should Understand Before Moving On

At the end of Week 2, students should be able to explain:

- that files and directories are entries in a filesystem tree;
- that commands can change that tree;
- how `mkdir` adds a directory;
- how `touch` can create a file;
- the difference between copying and moving;
- that `mv` can also rename;
- why `cp` and `mv` commonly need source and destination arguments;
- why argument order matters;
- that `rm` removes a file;
- that `rmdir` removes an empty directory;
- why destructive commands require extra care;
- how to predict a filesystem change before executing it;
- how to verify the result afterward with `ls` or other observation commands.

The most important habit is:

> **Observe → Predict → Change → Verify**

---

# Need More Explanation?

Students can use the freeCodeCamp Linux handbook listed in `docs/LEARNING_RESOURCES.md` as a companion reference:

https://www.freecodecamp.org/news/learn-linux-for-beginners-book-basic-to-advanced/

Read the conventional explanation when needed, then return to Blackthorn Manor and make the change in a real Linux filesystem.
