# 🧭 Elarion Text Game Development Roadmap

This roadmap outlines the phases, features, and goals for building the browser-based text adventure game set in the mystical world of Elarion.

---

## 📅 Phase 1: Core Engine Setup

> 🔧 Build the foundational structure for the game engine and backend.

### ✅ Goals
- [x] Directory structure and site setup
- [x] Composer integration using shared `/vendor`
- [x] `.env`-based secure config system
- [x] `config.php` and `db.php` centralized in `/includes/`
- [x] Constants and paths defined globally
- [x] Base scene engine with AJAX scene loading
- [x] Scene table and sample data in MySQL
- [x] Basic frontend (HTML, CSS, JS) layout

### ⏳ Est. Time: 2–3 days

---

## 📅 Phase 2: Content Expansion System

> 🧱 Add the tools to manage and load lore content, scenes, and branching narratives.

### ✅ Goals
- [ ] Add support for flags and conditional scenes
- [ ] Build out admin panel or CLI to add/edit scenes
- [ ] Markdown support or lightweight WYSIWYG for writing scenes
- [ ] Expand scene JSON to include:
  - [ ] Conditions (`requires`, `excludes`)
  - [ ] Effects (`set_flag`, `gain_item`, `damage`, etc.)
  - [ ] Variable injection (player name, gender, etc.)
- [ ] Add location-based navigation logic (map-style or scene clusters)

### ⏳ Est. Time: 5–7 days

---

## 📅 Phase 3: Player State System

> 🧠 Track character choices, stats, inventory, and progression across scenes.

### ✅ Goals
- [ ] Store player state (session/localStorage or DB)
- [ ] Add basic attributes (Health, Mana, Charisma, Wisdom, etc.)
- [ ] Add inventory system with usable items
- [ ] Optional: Character creation screen (class, race, name)
- [ ] Display character stats in a sidebar or HUD

### ⏳ Est. Time: 5–10 days

---

## 📅 Phase 4: Visual & UX Enhancements

> 🎨 Improve the game interface for immersion and usability.

### ✅ Goals
- [ ] Custom font and theming to match Elarion’s vibe
- [ ] Smooth transitions (fade in/out, loading indicators)
- [ ] Choice animations / hover effects
- [ ] Optional: Scene images/backgrounds per location
- [ ] Mobile responsiveness

### ⏳ Est. Time: 3–5 days

---

## 📅 Phase 5: Save System & Player Accounts

> 💾 Allow users to save, load, and continue their progress.

### ✅ Goals
- [ ] Create player registration/login system (email + password)
- [ ] Link player state to database
- [ ] Support multiple characters per account
- [ ] Create save/load/continue game functionality
- [ ] Add player dashboard with stats and progress

### ⏳ Est. Time: 7–10 days

---

## 📅 Phase 6: Story & Lore Integration

> 📝 Populate the world with immersive, lore-driven content using your existing worldbuilding.

### ✅ Goals
- [x] Create continent/town checklists
- [x] Write scene entries for major locations (Veilscar, Nymira, etc.)
- [ ] Link scenes into quest chains
- [ ] Add recurring NPCs and factions
- [ ] Add quest and dialogue system (optional tree-based)

### ⏳ Est. Time: Ongoing

---

## 📅 Phase 7: Optional Features

> 🧪 Modular additions that can be layered in over time.

### ✅ Optional Add-Ons
- [ ] Combat system (turn-based or narrative)
- [ ] Skill checks (roll-based events)
- [ ] Map view with clickable regions
- [ ] Journal/log of player choices and quests
- [ ] Achievements and unlockables
- [ ] Custom audio (background music, sound effects)
- [ ] Modding support / scene editor for others

---

## 📌 Tracking & Deployment

- [ ] Add GitHub Issues for each major feature
- [ ] Set up deployment script to sync files to server
- [ ] Enable HTTPS and security headers
- [ ] Monitor PHP error logs and scene loading errors
- [ ] Daily/weekly database backups

---

## 🚀 Final Goals

- Public demo hosted at [jedi.wilsonscorner.org/single/elarion](https://jedi.wilsonscorner.org/single/elarion)
- Story-rich, immersive browser experience
- Expandable engine for future games or spin-offs

---

*The journey begins in Vael Thalas... and the fate of Elarion awaits.*
