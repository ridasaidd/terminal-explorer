# Terminal Explorer

**An old-school text adventure played entirely through real Linux commands.**

Terminal Explorer teaches Linux by turning the filesystem into **Blackthorn Manor**.

You do not type fake adventure commands such as `GO NORTH` or `TAKE KEY`.

You use Linux itself:

- `pwd` to find where you are
- `ls` to look around
- `cd` to move between rooms
- `cat` to read objects and notes
- `grep` and `find` to investigate the manor
- permissions, processes, pipes, scripts, SSH, and other Linux concepts as the adventure expands

The world is the filesystem. The filesystem is the world.

---

## Design philosophy

Terminal Explorer borrows the atmosphere of classic text adventures while remaining a real Linux learning environment.

The central rule is:

> **The puzzle is Linux. The prose should never be the puzzle.**

A room should give the learner just enough information to understand the situation, then invite an action.

Early encounters provide direct hints. Later encounters provide less help and expect the learner to reuse commands they already know.

Typical progression:

1. **Orient** — Where am I?
2. **Observe** — What is here?
3. **Act** — What Linux command can change or inspect the situation?
4. **Feedback** — What happened?
5. **Discover** — What did I learn?

Mistakes are part of the course.

**Consequences exist. Punishment does not.**

Optional secrets reward curiosity but never block required progress.

---

## Blackthorn Manor

Inside the Terminal Realm:

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

These metaphors support learning, but Linux terminology always remains visible. The learner should finish Terminal Explorer knowing Linux, not a replacement vocabulary.

---

## Current development focus

Terminal Explorer V2 is being developed **English-first** while the curriculum and interaction model stabilize.

Older translation material may remain in the repository for reference, but new course work should target English first. Localization can return once the English course is coherent and tested.

The course is organized as areas/chapters rather than assuming every learner follows the same weekly schedule.

Planned progression:

1. **Arrival — Finding Your Bearings**: `pwd`, `ls`, `cd`, paths, `clear`, `history`
2. **The Manor — Files and Rooms**: `mkdir`, `touch`, `cp`, `mv`, `rm`
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

---

## Quick start

Clone the repository:

```bash
git clone https://github.com/ridasaidd/terminal-explorer.git
cd terminal-explorer
```

Run the installer:

```bash
./install.sh
```

Then begin the adventure:

```bash
cd ~/terminal-explorer/week1/mansion/entrance_hall
cat clue.txt
```

The current installer uses English during the V2 rework.

If you are teaching Week 1, use [`docs/WEEK1_LESSON.md`](docs/WEEK1_LESSON.md). It explains the two foundation models—filesystem structure and command/options/arguments—and walks through how to use the Week 1 adventure in class.

---

## Learning reference

Terminal Explorer keeps its in-game explanations intentionally concise. If you want a conventional Linux explanation alongside the adventure, see:

**freeCodeCamp — Learn Linux for Beginners: From Basics to Advanced**  
https://www.freecodecamp.org/news/learn-linux-for-beginners-book-basic-to-advanced/

Terminal Explorer uses external learning resources as references; it does not copy their article text into the game.

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

- `install.sh` — prepares the playable learning environment
- `docs/` — course design, story, teaching guides, and learning references
- `lessons/` — supporting educational material
- `locales/` — existing localized text from the original design
- `weeks/` — current installation/game-content structure; expected to evolve toward chapters/areas

---

## Documentation

- [`docs/COURSE_DESIGN.md`](docs/COURSE_DESIGN.md)
- [`docs/WEEK1_LESSON.md`](docs/WEEK1_LESSON.md)
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
