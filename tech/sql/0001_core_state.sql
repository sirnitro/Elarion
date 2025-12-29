-- ==========================================================
-- Elarion Core State Tables (Age I)
-- ==========================================================

CREATE TABLE IF NOT EXISTS characters (
  id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  user_id BIGINT UNSIGNED NULL,
  name VARCHAR(64) NOT NULL,
  race_id BIGINT UNSIGNED NULL,
  class_id BIGINT UNSIGNED NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  UNIQUE KEY uq_characters_name (name)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------------------------------------
-- World State (scoped truths)
-- ----------------------------------------------------------
CREATE TABLE IF NOT EXISTS world_state (
  id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,

  scope_type ENUM('WORLD','CONTINENT','REGION','LOCATION','FACTION') NOT NULL,
  scope_id BIGINT UNSIGNED NULL,

  `key` VARCHAR(128) NOT NULL,
  value_type ENUM('boolean','int','decimal','string','json') NOT NULL,

  value_bool TINYINT(1) NULL,
  value_int BIGINT NULL,
  value_decimal DECIMAL(18,6) NULL,
  value_string VARCHAR(1024) NULL,
  value_json JSON NULL,

  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

  PRIMARY KEY (id),
  UNIQUE KEY uq_world_state_scope_key (scope_type, scope_id, `key`),
  KEY idx_world_state_key (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------------------------------------
-- Character State (character-specific truths)
-- ----------------------------------------------------------
CREATE TABLE IF NOT EXISTS character_state (
  id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  character_id BIGINT UNSIGNED NOT NULL,

  `key` VARCHAR(128) NOT NULL,
  value_type ENUM('boolean','int','decimal','string','json') NOT NULL,

  value_bool TINYINT(1) NULL,
  value_int BIGINT NULL,
  value_decimal DECIMAL(18,6) NULL,
  value_string VARCHAR(1024) NULL,
  value_json JSON NULL,

  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

  PRIMARY KEY (id),
  UNIQUE KEY uq_character_state_char_key (character_id, `key`),
  KEY idx_character_state_key (`key`),
  CONSTRAINT fk_character_state_character
    FOREIGN KEY (character_id) REFERENCES characters(id)
    ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------------------------------------
-- Optional helper: seed global Veil defaults (example)
-- ----------------------------------------------------------
INSERT INTO world_state (scope_type, scope_id, `key`, value_type, value_int)
VALUES ('WORLD', NULL, 'veil_saturation_level_default', 'int', 1)
ON DUPLICATE KEY UPDATE value_int = VALUES(value_int), updated_at = CURRENT_TIMESTAMP;
