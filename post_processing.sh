#!/bin/bash

# ==============================================================================
# Helper Function: Check if the previous command was successful
# ==============================================================================
check_success() {
    if [ $? -eq 0 ]; then
        echo -e "\e[32m[SUCCESS]\e[0m $1"
    else
        echo -e "\e[31m[ERROR]\e[0m $1 failed. Aborting script."
        exit 1
    fi
}

echo "Starting the document processing script..."
echo "----------------------------------------------------------------------"

# ==============================================================================
# Step 1: Remove the exact string from all .tex files in the current directory
# ==============================================================================
echo "Step 1: Removing welcome string from .tex files..."

# We use perl for robust in-place (-i) multi-line (-0777) string replacement.
# \r?\n ensures it works whether the files have Linux or Windows line endings.
for file in *.tex; do
    if [ -f "$file" ]; then
        perl -0777 -pi -e 's/\\bookmarksetup\{startatroot\}\r?\n\r?\n\\chapter\*\{Welcome\}\\label\{welcome\}\r?\n\r?\n\\markboth\{Welcome\}\{Welcome\}[ \t]*//g' "$file"
    fi
done

check_success "Step 1 completed: String successfully removed from *.tex files."

# ==============================================================================
# Step 2: Run lualatex (First pass)
# ==============================================================================
echo "Step 2: Running lualatex (Pass 1)..."
~/.TinyTeX/bin/x86_64-linux/lualatex Handbook-of-Regression-Modeling-in-People-Analytics.tex

check_success "Step 2 completed: First lualatex compilation successful."

# ==============================================================================
# Step 3: Run makeindex
# ==============================================================================
echo "Step 3: Running makeindex..."
~/.TinyTeX/bin/x86_64-linux/makeindex Handbook-of-Regression-Modeling-in-People-Analytics.idx

check_success "Step 3 completed: makeindex ran successfully."

# ==============================================================================
# Step 4: Run lualatex (Second pass)
# ==============================================================================
echo "Step 4: Running lualatex (Pass 2)..."
~/.TinyTeX/bin/x86_64-linux/lualatex Handbook-of-Regression-Modeling-in-People-Analytics.tex

check_success "Step 4 completed: Second lualatex compilation successful."

# ==============================================================================
# Step 5: Run embed.sh
# ==============================================================================
echo "Step 5: Running embed.sh..."
# Invoking with 'bash' ensures it runs even if the executable permission (chmod +x) is missing
bash ./embed.sh

check_success "Step 5 completed: embed.sh executed successfully."

# ==============================================================================
# Step 6: Run convert_to_cmyk.sh
# ==============================================================================
echo "Step 6: Running convert_to_cmyk.sh..."
bash ./convert_to_cmyk.sh

# remove Handbook-of-Regression-Modeling-in-People-Analytics_embedded.pdf
rm ./Handbook-of-Regression-Modeling-in-People-Analytics_embedded.pdf

check_success "Step 6 completed: convert_to_cmyk.sh executed successfully."

echo "----------------------------------------------------------------------"
echo -e "\e[32m[ALL STEPS COMPLETED SUCCESSFULLY]\e[0m Everything is finished!"
