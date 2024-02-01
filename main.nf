nextflow.enable.dsl=2

include {split} from './splitMzXml_workflows.nf'

workflow {
    main:
    log.info("++++++++++========================================")
    log.info""
    log.info"Extracts scans with a specific pattern in the filter line from an mzXML file"
    log.info"----------------------------------------------------------------------------"
    log.info""
    log.info"Options:"
    log.info "  --help:            show this message and exit"
    log.info "  --mzxml_folder:    the folder with the mzXML files (default: $params.mzxml_folder)"
    log.info "  --extract_pattern: pattern used to extract scans (default: $params.extract_patterns)"
    log.info "                     Multiple patterns can be separated by a space."
    log.info "  --extractScans_scan_levels:   space separated list of MS/MS levels to filter (e.g. \"2 3\") (default: $params.extractScans_scan_levels)"
    log.info "  --extractScans_renumber:      renumber extracted scans sequentially (default: $params.extractScans_renumber)"
    log.info ""
    log.info "Please note that the pattern is only searched in scans of level scan_levels. If a scans is of a different level, it will be"
    log.info "saved to output no matter what."
    log.info ""
    log.info "Results will be in Results/Mzxml/"
    log.info ""
    log.info("++++++++++========================================")

    split(params.mzxml_folder,
	  params.extract_pattern)
}


