
```sql
-- ==========================================================
-- Elarion Event Engine Tables
-- ==========================================================

CREATE TABLE IF NOT EXISTS events (
  id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  event_key VARCHAR(128) NOT NULL,
  trigger_type ENUM('on_enter','on_choice','on_time','on_state_change') NOT NULL,

  scope_type ENUM('WORLD','CONTINENT','REGION','LOCATION','FACTION') NULL,
  scope_id VARCHAR(128) NULL,

  conditions JSON NULL,
  effects JSON NOT NULL,

  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

  PRIMARY KEY (id),
  UNIQUE KEY uq_event_key (event_key),
  KEY idx_event_trigger (trigger_type)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------------------------------------
-- Event Execution Log (for memory & debugging)
-- ----------------------------------------------------------
CREATE TABLE IF NOT EXISTS event_logs (
  id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  event_key VARCHAR(128) NOT NULL,
  character_id BIGINT UNSIGNED NULL,

  trigger_type ENUM('on_enter','on_choice','on_time','on_state_change') NOT NULL,
  resolved TINYINT(1) NOT NULL DEFAULT 0,

  context JSON NULL,
  executed_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

  PRIMARY KEY (id),
  KEY idx_event_logs_event (event_key),
  KEY idx_event_logs_character (character_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
