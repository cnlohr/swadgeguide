# Using KiCad for Manufacture

NOTE: For PCB Manufacture, only the #PCB Export section is needed.

## Schematic Pre-Export
 * Make sure all capacitors are labeled with a capacitance and voltage.
 * Make sure all basic components have clearly readable footprints.
 * Add a `Digikey` field for all components other than:
   * SMT Capacitors (unless special)
   * SMT Resistors (unless special)
   * NOTE: This field may be renamed "Vendor PN"
 * Add a `Cost100` Field, approximate cost.
 * Add a `Substitutable` Field, should be "Y", "N", or "DO NOT POPULATE"
 * Add a `Notes` Field, give vendor any specific notes.
 * If applicable, add an `MPN`.
 * If a non-populated part, indicate "NP_" in value, and "Do not populate" in notes. 
 * If an item should be completely left off the BOM, then make a new field called `NOBOM` and put "y" as its value.  Things like pads, test points, empty housings, landing connectors, pogo pads, etc.  Should all have this property.
 
## Schematic Export
 * Open Schematic designer.  "File" -> "Plot" -> "Plot" Set it up as follows and click "Plot All Pages"
 * ![Kicad Schematic Plot Dialog](https://raw.githubusercontent.com/cnlohr/swadgeguide/master/kicad_for_mfg/dialog_plot_schematic.png "Kicad Schematic Plot Dialog")
 * Note: For commercial products this usually should not be transferred to manufacturing due to potential design leakage risk.

### BOM
 * If not already done, import [swadge_bom.xsl](https://raw.githubusercontent.com/cnlohr/swadgeguide/master/nonlibrary_files/swadge_bom.xsl) to your Bill of Materials plugin list.
 * Select "swadge_bom"
 * Use the command-line `xsltproc -o "%O_BOM.csv" "(swadge_bom.xsl location)" "%I"`
 * Click "Export"
 * Verify a new file by *PROJECTNAME* exists, no extension.
 * Rename file to .csv
 * Open in OpenOffice
   * Use "," as a deliminator
   * Uncheck "Merge Deliminators"
 * Or open in Excel or Google Sheets to verify.
 * If you want to buy all things marked with a "Digikey" tag...
   * Visit https://cnlohr.github.io/swadgeguide/nonlibrary_files/digikeyifier.html copy-and-paste in the text of your list.
   * Give digikey the cart file.


 * General warning: Do not use the BOM tool built into PCBNew.  Use the one built into eeschema.

## PCBs

### Setup
 * The following are recommended to minimize board cost and maximize yield.
 * More complicated PCB processes will cost more.  Avoid them.
 * TWO LAYERS! Don't be a 4+ layer tin foil hat nut.
 * Configure your design rules (Design Rules->Design Rules)
 * Use the following:

| Field Name   | Value     | Remarks  |
|--------------|-----------|----------|
| Clearance    | 7.7 mil | Can go as low as 6.5 mil. |
| Track Width  | 12 mil  | Can go as low as 7 mil, but 10-15 is ideal for current carrying capacity. |
| Via Diameter | 23 mil  | |
| Via Drill    | 13 mil  | |

### Pre-export
 * Verify the follwoing features appear:
   * Part number
   * Copyright if applicable
   * Signature artwork of designer(s)
 * View 3D view for quick look-over.
   * Verify all part identifiers are visible
 * **Run DRC**
 * Click "List Unconnected"
 
### PCB Gerbers Export
 * File->Plot.
 * Use a filename such that it has PARTNUMBER_revX
 * Use the following settings:
 * ![Kicad Plot Dialog](https://raw.githubusercontent.com/cnlohr/swadgeguide/master/kicad_for_mfg/dialog_plots.png "Kicad Plots Dialog")
 * Click "Drill File"
 * ![Kicad Drill Dialog](https://raw.githubusercontent.com/cnlohr/swadgeguide/master/kicad_for_mfg/dialog_drill.png "Kicad Plots Dialog")
 * (OPTIONAL, if not manufacturing) Go back out to the "File" menu, select "Fabrication Outputs" select "POS File"
 * ![Kicad POS Dialog](https://raw.githubusercontent.com/cnlohr/swadgeguide/master/kicad_for_mfg/dialog_posfile.png "Kicad POS Dialog")
 * Zip your file so it contains the output plots folder and is named PARTNUMBER_revX
 * If special board directions are needed, include a readme.txt file in the base of the folder.

## RFQ (Request for Quote) Package
Make a folder with a project name and rev number, and RFQ, i.e. `Swadge2019_revA_RFQ`. 

Place the following in a folder.
  * The ...BOM.csv
  * The gerbers + POS files.
  * A high-resolution image, prefer > 300 DPI.  Keep file size to under 1 MB.
  * If parts appear on both sides, two pictures.
  * **OPTIONAL** A schematic of the design.  Warning: This has potential IP implications.
  * A README.txt with the following standard information:
    * Board Thickness   (1oz)
    * Solder Mask Color (Green)
    * Silkscreen Color  (White)
    * Surface Finish    (HASL, Leaded)
      * Leaded HASL for cheap high reliability but not good for people to contact.
      * Lead-Free HASL for cheap, but people need to contact.
      * ENIG for high quality, and people friendly.
    * Whether to use LEADED or UNLEADED solder. (Leaded)
    * Copper Thickness (1oz)
  * README.txt can also contain:
    * Information about sourcing of specific components.
    * Special instructions for individual components.
    * Information about board cleaning (i.e. no ultrasonic if you have MEMS devices)
  * If you have firmware files to test assemblies, i.e. something Elecrow can flash on your thing at the factory to do a functionality test, include this here, too.
  * All information about testing should be included.

Example template below:

```
Please quote for:
 * 1.6mm FR4 PCB, Red solder mask, White silkscreen, 1oz Copper.
 * Use HASL Lead-Free finish.
 * Use Lead-Free solder only.
 * Assemble front of swadge first, add batteries after all other parts are soldered.
 * Capacitor voltage ratings are listed minimum.  Higher voltage capacitors may be used. 
 * See attached youtube video [URL] for additional testing instructions.
```

Zip the folder up and email it to Elecrow stating the quantities they should quote.
