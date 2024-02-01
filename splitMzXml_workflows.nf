//////////////////////////
// Workflow definitions //
//////////////////////////


include {extractScans} from './splitMzXml_processes.nf'


workflow split{
    take:
    mzxml_folder
    extract_pattern

    main:
    mzxmlFiles = Channel.fromPath("$mzxml_folder/*.mzXML")
    extract_patterns = Channel.of("$extract_pattern".split(' '))

    extractionCombinations = mzxmlFiles.combine(extract_patterns)
    extractScans(extractionCombinations)
}
