process extractScans {
    tag "$mzxml - $pattern"
    
    publishDir 'Results/Mzxml'

    input:
    tuple file(mzxml), val(pattern)

    output:
    file '*.mzXML'

    script:
    if( params.extractScans_renumber )
	"""
        main.py --input $mzxml \
        --output ${mzxml.baseName}_${pattern.replaceAll("\\W+","")}.mzXML \
        --pattern $pattern \
        --scan_levels ${params.extractScans_scan_levels} \
        --renumber
        """
    else
	"""
        main.py --input $mzxml \
        --output ${mzxml.baseName}_${pattern.replaceAll("\\W+","")}.mzXML \
        --pattern $pattern \
        --scan_levels ${params.extractScans_scan_levels}
        """
}

