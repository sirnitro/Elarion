# 🧠 Elarion State Model
> “A world is not its map. A world is what it remembers.”

This document defines how Elarion stores **truth**:
- what players have done
- what the world is doing
- what is currently true in a location, faction, or storyline

Elarion is **state-centric** and **event-driven**.

---

## Core Principles

### 1) All meaningful state is persistent
If it matters, it is saved. No “oops it vanished” magic.

### 2) State is typed
Flags are not a junk drawer. State values are one of:
- boolean
- integer
- decimal
- string
- json

### 3) State is scoped
A value must live somewhere. A scope answers: *“true where?”*

Scopes:
- WORLD (global truth)
- CONTINENT (e.g., Eldwyne)
- REGION (subset of a continent)
- LOCATION (a specific place)
- FACTION
- CHARACTER (player character)
- PARTY (optional future)

### 4) State is timestamped
We track:
- when it was created
- when it was last updated

This allows delayed consequences and “the world moved on.”

---

## Naming Convention

Keys are snake_case and describe a fact, not a UI idea.

Examples:
- `has_arrived_in_eldwyne`
- `noticed_ancestral_marker`
- `veil_saturation_level`
- `caldrith_annexation_pressure`
- `deep_god_stirs`

Avoid:
- `clicked_button_3`
- `scene_step_2_done`

---

## Data Model Overview

Elarion stores state in two primary places:

1) **world_state**
- all shared truths (global/regional/location/faction)
- used by event triggers and option requirements

2) **character_state**
- character-specific truths (flags, stats, inventory, relationships)
- used for progression and personalized narrative

A light **characters** table exists to anchor character identity.

---

## Required Fields

### world_state
- scope_type: WORLD/CONTINENT/REGION/LOCATION/FACTION
- scope_id: integer (nullable for WORLD)
- key: string
- value_type: boolean/int/decimal/string/json
- value_*: one of the typed columns
- created_at, updated_at

### character_state
- character_id: integer
- key: string
- value_type: boolean/int/decimal/string/json
- value_*: typed columns
- created_at, updated_at

---

## Common State Domains

### Player Progress Flags
- story beats
- choices
- discovered secrets

### Stats & Attributes
- base stats
- derived stats
- temporary buffs/debuffs (future)

### Inventory (v1 approach)
Store as JSON in character_state:
- `inventory_json` key -> { items: [...] }

Later this can become normalized tables.

### Reputation & Relationships
- `rep_circle_of_lanterns` int
- `rep_argent_banner` int
- `npc_guard_trust` int

---

## Rules for Writes

- Writes must be atomic:
  - one event applies effects in one transaction
- Writes must be auditable (future):
  - optional `state_audit` table later

---

## Minimal Query Patterns

### Read a character flag
- get character_state where character_id + key

### Read a world state value
- get world_state where scope_type + scope_id + key

### Resolve with fallback
When checking a key, the engine may fall back:
LOCATION -> REGION -> CONTINENT -> WORLD
(only when appropriate)

---

## Definition of “Done” for Age I
- world_state + character_state exist
- typed reads/writes work
- state updates are timestamped
- no game logic depends on raw JSON blobs alone
