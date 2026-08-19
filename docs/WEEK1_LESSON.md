# Week 1 Lesson — How to Use Terminal Explorer

## Purpose

Week 1 is designed to give complete beginners two mental models that make the rest of Linux easier to understand:

1. The filesystem is a tree of folders and files.
2. A terminal command has a structure: command + options + arguments.

The goal is not to memorize many commands. The goal is to understand where you are, how locations relate to each other, and how to tell a command what you want it to do.

Terminal Explorer uses Blackthorn Manor to make these ideas visible:

- directories are rooms;
- files are objects;
- moving through directories is moving through the manor;
- the terminal is how you interact with the world.

The game uses real Linux commands. There is no separate game command language to learn.

---

## Part 1 — Start Week 1

From the Terminal Explorer repository, run:

```bash
./install.sh
```

Then enter Week 1:

```bash
cd ~/terminal-explorer/week1/mansion/entrance_hall
cat clue.txt
```

Students should read the room text before trying to solve it.

The room descriptions give a situation and, early in the course, a direct hint. As students progress, the hints become less explicit.

The puzzle is Linux. The prose should never be the puzzle.

---

# Part 2 — Mental Model One: The Filesystem Is a Tree

Before teaching many commands, explain that Linux organizes files and folders in a hierarchy.

A simple example:

```text
mansion/
├── entrance_hall/
├── kitchen/
├── bedroom/
└── library/
    └── secret_passage/
        └── vault/
```

This is a tree.

`mansion` is above the rooms beneath it.

`library` contains `secret_passage`.

`secret_passage` contains `vault`.

A directory can contain files and other directories.

## Parent and child directories

If you are here:

```text
mansion/library/secret_passage/
```

then:

- `secret_passage` is your current directory;
- `library` is its parent;
- `vault` can be a child directory;
- `bedroom` is elsewhere in the tree.

The special path:

```text
..
```

means the parent directory.

So:

```bash
cd ..
```

means "move one level up the tree."

Do not teach `..` as something students must memorize without meaning. Always connect it to the tree.

---

## Ask three questions repeatedly

Throughout Week 1, ask students:

1. Where are you?
2. What is inside this location?
3. Where do you want to go next?

Linux already gives us commands for answering those questions.

### Where am I?

```bash
pwd
```

`pwd` prints the current working directory.

Example:

```text
/home/student/terminal-explorer-game/week1/mansion/library
```

Read the path from left to right. Each `/` separates one level of the tree from the next.

### What is here?

```bash
ls
```

`ls` lists the contents of a directory.

### Move somewhere else

```bash
cd kitchen
```

`cd` changes the current directory.

The word after `cd` tells it where to go.

That leads directly into the second mental model.

---

# Part 3 — Mental Model Two: Commands Have a Structure

Students should not think of terminal commands as magic phrases.

Most command lines can be understood using this general pattern:

```text
command [options] [arguments]
```

Use real Linux vocabulary from the beginning.

Do not rename commands as spells, flags as modifiers, or arguments as targets. The story can remain atmospheric, but the technical words should be the words students will see in documentation and real Linux systems.

---

## Example 1 — A command with no argument

```bash
pwd
```

```text
COMMAND
pwd
```

`pwd` is the command.

It does not need an argument for this basic use.

---

## Example 2 — A command with one argument

```bash
cd library
```

```text
COMMAND    ARGUMENT
cd         library
```

- `cd` is the command.
- `library` is the argument.

The argument tells `cd` where to go.

Another example:

```bash
cat clue.txt
```

```text
COMMAND    ARGUMENT
cat        clue.txt
```

The argument tells `cat` which file to read.

---

## Example 3 — A command with an option

```bash
ls -a
```

```text
COMMAND    OPTION
ls         -a
```

- `ls` is the command.
- `-a` is an option, often called a flag.

The option changes how the command behaves.

In this case, `-a` tells `ls` to include hidden entries.

This is useful in Blackthorn Manor because some secrets begin with a dot.

---

## Example 4 — Command + option + argument

```bash
ls -a library
```

```text
COMMAND    OPTION    ARGUMENT
ls         -a        library
```

This can be read as:

> Run `ls`, change its behavior with `-a`, and apply it to `library`.

That sentence is more useful than memorizing the whole line as a single phrase.

---

## Example 5 — More than one argument

