# Define input and output file names
INPUT_FILE="Handbook-of-Regression-Modeling-in-People-Analytics.pdf"
OUTPUT_FILE="Handbook-of-Regression-Modeling-in-People-Analytics_embedded.pdf"

# Check if Ghostscript is installed
if ! command -v gs &> /dev/null; then
    echo "Error: Ghostscript (gs) is not installed. Please install it and try again."
    exit 1
fi

# Check if the input file exists
if [ ! -f "$INPUT_FILE" ]; then
    echo "Error: Input file '$INPUT_FILE' not found in the current directory."
    exit 1
fi

echo "Processing '$INPUT_FILE' to embed all fonts..."

# Run Ghostscript command
gs -dNOPAUSE -dBATCH -dSAFER \
   -sDEVICE=pdfwrite \
   -dPDFSETTINGS=/prepress \
   -dEmbedAllFonts=true \
   -dSubsetFonts=true \
   -sOutputFile="$OUTPUT_FILE" \
   "$INPUT_FILE"

# Check if the command was successful
if [ $? -eq 0 ]; then
    echo "Success! The font-embedded PDF has been saved as: $OUTPUT_FILE"
else
    echo "Something went wrong during the Ghostscript processing."
fi


