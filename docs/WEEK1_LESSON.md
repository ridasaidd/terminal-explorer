# Week 1 Lesson — Navigation, Paths, and Command Structure

## Purpose

Week 1 gives complete beginners the mental models that make later Linux commands easier to understand.

Students should leave Week 1 understanding:

1. The filesystem is a tree of directories and files.
2. They are always located somewhere in that tree.
3. Paths describe locations in different ways.
4. A command line has a structure: command + options + arguments.

The goal is not to memorize many commands. The goal is to learn how to orient yourself, read a path, choose a destination, and understand how a command is constructed.

Blackthorn Manor makes the filesystem visible:

- directories are rooms;
- files are objects;
- nested directories are rooms inside regions or other rooms;
- symbolic links can act as portals;
- the terminal is how the student interacts with the world.

The game uses real Linux commands. There is no separate game command language.

---

# Part 1 — Install and Enter Week 1

From the Terminal Explorer repository:

```bash
./install.sh
```

Enter the manor:

```bash
cd ~/terminal-explorer/manor/ground_floor/entrance_hall
cat clue.txt
```

Week 1 establishes the persistent manor. Later weeks extend this same directory tree rather than creating a separate world.

The full teacher map is documented in `docs/MANOR_MAP.md`.

Students do not need the complete map at the beginning. Building a mental map through exploration is part of the exercise.

---

# Part 2 — Mental Model One: The Filesystem Is a Tree

The Week 1 manor contains enough depth and branching to require real navigation.

A simplified view is:

```text
manor/
├── ground_floor/
│   ├── entrance_hall/
│   │   └── cloakroom/
│   ├── west_corridor/
│   │   ├── kitchen/
│   │   │   └── pantry/
│   │   └── dining_room/
│   └── east_corridor/
│       ├── bedroom/
│       │   └── dressing_room/
│       └── library/
│           ├── reading_room/
│           ├── archives/
│           │   ├── family_records/
│           │   └── estate_records/
│           └── secret_passage/
│               └── old_staircase/
│                   └── vault/
├── upper_floor/
│   ├── gallery/
│   ├── guest_wing/
│   └── observatory/
└── underground/
    ├── cellar/
    └── old_tunnel/
```

This is a hierarchy.

A directory can contain files and other directories.

Students should learn relationships rather than memorizing strings:

- parent;
- child;
- sibling;
- ancestor;
- descendant.

If the student is in:

```text
manor/ground_floor/east_corridor/library/archives/
```

then:

- `archives` is the current directory;
- `library` is its parent;
- `family_records` is a child;
- `estate_records` is another child and therefore a sibling of `family_records`;
- `ground_floor` is an ancestor.

---

# Part 3 — The Four Navigation Landmarks

Teach these four symbols together:

```text
.    here — the current directory
..   one level up — the parent directory
~    home — the current user's home directory
/    root — the root of the entire filesystem
```

They are not interchangeable.

## `.` — here

`.` refers to the current directory.

For example:

```bash
ls .
```

means:

> List this directory.

Students do not need to use `.` constantly, but they should recognize what it means when they encounter it.

## `..` — parent

`..` refers to the parent directory.

```bash
cd ..
```

means:

> Move one level up the tree.

Always connect `..` to the tree. Do not present it as punctuation to memorize.

If the student is here:

```text
library/archives/
```

then:

```bash
cd ..
```

moves to:

```text
library/
```

## `~` — home

`~` means the current user's home directory.

For a user whose home is `/home/student`:

```bash
cd ~
```

moves to:

```text
/home/student
```

The best beginner explanation is:

> `~` means "my home directory."

Do not initially describe `~` as "go up". It is not related to the current depth in the tree.

A useful demonstration is to move deep into the manor and then run:

```bash
cd ~
pwd
```

Students can see that `~` jumps directly home regardless of how deep they were.

Later, explain that the shell expands `~` to the user's home directory.

## `/` — root

`/` is the root of the whole filesystem.

