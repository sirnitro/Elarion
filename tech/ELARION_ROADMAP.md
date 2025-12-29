# 🧭 Elarion Development Roadmap
> *“Worlds are not built all at once. They emerge in Ages.”*

This roadmap outlines the phased development of **Elarion**, a text-first, mobile-friendly, multiplayer narrative RPG engine focused on memory, consequence, and world state.

Each phase produces a **playable, testable world**, not just infrastructure.

---

## 🟢 AGE I — The World Breathes (Foundations)
**Goal:** Prove the core engine can support a living world.

### Deliverables
- Core data model (characters, state, world)
- Event engine (data-driven, rule-based)
- Scene system (branching narrative)
- Player state persistence
- First playable mobile scene (Eldwyne)

### Systems Built
- Identity & Session System
- Character System (race + class)
- Player State System (flags, inventory, stats)
- World Model (continents, regions)
- Event Engine
- Rule & Requirement Engine
- Scene System (mobile-first)

### Playable Proof
- Player enters Eldwyne
- Makes meaningful choices
- World remembers how they arrived
- Player can leave and return safely

**Exit Criteria**
- Player can start, play, stop, and resume on mobile
- Choices affect future content
- No hardcoded logic required for scenes

---

## 🟡 AGE II — The World Listens (Interaction & Presence)
**Goal:** Make the world feel inhabited without chaos.

### Deliverables
- Location presence system
- Multiplayer awareness (non-twitch)
- NPC interaction framework
- Communication as events
- Recall / Memory panel

### Systems Built
- Location & Presence System
- Communication System (local, private)
- NPC Dialogue & Behavior System
- Memory & Knowledge Model
- Faction System (basic)

### Playable Proof
- Two players can exist in the same location
- NPCs react differently based on player history
- Players see traces of others’ actions
- World feels shared but personal

**Exit Criteria**
- Multiplayer does not break narrative
- No global chat dependency
- Presence feels meaningful, not noisy

---

## 🟠 AGE III — The World Pushes Back (Conflict & Consequence)
**Goal:** Introduce danger without spectacle.

### Deliverables
- Conflict & combat system
- Death & consequence rules
- Reputation impact
- Item system with memory
- Escalating world tensions

### Systems Built
- Conflict & Combat Engine
- Status & Condition System
- Death / Aftermath Rules
- Item & Artifact System
- Reputation & Standing System

### Playable Proof
- Player can fail without progress loss
- Combat outcomes affect future options
- Items carry history
- Violence has social cost

**Exit Criteria**
- Combat is optional but meaningful
- No “grind loops”
- Consequences outlast the moment

---

## 🔵 AGE IV — The World Changes (Living Systems)
**Goal:** Let the world evolve with or without players.

### Deliverables
- World state progression
- Time & season mechanics
- Active faction conflicts
- Region-specific behaviors
- Dynamic event escalation

### Systems Built
- World State Engine
- Time & Memory System
- Faction Conflict Engine
- Regional Rule Contexts
- Event Escalation Logic

### Playable Proof
- Eldwyne changes over time
- Il’Seran behaves differently from Eldwyne
- Events resolve even if ignored
- Players return to altered realities

**Exit Criteria**
- World is not static
- Player absence does not freeze reality
- Systems drive story, not scripts

---

## 🟣 AGE V — The World Remembers Names (Depth & Expansion)
**Goal:** Turn Elarion into a long-lived world.

### Possible Additions
- Player housing / land ownership
- Religion & devotion systems
- Player-authored events
- Procedural story modules
- Legacy & lineage mechanics

### Focus
- Tooling
- Moderation
- Scalability
- Long-term persistence

---

## 🚫 Explicit Non-Goals (For All Ages)
- No sprite rendering
- No real-time twitch mechanics
- No minimap dependency
- No mandatory typing
- No “content treadmill”

---

## 🧭 Guiding Principle
At every phase, ask one question:

> **“What changes because the player was here?”**

If the answer is “nothing,” the feature does not ship.

---

## 📌 Roadmap Status
- **Current Age:** AGE I — The World Breathes
- **Next Milestone:** Second playable mobile scene (Meadowhearth)
- **Primary Focus:** Event Engine + Player State Integrity
