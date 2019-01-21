# Using KiCad for Manufacture

NOTE: For PCB Manufacture, only the #PCB Export section is needed.

## Schematic Pre-Export
 * Make sure all capacitors are labeled with a capacitance and voltage.
 * Make sure all basic components have clearly readable footprints.
 * 
 * Add a `Digikey` field for all components other than:
   * SMT Capacitors (unless special)
   * SMT Resistors (unless special)
   * NOTE: This field may be renamed "Vendor PN"
 * Add a `Cost100` Field, approximate cost.
 * Add a `Substitutable` Field, should be "Y" or "N"
 * Add a `Notes` Field, give vendor any specific notes.
 * If a non-populated part, indicate "NP_" in value, and "Do not populate" in notes. 
 
## Schematic Export
Open Schematic designer.

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

General warning: Do not use the BOM tool built into PCBNew.

### PDF Schematic
 *

## PCB Export

### Pre-export
 * Verify the follwoing features appear:
   * Part number
   * Copyright if applicable
   * Signature artwork of designer(s)
 * View 3D view for quick look-over.
   * Verify all part identifiers are visible
 * **Run DRC**
 * Click "List Unconnected"
 
### Final Export
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

Place the following in there:
  * The ...BOM.csv
  * A high-resolution image, prefer > 300 DPI.  Keep file size to under 1 MB.
  * If parts appear on both sides, two pictures.
  * 
  * **OPTIONAL** A schematic of the design.  Warning: This has potential IP implications.

