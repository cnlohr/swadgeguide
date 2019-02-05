# swadgeguide

This is WiP.  DO NOT TREAT AS FINAL.

Definition
> **/swædʒ/** *n.* a circuit board that may be worn by event attendees, closely associated with a badge, yet generally not providing credentials.

## Swadge Types

### Wifi Swadges

Use an ESP8266 processor and WS2812B LEDs. Connects up to a network infrastructure. These require a network infrastructure to really be interesting/fun. If no such infrastructure is available, then they aren't really as interesting. These typically operate using two AA batteries and cost about $5.00/badge depending on feature set. All prices are approximate and can change significantly depending on quantities, schedule, etc.

Cost column includes estimated assembly cost for 1000+ units.

| Device | Description | Cost/ea | Size | Count | Extended |
|--------|-------------|---------|------|-------|----------|
| Circuit Board	| Need a circuit board for the parts to go on | 	$0.64-$1.20	| 10x10mm to 100x100mm x 1.6mm; Up to 100x130mm but cost will be higher. |	1 req |	$0.80 |
| ESP8266 Module | ESP-12-F Main WIFI Module | $1.90 | 24mm x 16mm x 3.5mm |	1 req |	$1.90 |
| Batteries + Holders | An AA Battery and its holder | $0.50 |	53mm x 18mm x 18mm | 2 req | $1.00 |
| Shipping from China | You have to get it to the USA Somehow! | $0.20 | | 1 req | $0.20 |
| Tactile Button | Attendees can interact by clicking buttons; Example: CKN9112TR-ND | $0.10 | 6mm x 6mm x 4mm | 8 rec | $0.80 |
| WS2812B LED | Individually controllable RGB LEDs. | $0.09 | 5mm x 5mm x 2mm | 4 rec | $0.36 |
| Microphone | Allow your swadge to hear! Warning: this disables battery monitoring. Will need extra $.15 in support circuitry like MCP6001T| $0.30 | | |	$0.45 |
| Speaker | Allow the swadge to make sound. Will need support circuitry | $0.40 | | | $0.50 |
  
### Non-WIFI

Talk about AVR here...

## Design

For The KiCad design guide to help you make cheap-as-possible boards, check this out: https://github.com/cnlohr/swadgeguide/blob/master/kicad_for_mfg/README.md
