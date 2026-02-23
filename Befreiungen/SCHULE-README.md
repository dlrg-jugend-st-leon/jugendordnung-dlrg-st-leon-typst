# Befreiung Schule Templates (School Release Letters)

This directory contains Typst templates for generating school release request letters (Unterrichtsbefreiung) for DLRG youth members.

## Files

### 1. `befreiung-schule.typ`
The main template file that defines the letter format and structure.

**Function**: `befreiung-schule-brief()`

**Parameters**:
- `event-name` (string): Name of the DLRG event requiring school absence
- `start-date` (string): Start date in `DD.MM.YYYY` format
- `end-date` (string): End date in `DD.MM.YYYY` format
- `student-name` (string): Full name of the student
- `student-class` (string): Student's class/grade (e.g., "TGI 13", "Js2f")
- `teacher-name` (string): Teacher's name with title (e.g., "Herr Grötzinger" or "Frau Vollmer")
- `school-name` (string): Name of the school (optional parameter, not displayed in letter)

**Features**:
- Automatically formats dates to German short format (DD.MM.YY)
- Extracts salutation (Herr/Frau) from teacher name field
- Uses today's date as the letter date
- Includes DLRG-Jugend St. Leon header with logo
- No recipient address block (teacher name only appears in greeting)
- Hides class information if empty
- References § 4 Abs. 1 and Abs. 3 Nr. 6 SchulBesV BW (Baden-Württemberg school law)
- Signed by Marcel Holzhauer (Vorsitzender der Jugend)

### 2. `befreiung-schule-single.typ`
Template for generating a single letter from command-line parameters. Used by the batch script.

**Usage**:
```bash
typst compile befreiung-schule-single.typ output.pdf \
  --root .. \
  --input event-name="Pfingstzeltlager 2024" \
  --input start-date="17.05.2024" \
  --input end-date="17.05.2024" \
  --input student-name="Sarah Kamuf" \
  --input student-class="Js2f" \
  --input teacher-name="Herr Vollmer" \
  --input school-name="Gymnasium Malsch"
```

### 3. `generate-batch-schule.sh`
**⭐ Recommended**: Shell script that generates **individual PDF files** for each row in the CSV file.

**Usage**:
```bash
cd Befreiungen
./generate-batch-schule.sh           # Generate PDFs for new entries only
./generate-batch-schule.sh --force   # Regenerate all PDFs
./generate-batch-schule.sh --help    # Show help
```

**Features**:
- Creates one PDF file per student (named by student name and event name)
- Output files: `output-schule/StudentName_EventName.pdf`
- Skips already generated files (unless `--force` is used)
- Progress tracking with counts
- Error handling and reporting
- Sanitizes filenames (spaces → underscores, special chars removed)

**Output Structure**:
```
Befreiungen/
├── output-schule/
│   ├── Daniela_KZL.pdf
│   ├── Matias_Mas_Viehl_Pizzabacken.pdf
│   ├── Tim_Fuchsluger_PZL_2024.pdf
│   ├── Tim_Fuchsluger_KZL_2024.pdf
│   ├── Sarah_Kamuf_Pfingstzeltlager2024.pdf
│   └── ...
```

### 4. `befreiung-schule-example.typ`
Example file showing how to create a single letter.

**Usage**:
```bash
typst compile --root . Befreiungen/befreiung-schule-example.typ
```

## How to Use

### Single Letter
Create a new `.typ` file:

```typst
#import "befreiung-schule.typ": befreiung-schule-brief

#befreiung-schule-brief(
  event-name: "Pfingstzeltlager 2024",
  start-date: "17.05.2024",
  end-date: "17.05.2024",
  student-name: "Sarah Kamuf",
  student-class: "Js2f",
  teacher-name: "Herr Vollmer",
  school-name: "Gymnasium Malsch",
)
```

Then compile:
```bash
typst compile --root . Befreiungen/your-file.typ
```

### Batch Processing from CSV

1. Ensure your CSV file is named correctly (or update the path in `generate-batch-schule.sh`)
2. Run the script:
   ```bash
   cd Befreiungen
   ./generate-batch-schule.sh
   ```
3. Find your PDFs in `Befreiungen/output-schule/`

