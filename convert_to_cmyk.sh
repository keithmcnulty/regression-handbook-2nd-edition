#!/bin/bash

# Define input and output filenames
INPUT_PDF="Handbook-of-Regression-Modeling-in-People-Analytics_embedded.pdf"
OUTPUT_PDF="Handbook-of-Regression-Modeling-in-People-Analytics_embedded_CMYK.pdf"

# Check if Ghostscript is installed
if ! command -v gs &> /dev/null; then
    echo "Error: Ghostscript (gs) is not installed."
    echo "Please install it using your package manager (e.g., 'brew install ghostscript' on macOS or 'sudo apt install ghostscript' on Ubuntu)."
    exit 1
fi

# Check if the input file exists
if [ ! -f "$INPUT_PDF" ]; then
    echo "Error: Input file '$INPUT_PDF' not found in the current directory."
    exit 1
fi

echo "Converting '$INPUT_PDF' to CMYK..."
echo "This may take a moment depending on the file size and number of figures..."

# Run Ghostscript conversion
gs -o "$OUTPUT_PDF" \
   -sDEVICE=pdfwrite \
   -sColorConversionStrategy=CMYK \
   -sProcessColorModel=DeviceCMYK \
   -dCompatibilityLevel=1.4 \
   -dPDFSETTINGS=/prepress \
   -dNOPAUSE \
   -dBATCH \
   "$INPUT_PDF"

# Check if the conversion was successful
if [ $? -eq 0 ]; then
    echo "--------------------------------------------------"
    echo "Success! Conversion complete."
    echo "Saved as: $OUTPUT_PDF"
    echo "--------------------------------------------------"
else
    echo "Error: Something went wrong during the conversion process."
    exit 1
fi
