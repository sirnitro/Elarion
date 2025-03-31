```
require_once '../engine/stat_generator.php';

$baseStats = json_decode($class['base_stats'], true);
$modifiers = json_decode($race['stat_modifiers'], true);

$finalStats = generate_final_stats($baseStats, $modifiers);
```
