#!/bin/bash

# Define the target PDF
PDF_FILE="Handbook-of-Regression-Modeling-in-People-Analytics.pdf"

# Make sure the file exists first
if [ ! -f "$PDF_FILE" ]; then
    echo "[ERROR] File '$PDF_FILE' not found."
    exit 1
fi

# Extract the total number of pages using pdfinfo
PAGE_COUNT=$(pdfinfo "$PDF_FILE" | grep "^Pages:" | awk '{print $2}')

echo "======================================================================"
echo "Steps 1 & 2: Checking font embedding status..."
echo "======================================================================"

# 1. Run pdffonts
# 2. Check the output
# We skip the first two header lines, and check the 'emb' column (5th from the right) for 'no'.
UNEMBEDDED_FONTS=$(pdffonts "$PDF_FILE" | tail -n +3 | awk '{if ($(NF-4) == "no") print $0}')

if [ -z "$UNEMBEDDED_FONTS" ]; then
    echo "[PASS] All fonts in '$PDF_FILE' are fully embedded."
else
    echo "[FAIL] The following fonts are NOT embedded:"
    echo "$UNEMBEDDED_FONTS"
fi

echo ""
echo "======================================================================"
echo "Steps 3 & 4: Checking CMYK color spaces via Ghostscript..."
echo "======================================================================"

# 3. Run Ghostscript with the inkcov device
echo "Running gs -sDEVICE=inkcov..."
GS_OUTPUT=$(gs -q -dNOPAUSE -dBATCH -sDEVICE=inkcov -o - "$PDF_FILE")

# 4. Check to see if any pages are not CMYK
# This looks for any line in the output that does NOT contain "CMYK OK"
NON_CMYK_PAGES=$(echo "$GS_OUTPUT" | grep -v "CMYK OK" | grep -v "^$")

if [ -z "$NON_CMYK_PAGES" ]; then
    echo "[PASS] All pages output successfully as CMYK."
else
    echo "[FAIL] Found output that was not CMYK:"
    echo "$NON_CMYK_PAGES"
fi

# ==============================================================================
# BONUS: Check if the document uses purely Black ink (Grayscale) or Color (CMY)
# ==============================================================================
# Because `inkcov` converts everything to CMYK, we can check columns 1, 2, and 3
# to see if Cyan, Magenta, or Yellow ink coverage is greater than 0.00000.
COLOR_PAGES=$(echo "$GS_OUTPUT" | awk '$1 != "0.00000" || $2 != "0.00000" || $3 != "0.00000" {print "-> Page " NR " uses color ink (CMY > 0)"}')

echo ""
if [ -z "$COLOR_PAGES" ]; then
    echo "[INFO] The document is purely grayscale (0% Cyan, Magenta, Yellow)."
else
    echo "[INFO] Color ink (Cyan, Magenta, or Yellow) is used on the following pages:"
    echo "$COLOR_PAGES"
fi

echo "======================================================================"
echo "Review Complete."
echo "Document: $PDF_FILE"
echo "Total Pages confirmed: $PAGE_COUNT"
echo "======================================================================"
