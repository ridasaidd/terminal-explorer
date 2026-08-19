# Terminal Explorer

**An old-school text adventure played entirely through real Linux commands.**

Terminal Explorer teaches Linux by turning the filesystem into **Blackthorn Manor**.

You do not type fake adventure commands such as `GO NORTH` or `TAKE KEY`.

You use Linux itself:

- `pwd` to find where you are
- `ls` to look around
- `cd` to move between rooms
- `cat` to read objects and notes
- filesystem paths to navigate the estate
- symbolic links as portals
- later commands to create, search, secure, automate, and administer the world

The world is the filesystem. The filesystem is the world.

---

## Design philosophy

Terminal Explorer borrows the atmosphere of classic text adventures while remaining a real Linux learning environment.

The central rule is:

> **The puzzle is Linux. The prose should never be the puzzle.**

Typical play:

1. **Orient** — Where am I?
2. **Observe** — What is here?
3. **Act** — What Linux command can inspect or change the situation?
4. **Feedback** — What happened?
5. **Discover** — What did I learn?

Early encounters provide direct hints. Later encounters expect students to reuse what they already know.

**Consequences exist. Punishment does not.**

Optional secrets reward curiosity but should not block core progression.

---

## One persistent manor

Blackthorn Manor is one cumulative filesystem world:

```text
~/terminal-explorer/manor/
```

Week 1 establishes the manor. Later week installations extend the same directory tree rather than creating separate worlds.

This lets students keep a mental map and reuse navigation skills as the filesystem becomes more complex.

The canonical teacher map is documented in:

[`docs/MANOR_MAP.md`](docs/MANOR_MAP.md)

Its structure takes inspiration from classic text-adventure map design: recognizable regions, branches, depth, dead ends, discoveries, and shortcuts. The map remains pedagogically clean rather than deliberately maze-like.

---

## Blackthorn Manor metaphors

| Linux concept | Manor equivalent |
| --- | --- |
| Directory | Room |
| File | Object |
| Hidden file | Secret |
| Permission | Lock |
| Process | Spirit |
| User | Resident |
| Group | Faction |
| Symbolic link | Portal |

The metaphors support learning, but real Linux terminology always remains visible.

---

## Week 1 foundations

Week 1 focuses on two core mental models:

```text
filesystem = a hierarchy/tree
command line = command + options + arguments
```

It also teaches four navigation landmarks:

```text
.    here
..   parent directory
~    your home directory
/    filesystem root
```

And three useful ways to describe destinations:

```text
relative path   = directions from here
absolute path   = complete address beginning at /
home-based path = directions from home beginning with ~
```

A key idea is that **relative paths depend on the current directory; absolute paths do not**.

---

## Portals

Terminal Explorer uses real symbolic links as portals.

Students can encounter and use portals before they are expected to create them. Later, when `ln -s` is formally taught, they can build their own shortcuts through the manor.

This allows the experienced map to contain alternate routes while the underlying directory hierarchy remains tree-like.

---

## Current development focus

Terminal Explorer V2 is being developed **English-first** while the curriculum and interaction model stabilize.

Planned progression:

1. **Arrival — Finding Your Bearings**: filesystem tree, `pwd`, `ls`, `cd`, `.`, `..`, `~`, `/`, relative and absolute paths, command/options/arguments
2. **Restoration of the Estate**: `mkdir`, `touch`, `cp`, `mv`, `rm`, `rmdir`
3. **The Library — Reading Information**: `cat`, `less`, `head`, `tail`, file types
4. **The Archives — Finding Things**: `find`, `grep`, wildcards, pipes
5. **The Workshop — Editing**: text editing and safe file changes
6. **The Locked Wing — Users and Permissions**: users, groups, ownership, `chmod`
7. **The Engine Room — Processes**: `ps`, `top`, jobs, `kill`, services
8. **The Messenger Tower — Streams and Pipes**: stdin, stdout, stderr, redirection, `|`
9. **The Automaton Workshop — Bash**: variables, scripts, arguments, conditionals, loops
10. **The Steward's Office — Administration**: packages, `sudo`, system inspection
11. **The Observatory — Networking and SSH**: connectivity, addresses, SSH, remote systems
12. **The Broken Manor — Troubleshooting**: logs, storage, memory, processes, diagnosis

Later weeks should extend or unlock areas in the same manor.

---

## Quick start

Clone the repository:

```bash
git clone https://github.com/ridasaidd/terminal-explorer.git
cd terminal-explorer
```

Install Week 1:

```bash
./install.sh
```

Enter Blackthorn Manor:

```bash
cd ~/terminal-explorer/manor/ground_floor/entrance_hall
cat clue.txt
```

When it is time for Week 2, extend the existing manor:

```bash
./install.sh 2
```

Then begin Week 2:

```bash
cd ~/terminal-explorer/manor/service_wing/steward_office
cat clue.txt
```

---

## Teaching guides

- [`docs/WEEK1_LESSON.md`](docs/WEEK1_LESSON.md) — filesystem tree, `.`, `..`, `~`, `/`, relative/absolute/home-based paths, commands/options/arguments
- [`docs/WEEK2_LESSON.md`](docs/WEEK2_LESSON.md) — safely changing the persistent tree with create/copy/move/remove commands
- [`docs/MANOR_MAP.md`](docs/MANOR_MAP.md) — canonical cumulative manor map and map-design rules

---

## Learning reference

Terminal Explorer keeps in-game explanations concise. Students who want conventional Linux explanations can use:

**freeCodeCamp — Learn Linux for Beginners: From Basics to Advanced**  
https://www.freecodecamp.org/news/learn-linux-for-beginners-book-basic-to-advanced/

Terminal Explorer links to external learning resources rather than copying their article text.

More resources are listed in [`docs/LEARNING_RESOURCES.md`](docs/LEARNING_RESOURCES.md).

---

## Repository structure

```text
terminal-explorer/
├── install.sh
├── README.md
├── docs/
├── lessons/
├── locales/
└── weeks/
```

Installed student environment:

```text
~/terminal-explorer/
├── manor/        # persistent playable filesystem world
├── week1/        # Week 1 metadata and verifier
├── week2/        # Week 2 metadata and verifier after installation
└── backpack/     # student-owned notes
```

---

## Documentation

- [`docs/COURSE_DESIGN.md`](docs/COURSE_DESIGN.md)
- [`docs/MANOR_MAP.md`](docs/MANOR_MAP.md)
- [`docs/WEEK1_LESSON.md`](docs/WEEK1_LESSON.md)
- [`docs/WEEK2_LESSON.md`](docs/WEEK2_LESSON.md)
- [`docs/STORY.md`](docs/STORY.md)
- [`docs/LEARNING_RESOURCES.md`](docs/LEARNING_RESOURCES.md)

---

## Environment

Terminal Explorer is designed to work in GitHub Codespaces during the beginner phase and can later transition learners to:

- virtual machines
- Raspberry Pi
- personal Linux servers
- native Linux installations

The goal is not to simulate Linux. It is to let students safely learn by using Linux.

---

## Motto

> **Explore the world. Learn the system. The system is the world.**
