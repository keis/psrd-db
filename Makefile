DATA=PSRD-Data
BOOKS=core_rulebook\
	  advanced_players_guide\
	  ultimate_magic

import: core_rulebook/spells.json\
        core_rulebook/arcane_schools.json\
		advanced_players_guide/spells.json\
		ultimate_magic/spells.json

${BOOKS}:
	mkdir $@

core_rulebook/arcane_schools.json: core_rulebook
core_rulebook/arcane_schools.json: ${DATA}/core_rulebook/class/core/wizard.json
	bin/import-arcane-schools $<

core_rulebook/spells.json: core_rulebook $(wildcard ${DATA}/core_rulebook/spell/*.json)
core_rulebook/spells.json: ${DATA}/core_rulebook/spell/
	bin/import-spells $<

advanced_players_guide/spells.json: advanced_players_guide $(wildcard ${DATA}/advanced_players_guide/spell/*.json)
advanced_players_guide/spells.json: ${DATA}/advanced_players_guide/spell/
	bin/import-spells $<

ultimate_magic/spells.json: ultimate_magic $(wildcard ${DATA}/ultimate_magic/spell/*.json)
ultimate_magic/spells.json: ${DATA}/ultimate_magic/spell/
	bin/import-spells $<