Students should also understand early that some commands can take multiple arguments.

For example:

```bash
cp letter.txt archive/
```

```text
COMMAND    ARGUMENT 1    ARGUMENT 2
cp         letter.txt    archive/
```

This can be read as:

> Run `cp`. Copy `letter.txt` to `archive/`.

Week 1 does not need to teach `cp` yet. This example is simply useful for showing that arguments are positional pieces of information passed to a command.

---

# Part 4 — Relative and Absolute Paths

Once students understand the tree, introduce two ways to describe a location.

## Relative path

A relative path starts from where you are now.

If you are in:

```text
mansion/
```

then:

```bash
cd library
```

means "enter the `library` directory from here."

If you are in:

```text
mansion/library/
```

then:

```bash
cd secret_passage
```

moves into its child directory.

## Absolute path

An absolute path describes a complete location from the filesystem root.

Example:

```text
/home/student/terminal-explorer-game/week1/mansion/library
```

Students do not need to master the entire Linux filesystem hierarchy in Week 1. They only need to understand the difference:

- relative path = location described from where I am;
- absolute path = complete location.

---

# Part 5 — How to Play Week 1

Week 1 should be played as an exploration exercise rather than a worksheet.

For each room:

1. Read the room's `clue.txt` or other visible text file.
2. Ask: **Where am I?**
3. Use `pwd` when necessary.
4. Ask: **What is here?**
5. Use `ls` to inspect the current directory.
6. Read interesting text files with `cat`.
7. Move through directories using `cd`.
8. Use `cd ..` when you need to move to the parent directory.
9. If the room suggests something may be hidden, consider `ls -a`.
10. Continue until you reach the vault and recover the Week 1 completion key.

Students are encouraged to experiment. A wrong `cd` or an unhelpful `ls` is not failure. The point is to form a mental picture of the filesystem by interacting with it.

---

# Part 6 — Suggested Classroom Demonstration

A useful way to introduce Week 1 is to draw the following tree on a whiteboard or screen:

```text
mansion/
├── entrance_hall/
├── kitchen/
├── bedroom/
└── library/
    └── secret_passage/
        └── vault/
```

Then open the terminal in `entrance_hall`.

Ask the class:

> Where are we?

Run:

```bash
pwd
```

Then ask:

> What can we see from here?

Run:

```bash
ls
```

Then move somewhere:

```bash
cd ..
```

Show the tree again and ask what `..` just did.

Then run:

```bash
cd library
```

Break the command apart:

```text
cd library
│  └──── argument: where to go
└─────── command: what to do
```

Next run:

```bash
ls -a
```

Break it apart:

```text
ls -a
│  └── option/flag: change how ls behaves
└───── command: what to do
```

Finally combine the ideas:

```bash
ls -a secret_passage
```

Ask students to identify:

- the command;
- the option;
- the argument.

If they can explain those three pieces and point to their location in the filesystem tree, the foundation of Week 1 is working.

---

# Part 7 — Week 1 Commands

Students should become comfortable with these commands during the adventure:

```text
pwd      show the current directory
ls       list directory contents
ls -a    also show hidden entries
cd       change directory
cat      display a text file
clear    clear the terminal display
history  show previously entered commands
```

The important outcome is not remembering every definition perfectly.

Students should be able to reason about unfamiliar examples using the two models:

```text
filesystem = tree
command line = command + options + arguments
```

---

# Part 8 — What Students Should Understand Before Moving On

At the end of Week 1, a student should be able to explain in their own words:

- what a directory is;
- what a file is;
- that directories can contain other directories;
- what a filesystem tree represents;
- what a current working directory is;
- what a parent directory is;
- what `..` means;
- the difference between a relative and an absolute path at a basic level;
- what a command is;
- what an argument is;
- what an option or flag is;
- how to identify those pieces in a simple command line;
- how to use `pwd`, `ls`, `cd`, and `cat` to explore an unfamiliar directory structure.

That understanding is more important than speed.

---

# Need More Explanation?

Terminal Explorer is intentionally concise. Students who want a conventional explanation alongside the adventure can use the freeCodeCamp Linux handbook listed in `docs/LEARNING_RESOURCES.md`:

https://www.freecodecamp.org/news/learn-linux-for-beginners-book-basic-to-advanced/

Use the article as a companion reference, then return to Blackthorn Manor and try the concepts in a real terminal.