**CSV Format**:
The CSV file should have these columns:
1. Zeitstempel (timestamp)
2. Veranstaltungsname (event name)
3. Anfangsdatum der Freistellung (start date in DD.MM.YYYY format)
4. Enddatum der Freistellung (end date in DD.MM.YYYY format)
5. Vorname Nachname (student full name)
6. Nachname (last name - not used)
7. Nachname des Lehrers (teacher name with title, e.g., "Herr Vollmer")
8. Name der Schule (school name)
9. Mailadresse (email - not used)
10. Klasse (class/grade)
11. Adresse (address - not used)
12. E-Mail-Adresse (email - not used)

## Letter Format

The generated letters follow the DIN-5008-B format with:
- DLRG-Jugend St. Leon header with logo
- Folding marks for envelopes
- No recipient address block (teacher name only in greeting)
- Formal request for Unterrichtsbefreiung (school absence) under § 4 SchulBesV BW
- Signature block for Marcel Holzhauer

## Notes

- The letter date is automatically set to today's date when compiled
- Dates in DD.MM.YYYY format are automatically converted to DD.MM.YY format
- The salutation automatically extracts "Herr" or "Frau" from the teacher name field
- If no gender prefix is found, it defaults to "Sehr geehrte Damen und Herren"
- Class information is only displayed if the `student-class` field is not empty
- School name is kept as a parameter but not displayed in the letter body
- The template references § 4 Abs. 1 and Abs. 3 Nr. 6 SchulBesV BW (Baden-Württemberg school attendance regulation)
- PDFs are named with both student name and event name to avoid conflicts when the same student has multiple events

## Requirements

- Typst compiler
- DLRG-Jugend logo file: `resources/Jugendlogo-transparent.jpeg`
- Footer file: `footer.typ`
- Base template: `brieftemplate.typ`

## Differences from Job Release Letters

| Aspect | Job Letters (`befreiung-job.typ`) | School Letters (`befreiung-schule.typ`) |
|--------|-----------------------------------|----------------------------------------|
| **Recipient** | Employee address shown | No address (teacher name in greeting only) |
| **Greeting** | "Sehr geehrter/e [HR Contact]" | "Sehr geehrter/e [Teacher Name]" |
| **Subject** | "Bitte um Freistellung für ehrenamtliche Tätigkeit" | "Unterrichtsbefreiung für [Student Name]" |
| **Body Request** | Requests "Sonderurlaub" from employer | Requests "Unterrichtsbefreiung" from teacher |
| **Legal Reference** | Gesetz zur Stärkung des Ehrenamts | § 4 Abs. 1 und Abs. 3 Nr. 6 SchulBesV BW |
| **Extra Info** | Mentions voluntary work, no compensation | Student class (if provided) |
| **Closing** | "In der Hoffnung auf Verständnis und Bewilligung" | "Bei sämtlichen Fragen stehe ich gerne zur Verfügung" |
| **Output Directory** | `output/` | `output-schule/` |
| **Filename Pattern** | `EmployeeName.pdf` | `StudentName_EventName.pdf` |

## Example Letter Content

```
[DLRG-Jugend St. Leon Header with Logo]

Unterrichtsbefreiung für Sarah Kamuf                    23.02.26

Sehr geehrter Herr Vollmer,

im Rahmen der Teilnahme an unserer diesjährigen Veranstaltung:

                    Pfingstzeltlager 2024

vom 17.05.24 bis 17.05.24

bitte ich Sie, Sarah Kamuf (Klasse: Js2f), von dem Unterricht zu befreien.
Ich beziehe mich hier auf § 4 Abs. 1 und Abs. 3 Nr. 6 SchulBesV BW.

Bei sämtlichen Fragen stehe ich gerne zur Verfügung.

Freundliche Grüße,


Marcel Holzhauer
Vorsitzender der Jugend
```

## Troubleshooting

### Issue: Script can't find CSV file
**Solution**: Make sure you're running the script from the `Befreiungen` directory and the CSV file name matches exactly (including spaces).

### Issue: Typst compilation fails
**Solution**: Ensure you have the latest version of Typst installed and all required files (logo, footer, brieftemplate) are in place.

### Issue: Generated PDFs have formatting issues
**Solution**: Check that dates are in DD.MM.YYYY format in the CSV. The script does not auto-correct date typos.

### Issue: Missing teacher salutation
**Solution**: Ensure teacher names in the CSV start with "Herr " or "Frau ". If neither is present, the letter will use "Sehr geehrte Damen und Herren" or "Sehr geehrte/r [Name]" as a fallback.
