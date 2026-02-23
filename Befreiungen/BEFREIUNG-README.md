# Befreiung Job Templates (Work Release Letters)

This directory contains Typst templates for generating work release request letters for DLRG volunteers.

## Files

### 1. `befreiung-job.typ`
The main template file that defines the letter format and structure.

**Function**: `befreiung-brief()`

**Parameters**:
- `event-name` (string): Name of the DLRG event requiring time off
- `start-date` (string): Start date in `DD.MM.YYYY` format
- `end-date` (string): End date in `DD.MM.YYYY` format
- `employee-name` (string): Full name of the volunteer/employee
- `employee-address` (string): Address of the employee
- `hr-contact` (string): HR contact person with title (e.g., "Frau Frank" or "Herr Müller")

**Features**:
- Automatically formats dates to German short format (DD.MM.YY)
- Extracts salutation (Herr/Frau) from HR contact field
- Uses today's date as the letter date
- Includes DLRG-Jugend St. Leon header with logo
- Signed by Marcel Holzhauer (Vorsitzender der Jugend)

### 2. `befreiung-job-single.typ`
Template for generating a single letter from command-line parameters. Used by the batch script.

**Usage**:
```bash
typst compile befreiung-job-single.typ output.pdf \
  --root .. \
  --input event-name="Event Name" \
  --input start-date="01.01.2024" \
  --input end-date="05.01.2024" \
  --input employee-name="John Doe" \
  --input employee-address="Street 1" \
  --input hr-contact="Frau Smith"
```

### 3. `generate-batch.sh`
**⭐ Recommended**: Shell script that generates **individual PDF files** for each row in the CSV file.

**Usage**:
```bash
cd Befreiungen
./generate-batch.sh           # Generate PDFs for new entries only
./generate-batch.sh --force   # Regenerate all PDFs
./generate-batch.sh --help    # Show help
```

**Features**:
- Creates one PDF file per employee (named by employee name)
- Output files: `output/EmployeeName.pdf`
- Skips already generated files (unless `--force` is used)
- Progress tracking with counts
- Error handling and reporting
- Sanitizes filenames (spaces → underscores)

**Output Structure**:
```
Befreiungen/
├── output/
│   ├── Max_Mustermann.pdf
│   ├── Anna_Beispiel.pdf
│   ├── John_Doe.pdf
│   └── ...
```

### 4. `befreiung-job-batch.typ`
Legacy batch processor that generates **one combined PDF** with all letters from the CSV file.

**Usage**: 
```bash
typst compile --root . befreiung-job-batch.typ
```

This will read the CSV file and generate one combined PDF with all letters separated by page breaks.

**Note**: For individual PDF files per employee, use `generate-batch.sh` instead.

**CSV Format**:
The CSV file should have these columns:
1. Zeitstempel (timestamp)
2. E-Mail-Adresse (email)
3. Veranstaltungsname (event name)
4. Anfangsdatum der Freistellung (start date)
5. Enddatum der Freistellung (end date)
6. Vorname Nachname (employee full name)
7. Adresse des Betreuers (employee address)
8. (Herr/Frau) + Nachname des Personalverantwortlichen (HR contact)

### 5. `befreiung-job-example.typ`
Example file showing how to create a single letter.

**Usage**:
```bash
typst compile --root . Briefvorlagen/befreiung-job-example.typ
```

## How to Use

### Single Letter
Create a new `.typ` file:

```typst
#import "befreiung-job.typ": befreiung-brief

#befreiung-brief(
  event-name: "Hauptzeltlager DLRG 2024",
  start-date: "29.07.2024",
  end-date: "03.08.2024",
  employee-name: "Max Mustermann",
  employee-address: "Musterstraße 1\n12345 Musterstadt",
  hr-contact: "Frau Müller",
)
```

Then compile:
```bash
typst compile --root . Briefvorlagen/your-file.typ
```

### Batch Processing from CSV

#### Option A: Individual PDF Files (Recommended)
1. Ensure your CSV file is named correctly (or update the path in `generate-batch.sh`)
2. Run the script:
   ```bash
   cd Befreiungen
   ./generate-batch.sh
   ```
3. Find your PDFs in `Befreiungen/output/`

#### Option B: Single Combined PDF (Legacy)
1. Update your CSV file path in `befreiung-job-batch.typ` if needed
2. Compile: `typst compile --root . befreiung-job-batch.typ`
3. The output PDF will contain all letters with page breaks between them

## Letter Format

The generated letters follow the DIN-5008-B format with:
- DLRG-Jugend St. Leon header with logo
- Folding marks for envelopes
- Employee's address as recipient
- Formal request for Sonderurlaub (special leave) under German youth work volunteer laws
- Signature block for Marcel Holzhauer

## Notes

- The letter date is automatically set to today's date when compiled
- Dates in DD.MM.YYYY format are automatically converted to DD.MM.YY format
- The salutation automatically extracts "Herr" or "Frau" from the HR contact field
- If no gender prefix is found, it defaults to "Sehr geehrte Damen und Herren"
- The template states that the work is completely voluntary with no compensation

## Requirements

- Typst compiler
- DLRG-Jugend logo file: `resources/Jugendlogo-transparent.jpeg`
- Footer file: `footer.typ`
- Base template: `brieftemplate.typ`
