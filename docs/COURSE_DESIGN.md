# Terminal Explorer — Course Design

## Vision

Terminal Explorer is an old-school text adventure played through **real Linux commands**.

The learner explores Blackthorn Manor, but there is no fake adventure-command parser. The terminal is the interface and the Linux filesystem is the world.

Directories are rooms. Files are objects. Permissions are locks. Processes can be presented as spirits. Symbolic links can become portals.

The story provides context and motivation. Linux provides the actual mechanics.

> **The puzzle is Linux. The prose should never be the puzzle.**

The goal is to take a complete beginner from first terminal navigation toward confident everyday Linux use, scripting, administration, networking, and troubleshooting.

---

## Core principles

1. **Learn by doing.** A command should usually be introduced because the learner has an immediate reason to use it.
2. **Learn through discovery.** The filesystem itself provides places, objects, evidence, and consequences.
3. **Use real terminology.** Story metaphors may reinforce Linux concepts but must never replace their real names.
4. **Keep prose concise.** Room descriptions create atmosphere; they do not become riddles.
5. **Hints fade with competence.** Show, guide, recall, then require independent use.
6. **Consequences exist. Punishment does not.** Mistakes should produce useful feedback or recoverable situations.
7. **Secrets are optional.** Curiosity is rewarded, but hidden lore must not block required learning.
8. **Do not simulate what Linux already provides.** Prefer real directories, files, permissions, processes, links, streams, and scripts.

---

## The interaction loop

Every learning encounter should roughly follow:

### 1. Orient

Where am I?

Typical tools: `pwd`, paths, prompt awareness.

### 2. Observe

What is here? What changed?

Typical tools: `ls`, `ls -a`, `ls -l`, `cat`, `less`, `ps`.

### 3. Act

What Linux command lets me inspect, move, create, search, modify, connect, or diagnose?

### 4. Feedback

The world changes, reveals information, or gives a concise correction.

### 5. Discover

The learner connects the command to a reusable Linux concept.

The repeated mental model is:

> **Where am I? → What can I see? → What can I do? → Did it work?**

---

## Hint progression

Hints should become less explicit as the learner gains experience.

### First encounter — show

```text
You are somewhere inside the manor.
Find your current location.

Try: pwd
```

### Second encounter — guide

```text
You have entered another part of the manor.
Find your current location.
```

### Later encounter — recall

```text
You are lost.
Orient yourself.
```

### Independent use

No hint is required unless the learner asks for help or reaches a designed recovery path.

Avoid cryptic wording such as riddles whose answer merely happens to be a Linux command.

---

## Room writing style

Room text should normally contain:

1. a location title;
2. one to three short atmospheric sentences;
3. visible objects or a concrete problem;
4. an action goal;
5. an optional hint when appropriate.

Example:

```text
THE GREAT LIBRARY

Dust hangs motionless between towering shelves.

A note on the desk reads:
"The name Blackthorn appears somewhere in these archives."

Find it.

Hint: grep searches text for a pattern.
```

The prose establishes the situation. Linux solves it.

---

## Linux concepts as story mechanics

| Linux concept | Story equivalent |
| --- | --- |
| Directory | Room |
| File | Object |
| Hidden file | Secret |
| Permission | Lock |
| Process | Spirit |
| User | Resident |
| Group | Faction |
| Symbolic link | Portal |
| Service | Manor mechanism |
| Script | Automation |

Avoid maintaining a second vocabulary such as “spell = command” that the beginner must memorize. Say **command**, **flag/option**, **argument**, **script**, **manual page**, and **symbolic link** while allowing the story metaphor to appear around them.

---

## Curriculum progression

Terminal Explorer V2 uses **areas/chapters**, not fixed-duration weeks. The current `weeks/` directory is an implementation detail that can be migrated gradually.

### 1. Arrival — Finding Your Bearings

Concepts:

- terminal basics
- `pwd`
- `ls`
- `cd`
- relative and absolute paths
- `.` and `..`
- `clear`
- `history`

### 2. The Manor — Files and Rooms

Concepts:

