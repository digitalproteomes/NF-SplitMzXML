# Nextflow workflow to extracts scans with a specific pattern in the filter line from an mzXML file.

If multiple patterns are specified (space separated), they will be extracted individually.

If a scan is of a level not included in --extractScans_scan_levels, it will be included in the output irrespectively of the presence of the pattern.

## Usage
```
  --help:            show this message and exit
  --mzxml_folder:    the folder with the mzXML files (default: Results/Mzxml)
  --extract_pattern: pattern used to extract scans (default: [hcd28, hcd30])
                     Multiple patterns can be separated by a space.
  --extractScans_scan_levels:   space separated list of MS/MS levels to filter (e.g. "2 3") (default: 2)
  --extractScans_renumber:      renumber extracted scans sequentially (default: false)
```

By default results will be stored in Results/Mzxml/

The file names for the extracted files will have _pattern (with all non alphanumeric characters stripped) appended at the end of the original name.

Example usage:

```
nextflow run digitalproteomes/NF-SplitMzXML
```
