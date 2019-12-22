# swadgeguide

This is WiP.  DO NOT TREAT AS FINAL.

Definition
> **/swædʒ/** *n.* a circuit board that may be worn by event attendees, closely associated with a badge, yet generally not providing credentials.

## Artwork

***THIS SECTION IS NOT COMPLETE***
If you're an artist, recommend you head over to Artwork Design first. If you're an event organizer, you may want to review this main page as well as the Schedule. For direct contact in private channel, use the #badges slack channel. For public questions and comments use the #circuitboards channel.

## PCB Design

Please read this repo's design for kicad gide here: https://github.com/cnlohr/swadgeguide/blob/master/kicad_for_mfg/README.md

There are amazing guides like Seeed's design for manufacture document: https://statics3.seeedstudio.com/fusion/ebook/PCB%20DFM%20V1.1.pdf however, we strongly recommend you keep design **AS SIMPLE AS POSSBILE** avoiding anything that requires anything more than the most basic of board and manufacturing systems.

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

#### 2019 Swadge Component Prices

|Value|Footprint|Unit Price|Notes|
|-----|---------|----------|-----|
|Battery|BCAAPC|0.16|Use through-hole AA Battery Holder in Style of Keystone 2460|
|Cap, 0.22u|C_0805|0.015| |
|Cap, 22u 10V|C_0805|0.06| |
|SK6812SIDE|SK6812SIDE|0.1|MUST use OFFICIAL SK6812-SIDE LEDs.|
|ESP12S|ESP12E|2|ESP12F, N/A Use ESP12S or ESP12F Modules from Electrodragon|
|USBMicroB-10118192-0001LF|USBMicroB-10118192-0001LF|0.15|Must use micro USB SMT-only Header|
|Res, 1k|R_0805|0| |
|Res, 10k|R_0805|0| |
|Res, 47k|R_0805|0| |
|Res, 220k|R_0805|0| |
|Button|TACTILE10|0.04|PTS645SM43SMTR92 LFS, Use standard SMT box tactile buttons.  Similar to PTS645SM43SMTR92. Use RoHS if possible.|
|Button|TACT_3x6_SINGLE|0.02|https://www.aliexpress.com/item/50pcs-lot-SMT-3x6x2-5MM-2PIN-Tactile-Tact-Push-Button-Micro-Switch-G73-Self-reset-Momentary/32804523270.html?spm=2114.search0104.3.65.6bbc193exM3dfC&ws_ab_test=searchweb0_0|
|SWITCH_INV|JS_SWITCH|0.27|Use SPDT SLID Switch|
|OPAMP_MCP6001T|SOT-23-5|0.2|MCP6001T-I/OT, Must use MCP6001T Opamp|
|AP1117SOT223|SOT-223|0.1|AP1117E33G-13, Use any 1117 3.3V SOT-223 regulator.  I.e. AZ1117 or AP1117|
|MO064402-6|Microphones Omnidirctnl Electret Condenser Microphone|0.486|MO064402-6, Use a standard through-hole electret microphone.|
|PCB| |1.00| |
|PCB Assembly| |0.55| |
|Shipping| |0.33| |

#### 2020 Swadge Component Estimates (QTY 3000)
|Part|Price|
|----|-----|
|[ESP-WROOM-02D](https://www.digikey.com/product-detail/en/espressif-systems/ESP-WROOM-02D/1904-1021-1-ND/9381730)|2.10|
|[0.96" OLED](https://www.digikey.com/product-detail/en/vishay-dale/O128O064DLPP3N0000/541-3486-ND/7041857)|1.65|
|[MMA8452Q Accelerometer](https://www.digikey.com/product-detail/en/nxp-usa-inc/MMA8452QR1/MMA8452QR1CT-ND/3524271)|1.05|
|[QST QMA6981 Accelerometer](https://lcsc.com/product-detail/Others_QST-QMA6981_C310611.html)|0.2259|

### Non-WIFI

Non-wifi swadges can use any number of mechanisms to operate. These do not need any form of infrastructure to operate and are generally lower-power, so they can be operated off of a lithium coin cell.

| Device | Description | Cost/ea | Size | Count | Extended |
|--------|-------------|---------|------|-------|----------|
| Circuit board	| | $0.30-$1.30	| 10x10mm to 100x100mm Up to 100x120mm (+$) | 1 | |
| Processor |	ATTiny861 SOIC, Easy-to-work-with 8kB Flash, 512B R, 512B EE | $1.05 | 10x12mm x 3mm | All 16 GPIO |
| | ATTiny861 QFN	Same as above | $0.67 - 0.88 | 5x5mm x 1mm | | |
| | STM8S003 16MHz Might not work (Still needs testing); 8kB F, 1kB R, 128 B EE | $0.39 | 6.5x6.4mm x 2mm	| | |
| | STM8L101 16MHz | Also cheap.  No ADC; 8kB F, 1.5kB R, 2kB EE | $0.51 | 6.5x6.4mm x 2mm	| | |
| | STM8L051 16MHz	Cheap, ADC; 8kB F, 1kB R, 256 B EE	$0.50	6.5x6.4mm x 2mm	
| | EFM8BB10F2G-A Unknown architecture.  Maybe very cheap. | | $0.33	3x3mm x 1mm	 | | |
| | Battery + Holder CR2032 210 mAh  | | | | |
| Tactile Button | CKN9112TR-ND,	Attendees can interact by clicking buttons. | $0.10 | 6mm x 6mm x 4mm	 | | |
| LEDs | Red	| | | |
| | Green	| | | |
| | IR	| | | |
| Touch Buttons	| Available on ATTiny processors.  MAY be available on others.  Can detect variable pressure. | FREE | Up to 30x30mm | Up to 4 ||

TODO: Talk about AVR here...

## Design

For The KiCad design guide to help you make cheap-as-possible boards, check this out: https://github.com/cnlohr/swadgeguide/blob/master/kicad_for_mfg/README.md

## Order Checklist


1) For all designs
    1) Verify board specifications.
    2) Do DRC.
    3) Check for disconnected traces in dialog for DRC.
2) For all gerbers
    1) Select output type to gerber.
    2) Select output folder.
    3) Exclude outline from layers.
    4) Use protel extensions.
3) Verify gerbers in an online gerber viewer or Osh Park.
    1) For order of raw PCBs from PCBWay:
        * Use 1.6mm thick boards.
        * Use selected colors.
        * Use HASL Lead-free or Immersion Gold.
        * Specify that the edges of the board should be smooth.
4) For final order to Elecrow:
    1) PCB:
        * Specify 1.6mm board thickness.
        * Use specified colors.
        * HASL Lead-free or Immersion Gold.
        * Board edges should be smooth.
    2) Other details
        * Tell them to please use Lead-free solder paste.
        * Prepare firmware for their programming.


## Schedule

The following schedule, if adhered to should give up to two weeks of wiggle room.
T-10 weeks out:

Consider actual swadge and selection:
 * Decide if swadge must be wifi or dumb badge.
 * Decide swadge outline and artwork levels.
 * Get rough quantity estimate.
 * Use https://www.pcbway.com/orderonline.aspx to develop pricing scheme for raw PCB at quantities.
 * Recommend keeping design maximum dimensions to <100mm x 100mm.

T-9 weeks out:
 * Design rough draft of board.
 * Place order for boards from PCBWay
 * Request panel from MAGFest:
     Title: Swadge XXX: Doing Just a Bit More Than Last Year
     Description:  A group of Magfest volunteers made a Swadge, again! This time we've got new and exciting hardware and firmware that pushes it to the max. Join us for a development story or two, a Q&A, and ....


T-8 weeks out:
 * Receive boards.
 * Populate boards and write test firmware.
 * Make design changes.
 * Order new boards based on design from PCBWay
 * Make initial RFC from Elecrow

T-7 weeks out:
 * Receive PCBs
 * Test design / firmware.
 * Finalize artwork with Elecrow.
 * Place order with Elecrow.

T-6 weeks out:
 * Provide Elecrow firmware.

T-2 weeks out:
 * Receive order Begin Testing

