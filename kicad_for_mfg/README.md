# Using KiCad for Manufacture

## Pre-Export
 * Make sure all capacitors are labeled with a capacitance and voltage.
 * Make sure all basic components have clearly readable footprints.
 * 
 * Add a "Digikey" field for all components other than:
   * SMT Capacitors
   * SMT Resistors
 * Add a Cost100
 
 ## Export
  * In schematic designer, set Bill of Materials
    * If not already done, import [swadge_bom](https://raw.githubusercontent.com/cnlohr/swadgeguide/master/nonlibrary_files/swadge_bom.xsl) to your Bill of Materials plugin.
    * Select "bom2csv"
    * Click "Export"
    * Verify a new file by *PROJECTNAME* exists, no extension.
    * Rename file to .csv
    * Open file in plain-text editor, replace-all "`,`" with "`, `"
    
