DATA=PSRD-Data

import: core_rulebook/spells.json \
        core_rulebook/arcane_schools.json \
		advanced_players_guide/spells.json

core_rulebook advanced_players_guide:
	mkdir $@

core_rulebook/arcane_schools.json: core_rulebook
core_rulebook/arcane_schools.json: ${DATA}/core_rulebook/class/core/wizard.json
	bin/import-arcane-schools $<

advanced_players_guide/spells.json: advanced_players_guide $(wildcard ${DATA}/core_rulebook/spell/*.json)
advanced_players_guide/spells.json: ${DATA}/advanced_players_guide/spell/
	bin/import-spells $<