- files vs directories
- `mkdir`
- `touch`
- `cp`
- `mv`
- `rm`
- `rmdir`
- safe destructive operations

### 3. The Library — Reading Information

Concepts:

- `cat`
- `less`
- `head`
- `tail`
- file types
- reading command output

### 4. The Archives — Finding Things

Concepts:

- `find`
- `grep`
- recursive search
- wildcards/globbing
- simple pipes
- `wc`

### 5. The Workshop — Editing

Concepts:

- beginner-friendly text editing
- saving and exiting
- modifying configuration/text safely
- optional editor paths later

### 6. The Locked Wing — Users and Permissions

Concepts:

- `whoami`
- users and groups
- ownership
- `ls -l`
- read/write/execute
- `chmod`
- `sudo` conceptually and safely

### 7. The Engine Room — Processes

Concepts:

- `ps`
- `top`
- jobs
- signals
- `kill`
- services/process lifecycle

### 8. The Messenger Tower — Streams and Pipes

Concepts:

- stdin
- stdout
- stderr
- `>`
- `>>`
- `<`
- `|`
- composing commands

### 9. The Automaton Workshop — Bash

Concepts:

- executable scripts
- shebangs
- variables
- arguments
- conditionals
- loops
- functions
- automation

### 10. The Steward's Office — Administration

Concepts:

- packages
- disk and memory inspection
- system information
- configuration basics
- administrative boundaries

### 11. The Observatory — Networking and SSH

Concepts:

- addresses and hostnames
- connectivity
- ports conceptually
- SSH
- remote systems
- basic transfer concepts

### 12. The Broken Manor — Troubleshooting

Concepts:

- logs
- disk space
- memory
- processes
- permissions
- networking
- forming and testing hypotheses

The final chapters should increasingly combine earlier skills rather than introducing one command per puzzle.

---

## Curriculum reference

A useful external curriculum/reference is:

**freeCodeCamp — Learn Linux for Beginners: From Basics to Advanced**  
https://www.freecodecamp.org/news/learn-linux-for-beginners-book-basic-to-advanced/

Use it to inform topic coverage and as optional student reading. Do **not** copy the article text into Terminal Explorer. Terminal Explorer should contain original explanations, scenarios, exercises, and story material.

See `docs/LEARNING_RESOURCES.md`.

---

## English-first development

V2 curriculum development is English-first.

Existing Swedish, Spanish, and Arabic content may remain in the repository as historical/reference material, but new V2 content should not be multiplied across languages while the pedagogy is still changing.

Localization can resume after the English course and interaction model are stable and tested.

---

## Student notes

Personal notes are encouraged but should not become mandatory busywork.

A learner may keep files such as:

```text
backpack/
├── commands.txt
├── journal.txt
├── discoveries.txt
└── notes.txt
```

As editing and redirection are introduced, the backpack can itself become a practice space.

---

## Secrets and Easter eggs

Optional discoveries are strongly encouraged because they naturally reinforce exploration:

- hidden files
- hidden directories
- old logs
- forgotten letters
- symbolic links
- alternate paths
- harmless Unix/Linux curiosities

Secrets must never be required to understand an ambiguous clue. They reward the learner for trying commands such as `ls -a`, `find`, and `grep` after those concepts have been introduced.

---

## Failure and recovery

Incorrect actions should receive progressively lighter help.

Early:

```text
That did not reveal the file.
Remember: ls shows what is in the current directory.
Try looking around first.
```

Later:

```text
Not quite. What command have you already learned for looking around?
```

Eventually:

```text
Try again.
```

Where practical, destructive lessons should operate on disposable course-owned material so recovery itself can become part of the lesson.

---

## Educational outcome

By the end of Terminal Explorer, a learner should be able to:

- navigate Linux filesystems confidently;
- inspect and manipulate files and directories;
- search and filter information;
- understand users, groups, permissions, and processes;
- compose commands with streams and pipes;
- write useful Bash scripts;
- perform basic Linux administration;
- connect to and reason about remote systems;
- troubleshoot common Linux problems methodically;
- continue learning from documentation and conventional Linux resources without needing the game metaphor.

The adventure is scaffolding. Linux competence is the destination.