It is not the same as the user's home directory.

A simplified Linux hierarchy might look like:

```text
/
├── etc/
├── home/
│   └── student/    ← ~ for this student
├── tmp/
├── usr/
└── var/
```

So:

```bash
cd /
```

means:

> Go to the root of the entire filesystem.

while:

```bash
cd ~
```

means:

> Go to my personal home directory.

---

# Part 4 — Absolute, Relative, and Home-Based Paths

This is one of the main Week 1 concepts.

Use the following classroom language.

## Relative path = directions from here

A relative path is interpreted from the current directory.

Suppose the student is in:

```text
manor/ground_floor/east_corridor/library/
```

and wants to reach:

```text
manor/ground_floor/west_corridor/kitchen/
```

A relative route could be:

```bash
cd ../../west_corridor/kitchen
```

Read it from left to right:

```text
..              library → east_corridor
..              east_corridor → ground_floor
west_corridor   enter west_corridor
kitchen         enter kitchen
```

Classroom analogy:

> Relative path = directions from where I am standing.

A relative path can mean something different when the starting location changes.

That is the key property students should understand.

---

## Absolute path = full address

An absolute path begins with `/`.

Example:

```text
/home/student/terminal-explorer-game/manor/ground_floor/west_corridor/kitchen
```

Classroom analogy:

> Absolute path = the complete address.

It does not depend on the current directory.

The exact home portion differs between systems, so students should discover their own path with `pwd` rather than memorize an example.

A useful exercise is:

1. Navigate to the kitchen.
2. Run `pwd`.
3. Copy or read the complete path.
4. Move somewhere else.
5. Use the complete path with `cd` to return directly to the kitchen.

Ask:

> Did the full address change because we started somewhere else?

No.

---

## Home-based path = directions from home

For beginner teaching, treat a path beginning with `~` as a third useful form:

```bash
cd ~/terminal-explorer/manor/ground_floor/west_corridor/kitchen
```

Classroom analogy:

> Start at my home directory and follow these directions.

This is easier to explain before introducing shell expansion details.

Later, students can learn that the shell expands `~` to the user's home directory before running the command.

---

## The key comparison

Use this table repeatedly:

| Form | Example | Mental model |
| --- | --- | --- |
| Relative | `../../west_corridor/kitchen` | directions from here |
| Absolute | `/home/student/.../kitchen` | complete address |
| Home-based | `~/terminal-explorer/.../kitchen` | directions from home |

The most important question is:

> Which one depends on where I am now?

The relative path does.

---

# Part 5 — Ask Three Questions Repeatedly

Throughout Week 1, ask students:

1. **Where am I?**
2. **What is here?**
3. **Where do I want to go next?**

Linux gives us direct tools for those questions.

## Where am I?

```bash
pwd
```

`pwd` prints the current working directory.

Encourage students to read the path as a sequence of tree levels separated by `/`.

## What is here?

```bash
ls
```

`ls` lists directory contents.

To include hidden entries:

```bash
ls -a
```

## Where do I want to go next?

```bash
cd PATH
```

The path passed to `cd` can be relative, absolute, or home-based.

---

# Part 6 — Mental Model Two: Commands Have Structure

Students should not treat commands as magic phrases.

Use this general model:

```text
command [options] [arguments]
```

Use real Linux vocabulary.

## Command only

```bash
pwd
```

```text
COMMAND
pwd
```

## Command + argument

```bash
cd library
```

```text
COMMAND    ARGUMENT
cd         library
```

The argument tells `cd` where to go.

Another example:

```bash
cat clue.txt
```

The argument tells `cat` which file to display.

## Command + option

```bash
ls -a
```

```text
COMMAND    OPTION
ls         -a
```

The option changes the behavior of `ls`.

## Command + option + argument

```bash
ls -a library
```

```text
COMMAND    OPTION    ARGUMENT
ls         -a        library
```

Read it as:

> Run `ls`, change its behavior with `-a`, and apply it to `library`.

