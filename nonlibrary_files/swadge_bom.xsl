<!--
    A better CSV export from BOMs from KiCad.
        Copyright (C) 2019 <>< Charles Lohr  (All modifications are copyright-free, CC0, or may be licensed under NewBSD/X11 or GPL v2)
	Based on XSL style sheet to convert EESCHEMA XML Partlist Format to CSV BOM Format
	    Copyright (C) 2013, Stefan Helmert.      GPL v2.

    Portions of this document may still be subject to GPL bleed.

	To execute this from command-line, use:
        xsltproc -o "%O_BOM.csv" "[xsl file]" "%I"

    How to use this is explained in eeschema.pdf chapter 14.  You enter a command line into the
    netlist exporter using a new (custom) tab in the netlist export dialog.  The command is
    similar to

    Instead of "%O.csv" you can alternatively use "%O" if you will supply your own file extension when
    prompted in the UI.  The double quotes are there to account for the possibility of space(s)
    in the filename.
-->

<!--
    @package
    Make a CSV output, sorted by type of component, and value.
    One component per line.  Have a field called "NOBOM" and
	the component will be excluded from the BOM.
    Fields are    Ref,Value, Footprint, Field5, Field4, ...
-->

<!DOCTYPE xsl:stylesheet [
  <!ENTITY nl  "&#xd;&#xa;">    <!--new line CR, LF, or LF, your choice -->
]>


<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="text"/>

    <!-- for table head and empty table fields-->
    <xsl:key name="headentr" match="field" use="@name"/>

    <!-- main part -->
    <xsl:template match="/export">
        <xsl:text>Reference,Value,Footprint</xsl:text>
        <xsl:for-each select="components/comp/fields/field[generate-id(.) = generate-id(key('headentr',@name)[1])]">
            <xsl:if test="not( @name='NOBOM' )" >
                <xsl:text>,</xsl:text>
                <xsl:value-of select="@name"/>
            </xsl:if>
        </xsl:for-each>
        <xsl:text>&nl;</xsl:text>

        <xsl:apply-templates select="components/comp">
            <xsl:sort select="concat( substring(@ref,1,1), value )"/>
        </xsl:apply-templates>
    </xsl:template>

    <!-- the table entries -->
    <xsl:template match="components/comp">
        <xsl:if test="not( fields/field/@name='NOBOM' )" >
		    <xsl:value-of select="@ref"/><xsl:text>,</xsl:text>
		    <xsl:value-of select="value"/><xsl:text>,</xsl:text>
		    <xsl:value-of select="footprint"/>
		    <xsl:apply-templates select="fields">
		    </xsl:apply-templates>
		    <xsl:text>&nl;</xsl:text>
        </xsl:if>
    </xsl:template>

    <!-- table entries with dynamic table head -->
    <xsl:template match="fields">

        <!-- remember current fields section -->
        <xsl:variable name="fieldvar" select="field"/>


        <!-- for all existing head entries -->
        <xsl:for-each select="/export/components/comp/fields/field[generate-id(.) = generate-id(key('headentr',@name)[1])]">
            <xsl:if test="not( @name='NOBOM' )" >
                <xsl:variable name="allnames" select="@name"/>
                <xsl:text>,</xsl:text>

                <!-- for all field entries in the remembered fields section -->
                <xsl:for-each select="$fieldvar">

                    <!-- only if this field entry exists in this fields section -->
                    <xsl:if test="@name=$allnames">
                        <!-- content of the field -->
                       <xsl:value-of select="."/>
                    </xsl:if>
                    <!--
                        If it does not exist, use an empty cell in output for this row.
                        Every non-blank entry is assigned to its proper column.
                    -->
                </xsl:for-each>
            </xsl:if>
        </xsl:for-each>
    </xsl:template>

 </xsl:stylesheet>
