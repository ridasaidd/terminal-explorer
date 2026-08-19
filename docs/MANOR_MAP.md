# Blackthorn Manor — Canonical Filesystem Map

## Purpose

Blackthorn Manor is one persistent Linux filesystem world.

The estate should not be recreated as a separate manor for every week. Instead, each week extends the same directory tree as the student's Linux knowledge grows.

The canonical playable path is:

```text
~/terminal-explorer/manor/
```

Week-specific lesson notes, verification scripts, and completion records may live under `week1/`, `week2/`, and later week directories, but the world itself remains one manor.

This design is inspired by the navigation complexity of classic text adventures such as Zork: recognizable regions, branches, depth, dead ends, shortcuts, and discoveries. It does not reproduce a Zork map or its room names.

---

# Core map after Week 1

```text
manor/
├── ground_floor/
│   ├── entrance_hall/
│   │   ├── cloakroom/
│   │   └── terminal_study/
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
├── underground/
│   ├── cellar/
│   └── old_tunnel/
└── .old_wing/
```

The map is intentionally large enough that students must navigate rather than simply move between a handful of sibling directories.

The `terminal_study/` is a safe Week 1 practice room for:

- Tab completion;
- command history and the Up Arrow;
- understanding that spaces separate shell words;
- quoting names that contain spaces;
- case sensitivity;
- distinguishing the prompt from the command being typed.

---

# Week 2 extension

Week 2 adds working areas to the same manor:

```text
manor/
├── service_wing/
│   ├── steward_office/
│   ├── workshop/
│   ├── storage/
│   ├── archive/
│   └── training_room/
│       └── sandbox/
└── ground_floor/
    └── east_corridor/
        └── restoration_zone/
            └── rubble/
```

The `training_room/sandbox/` is disposable practice space for safe file and directory management. It supports `ls -l`, multiple `touch` arguments, and `mkdir -p` without making recursive deletion part of the Week 2 workflow.

Later weeks should continue this pattern by unlocking or adding meaningful regions rather than creating a new filesystem world.

Possible later additions include:

- deeper archives;
- locked administrative rooms;
- machinery rooms and process-related areas;
- grounds and gatehouse;
- networking/SSH areas;
- maintenance tunnels;
- additional portals.

---

# Navigation teaching model

The manor exists to teach a real filesystem hierarchy.

Students should repeatedly answer:

1. Where am I?
2. What is here?
3. Where is my destination in relation to me?
4. Which kind of path should I use?

The four essential landmarks are:

```text
.    this directory — here
..   parent directory — one level up
~    my home directory — home
/    filesystem root — the root of everything
```

These are not interchangeable.

---

# Three useful ways to describe a destination

Suppose the student is in:

```text
~/terminal-explorer/manor/ground_floor/east_corridor/library/
```

and wants to reach the kitchen.

## Relative path — directions from here

```bash
cd ../../west_corridor/kitchen
```

A relative path depends on the current location.

Classroom analogy:

> Leave the library, move back through the east corridor and ground floor, then enter the west corridor and kitchen.

## Absolute path — full address

An absolute path begins at `/` and does not depend on the current directory.

Example on a typical system:

```bash
cd /home/student/terminal-explorer-game/manor/ground_floor/west_corridor/kitchen
```

Classroom analogy:

> Give the complete postal address.

The exact `/home/...` portion can differ between systems, so students should discover their own absolute path with `pwd` rather than memorize an example.

## Home-based path — directions from home

```bash
cd ~/terminal-explorer/manor/ground_floor/west_corridor/kitchen
```

For beginner teaching, treat this as a third useful navigation form:

> Start from my home directory, then follow this route.

Technically, the shell expands `~` to the user's home directory. That implementation detail can be explained after students understand the navigation model.

---

# File-management progression

The manor should teach changes to the tree in increasing levels of risk.

## Week 2 — single-entry and empty-directory operations

Introduce:

```text
mkdir
mkdir -p
touch
cp
mv
rm
rmdir
```

The student should be able to name the target, source, and destination before executing the command and verify the resulting state afterward.

## Later — recursive tree operations

After that habit is stable, introduce:

```text
cp -r
rm -r
```

A recursive operation should be explained visually as an operation on a directory **and all descendants beneath it**.

## Much later — forceful recursive deletion

`rm -rf` should never be presented as an ordinary cleanup shortcut. If it is eventually introduced, `-r` and `-f` should be explained separately and exercises should operate only on an isolated disposable training subtree.

---

# Portals

A portal is a real symbolic link.

The student should encounter and use portals before being required to create one.

For example:

```text
manor/upper_floor/observatory/old_lift
    -> ../../underground/old_tunnel
```

The experienced map can therefore contain shortcuts even though the underlying directory hierarchy remains tree-like.

This supports an important later lesson:

> A directory has a location in the filesystem hierarchy, but a symbolic link can provide another path to that location.

When `ln -s` is formally taught, students can create their own portals.

---

# Design rules

1. The map should be complex enough to require navigation practice, but not deliberately confusing.
2. Room names should describe meaningful regions so students can reason spatially.
3. Normal directory relationships should remain pedagogically clean.
4. Hidden directories and portals may reward exploration but should not block core progress unless the relevant Linux concept has already been introduced.
5. Each installation should preserve existing student work and extend the manor rather than replace it.
6. The filesystem hierarchy is the lesson. Atmosphere supports it; atmosphere must not obscure it.
7. Destructive command power should grow only after students demonstrate the habit of observing, predicting, changing, and verifying.
