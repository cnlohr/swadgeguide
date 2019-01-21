# Using KiCad for Manufacture

## Pre-Export
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
 
 ## Export
  * In schematic designer, set Bill of Materials
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
    
    
