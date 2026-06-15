# Terminal Explorer

Learn Linux through guided quests, challenges, and automation projects.

Terminal Explorer is a story-driven Linux course where students explore **Blackthorn Manor**, an ancient estate connected to the mysterious **Terminal Realm**.

Instead of learning Linux commands in isolation, students learn by solving puzzles, uncovering secrets, and managing a growing estate.

---

# Features

* Story-driven learning
* Gamified Linux challenges
* Multi-language support

  * English
  * Swedish
  * Spanish
  * Arabic
* GitHub Codespaces compatible
* Beginner-friendly
* Progress tracking
* Bash scripting projects
* Hidden lore and Easter eggs

---

# Target Audience

Terminal Explorer is designed for:

* Complete beginners
* Students with no Linux experience
* Self-learners
* Curious explorers

Recommended age:

**18+**

No prior programming knowledge is required.

---

# Course Structure

| Week | Theme                     | Topics                     |
| ---- | ------------------------- | -------------------------- |
| 1    | The Mystery Mansion       | Navigation and exploration |
| 2    | Restoration of the Estate | Files and directories      |
| 3    | The Great Archives        | Search and discovery       |
| 4    | Stewardship and Security  | Processes and permissions  |
| 5    | Automation of the Estate  | Bash scripting             |

---

# Learning Objectives

By the end of the course students should be able to:

* Navigate Linux filesystems
* Create and manage files
* Search and filter information
* Understand permissions and processes
* Write Bash scripts
* Automate repetitive tasks
* Maintain their own Linux environment

---

# Quick Start

Clone the repository:

```bash
git clone https://github.com/ridasaidd/terminal-explorer.git
cd terminal-explorer
```

Run the installer:

```bash
./install.sh
```

The installer will:

* Ask for your preferred language
* Install available weeks
* Save your progress
* Prepare your learning environment

Start Week 1:

```bash
cd ~/terminal-explorer/week1
cat README.txt
```

Arabic-speaking students may prefer opening files in VS Code:

```bash
code README.txt
```

---

# Progress Tracking

Terminal Explorer stores progress using hidden files:

```text
~/terminal-explorer/
```

Examples:

```text
.installed-week1
.week1-complete
language.txt
```

Hint:

```bash
ls -a
```

---

# Student Journal

Students are encouraged to maintain their own journal:

```text
inventory/
├── commands.txt
├── achievements.txt
├── lore.txt
├── discoveries.txt
└── notes.txt
```

The journal belongs to the student.

The course does not automatically manage it.

Knowledge earned is knowledge kept.

---

# Repository Structure

```text
terminal-explorer/
├── install.sh
├── README.md
├── bin/
├── docs/
├── lessons/
├── locales/
└── weeks/
```

## Directory Overview

* `install.sh` — Main course installer
* `docs/` — Design documents and story lore
* `lessons/` — Educational material
* `locales/` — Translated game text
* `weeks/` — Weekly challenge installers
* `bin/` — Optional helper tools

---

# Documentation

* `docs/COURSE_DESIGN.md`
* `docs/STORY.md`

These documents define the architecture and lore of Blackthorn Manor.

---

# GitHub Codespaces

Terminal Explorer is designed to run entirely in GitHub Codespaces during the beginner phase.

Students can later transition to:

* Virtual machines
* Raspberry Pi
* Personal Linux servers
* Native Linux installations

---

# The World of Blackthorn Manor

Blackthorn Manor exists in two worlds:

1. The physical world
2. The Terminal Realm

Within the Terminal Realm:

* Directories become rooms
* Files become objects
* Processes become spirits
* Permissions become locks
* Users become residents
* Groups become factions

The true treasure of Blackthorn Manor is knowledge.

---

# License

Educational use encouraged.

Explore wisely, steward.