## Multiple arguments

Some commands need more than one argument.

For example, Week 2 will use:

```bash
cp blueprint.txt archive/
```

```text
COMMAND    ARGUMENT 1      ARGUMENT 2
cp         blueprint.txt    archive/
```

This prepares students to understand source and destination rather than memorizing a whole command line.

---

# Part 7 — Portals: Symbolic Links as Navigation Shortcuts

Week 1 contains real symbolic links presented as portals.

Students are not expected to create them yet.

They should first experience the idea:

> A portal gives another path to a location elsewhere in the hierarchy.

One portal connects the observatory to an underground tunnel. Another provides a shortcut near the library.

Students can inspect portals later with commands such as `ls -l` when symbolic links are formally taught.

The important early idea is:

> The filesystem hierarchy has a tree-like structure, but links can provide alternate routes through it.

Later, `ln -s` will let students build their own portals.

---

# Part 8 — Suggested Classroom Demonstration

Use a projected terminal and a simplified map.

Start here:

```bash
cd ~/terminal-explorer/manor/ground_floor/entrance_hall
```

Ask:

> Where are we?

Run:

```bash
pwd
```

Then:

> What is here?

Run:

```bash
ls
```

Move to the parent:

```bash
cd ..
```

Ask students what changed in the tree.

Then navigate to the library using a relative path.

Once there, choose another destination and demonstrate all three path descriptions:

1. relative;
2. absolute discovered with `pwd`;
3. home-based using `~`.

Then move deep into the manor and demonstrate:

```bash
cd ~
pwd
```

Ask:

> Did `~` mean one level up?

No. It meant the student's home directory.

Finally compare:

```text
.    here
..   parent
~    home
/    root
```

If students can explain those four landmarks and distinguish full-address paths from directions-from-here, the navigation foundation is working.

---

# Part 9 — How to Play Week 1

For each location:

1. Read visible room text.
2. Ask **Where am I?**
3. Use `pwd` when uncertain.
4. Ask **What is here?**
5. Use `ls`.
6. Read interesting files with `cat`.
7. Move using `cd` and a chosen path.
8. Use `cd ..` to move to a parent.
9. Use `ls -a` when the room suggests something may be hidden.
10. Experiment with relative, absolute, and home-based paths.
11. Explore the portal shortcuts.
12. Reach the vault and recover the Week 1 completion key.

A wrong path is not failure. The goal is to form and correct a mental map by interacting with a real filesystem.

---

# Part 10 — Week 1 Commands and Symbols

Students should become comfortable with:

```text
pwd      show the current directory
ls       list directory contents
ls -a    include hidden entries
cd       change directory
cat      display a text file
clear    clear the terminal display
history  show previous commands
```

And recognize:

```text
.        current directory
..       parent directory
~        current user's home directory
/        filesystem root and absolute-path starting point
```

---

# Part 11 — What Students Should Understand Before Moving On

At the end of Week 1, a student should be able to explain in their own words:

- that the filesystem is hierarchical;
- what parent, child, and sibling directories are;
- what a current working directory is;
- what `.` means;
- what `..` means;
- what `~` means;
- what `/` means;
- why `/` and `~` are different;
- what a relative path is;
- why a relative path depends on the current directory;
- what an absolute path is;
- why an absolute path begins at `/`;
- what a home-based `~/...` path means;
- what a command is;
- what an argument is;
- what an option or flag is;
- how to identify those pieces in a simple command line;
- how to use `pwd`, `ls`, `cd`, and `cat` to explore an unfamiliar directory tree;
- that a symbolic link can provide an alternate path to another location.

Understanding is more important than speed.

---

# Need More Explanation?

Students can use the freeCodeCamp Linux handbook listed in `docs/LEARNING_RESOURCES.md` as a companion reference:

https://www.freecodecamp.org/news/learn-linux-for-beginners-book-basic-to-advanced/

Read a conventional explanation when needed, then return to Blackthorn Manor and test the concept in a real terminal.
