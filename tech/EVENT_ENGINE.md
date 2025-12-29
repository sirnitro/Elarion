# ⚙️ Elarion Event Engine
> “Nothing happens by accident. The world chooses when to respond.”

The Event Engine is the core system that drives **change** in Elarion.
Scenes, dialogue, combat, magic, and world shifts are all expressions of events.

There is no hardcoded story logic.

---

## Core Principles

### 1) Everything meaningful is an event
- Entering a scene
- Choosing an option
- Time passing
- World tension escalating
- An NPC reacting

If it matters, it is an event.

---

### 2) Events are data, not code
Events are defined in JSON and evaluated by a generic engine.

Code never asks:
> “Is this the Eldwyne intro?”

It asks:
> “Do the conditions pass?”

---

### 3) Events are atomic
An event:
- evaluates conditions
- applies effects
- commits state
- logs the outcome

All in one transaction.

---

## Event Lifecycle

1. **Trigger**
   - on_enter
   - on_choice
   - on_time
   - on_state_change

2. **Condition Evaluation**
   - character state
   - world state
   - inventory
   - time / region / scope

3. **Resolution**
   - success → effects applied
   - failure → no changes (or soft failure effects)

4. **Logging**
   - event execution recorded
   - future systems can react

---

## Event Schema (Logical)

```json
{
  "id": "eldwyne_first_light_entry",
  "trigger": "on_enter",
  "scope": {
    "type": "LOCATION",
    "id": "meadowhearth_outskirts"
  },
  "conditions": [],
  "effects": [
    {
      "type": "set_character_flag",
      "key": "has_arrived_in_eldwyne",
      "value": true
    }
  ]
}
