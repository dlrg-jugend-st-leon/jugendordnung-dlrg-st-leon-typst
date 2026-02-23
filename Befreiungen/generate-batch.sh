#!/bin/bash

# Script to generate individual PDF files for each row in the CSV
# Each PDF will be named after the employee

set -e  # Exit on error

# Configuration
CSV_FILE="Befreiung für Veranstaltunge n von Job (Antworten) - Formularantworten 1.csv"
TEMPLATE="befreiung-job-single.typ"
OUTPUT_DIR="output"
FORCE=false

# Parse command line arguments
while [[ $# -gt 0 ]]; do
  case $1 in
    --force)
      FORCE=true
      shift
      ;;
    --help|-h)
      echo "Usage: $0 [--force]"
      echo "  --force  Regenerate all PDFs even if they already exist"
      exit 0
      ;;
    *)
      echo "Unknown option: $1"
      echo "Use --help for usage information"
      exit 1
      ;;
  esac
done

# Get the directory where the script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

# Check if CSV file exists
if [ ! -f "$CSV_FILE" ]; then
  echo "Error: CSV file not found: $CSV_FILE"
  exit 1
fi

# Check if template exists
if [ ! -f "$TEMPLATE" ]; then
  echo "Error: Template file not found: $TEMPLATE"
  exit 1
fi

# Create output directory if it doesn't exist
mkdir -p "$OUTPUT_DIR"

echo "Starting batch generation..."
echo "CSV file: $CSV_FILE"
echo "Output directory: $OUTPUT_DIR"
echo ""

# Function to sanitize filename (replace spaces with underscores, remove special chars)
sanitize_filename() {
  echo "$1" | sed 's/ /_/g' | sed 's/[^a-zA-Z0-9_-]//g'
}

# Use Python to process the CSV and generate PDFs
# Export variables for Python
export CSV_FILE
export TEMPLATE
export OUTPUT_DIR
export FORCE

python3 << 'PYTHON_SCRIPT'
import csv
import subprocess
import sys
import re
import os

def sanitize_filename(name):
    """Sanitize filename by replacing spaces with underscores and removing special chars"""
    name = name.strip()
    name = re.sub(r'\s+', '_', name)
    name = re.sub(r'[^a-zA-Z0-9_-]', '', name)
    return name

csv_file = os.environ.get('CSV_FILE')
template = os.environ.get('TEMPLATE')
output_dir = os.environ.get('OUTPUT_DIR')
force = os.environ.get('FORCE') == 'true'

skipped = 0
generated = 0
failed = 0

with open(csv_file, 'r', encoding='utf-8') as f:
    reader = csv.reader(f)
    rows = list(reader)
    
    # Skip header
    data_rows = rows[1:]
    total = len(data_rows)
    
    for idx, row in enumerate(data_rows, 1):
        # Pad row if needed
        while len(row) < 8:
            row.append('')
        
        # Extract fields
        # 0: Zeitstempel
        # 1: E-Mail-Adresse
        # 2: Veranstaltungsname
        # 3: Anfangsdatum der Freistellung
        # 4: Enddatum der Freistellung
        # 5: Vorname Nachname
        # 6: Adresse des Betreuers
        # 7: (Herr/Frau) + Nachname des Personalverantwortlichen
        
        event_name = row[2].strip()
        start_date = row[3].strip()
        end_date = row[4].strip()
        employee_name = row[5].strip()
        employee_address = row[6].strip()
        hr_contact = row[7].strip()
        
        # Skip if employee name is empty
        if not employee_name:
            print(f"[{idx}/{total}] Skipping row (empty employee name)")
            skipped += 1
            continue
        
        # Generate output filename
        safe_name = sanitize_filename(employee_name)
        output_file = f"{output_dir}/{safe_name}.pdf"
        
        # Check if file already exists
        if os.path.exists(output_file) and not force:
            print(f"[{idx}/{total}] Skipping (already exists): {employee_name}")
            skipped += 1
            continue
        
        print(f"[{idx}/{total}] Generating: {employee_name} -> {safe_name}.pdf")
        
        # Compile with typst
        try:
            result = subprocess.run([
                'typst', 'compile', template, output_file,
                '--root', '..',
                '--input', f'event-name={event_name}',
                '--input', f'start-date={start_date}',
                '--input', f'end-date={end_date}',
                '--input', f'employee-name={employee_name}',
                '--input', f'employee-address={employee_address}',
                '--input', f'hr-contact={hr_contact}'
            ], capture_output=True, text=True, timeout=30)
            
            if result.returncode == 0:
                generated += 1
            else:
                print(f"  ERROR: Failed to generate PDF for {employee_name}")
                if result.stderr:
                    print(f"  {result.stderr}")
                failed += 1
        except Exception as e:
            print(f"  ERROR: Exception while generating PDF for {employee_name}: {e}")
            failed += 1

print()
print("Batch generation complete!")
print(f"Generated: {generated}")
print(f"Skipped: {skipped}")
print(f"Failed: {failed}")
print(f"Total rows processed: {total}")
PYTHON_SCRIPT

# Note: Summary is printed by the Python script above
