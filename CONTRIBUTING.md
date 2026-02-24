# Contributing to Handbook of Regression Modeling in People Analytics (2nd Edition)

Thank you for your interest in contributing to the Handbook of Regression Modeling in People Analytics! This project aims to provide comprehensive, accessible guidance on regression modeling techniques with practical examples in R and Python.

## Table of Contents

- [Types of Contributions](#types-of-contributions)
- [Development Environment Setup](#development-environment-setup)
- [Contribution Workflow](#contribution-workflow)
- [Content Standards](#content-standards)
- [Code Standards](#code-standards)
- [Testing and Validation](#testing-and-validation)
- [Reporting Issues](#reporting-issues)
- [Community Guidelines](#community-guidelines)

## Types of Contributions

We welcome various types of contributions:

### Content Contributions
- **Corrections**: Typos, grammatical errors, or technical inaccuracies
- **Clarifications**: Improvements to explanations or additional context
- **Examples**: New or improved code examples in R or Python
- **Additional Content**: New sections, case studies, or expanded topics (please open an issue first to discuss)

### Technical Contributions
- **Bug Fixes**: Fixing broken code examples or build issues
- **Improvements**: Enhancing existing code for clarity or efficiency
- **Accessibility**: Improving accessibility of the book content

### Documentation Contributions
- **Setup Instructions**: Improvements to development environment documentation
- **Process Documentation**: Clarifications to contribution guidelines

## Development Environment Setup

This book is built using [Quarto](https://quarto.org/), an open-source scientific and technical publishing system.

### Prerequisites

1. **Quarto**: Install from [quarto.org](https://quarto.org/docs/get-started/)
   - Minimum version: 1.4 or later recommended

2. **R** (Required for R examples)
   - Version: 4.5.1 or compatible
   - Download from [r-project.org](https://www.r-project.org/)
   - We use `renv` for R package management

3. **Python** (Required for Python examples)
   - Version: 3.9+ recommended
   - Common libraries: pandas, numpy, statsmodels, scikit-learn

4. **Git**: For version control

### Setting Up Your Environment

1. **Fork and Clone the Repository**
   ```bash
   git clone https://github.com/YOUR-USERNAME/regression-handbook-2nd-edition.git
   cd regression-handbook-2nd-edition
   ```

2. **Set Up R Environment**
   ```r
   # Open R or RStudio in the project directory
   # renv should automatically bootstrap when you open the project

   # If needed, manually restore packages:
   install.packages("renv")
   renv::restore()
   ```

3. **Preview the Book Locally**
   ```bash
   # From the project root directory
   quarto preview
   ```

   This will open a local preview in your browser. Changes to `.qmd` files will automatically refresh.

4. **Render the Full Book**
   ```bash
   quarto render
   ```

   The rendered book will be in the `docs/` directory.

### Troubleshooting Setup

- **R Packages**: If you encounter issues with R packages, ensure `renv` is properly initialized with `renv::restore()`
- **Quarto Version**: Check your Quarto version with `quarto --version`
- **Rendering Errors**: Check that both R and Python are in your system PATH

## Contribution Workflow

### 1. Before You Start

- **Check Existing Issues**: Look for existing issues or discussions related to your contribution
- **Open an Issue First** (for major changes): For substantial content additions or structural changes, please open an issue to discuss before investing time in a pull request
- **Small Fixes**: For typos or minor corrections, you can proceed directly to making changes

### 2. Create a Branch

```bash
git checkout -b descriptive-branch-name
```

Use descriptive branch names:
- `fix/typo-chapter-5`
- `improve/linear-regression-examples`
- `add/survival-analysis-python-example`

### 3. Make Your Changes

- Edit the relevant `.qmd` (Quarto Markdown) files
- Test your changes locally with `quarto preview`
- Ensure code examples run without errors
- Follow the content and code standards below

### 4. Commit Your Changes

```bash
git add .
git commit -m "Brief description of changes"
```

**Commit Message Guidelines:**
- Use clear, descriptive commit messages
- Start with a verb: "Fix", "Add", "Update", "Improve"
- Reference issue numbers if applicable: "Fix #123: Correct typo in Chapter 5"

### 5. Push and Create a Pull Request

```bash
git push origin your-branch-name
```

Then open a pull request on GitHub:
- Provide a clear title and description
- Reference related issues
- Explain what changed and why
- Include screenshots if relevant (for formatting or visual changes)

## Content Standards

### Writing Style

- **Clarity**: Write clearly and concisely; assume readers have varying statistical backgrounds
- **Accessibility**: Explain technical concepts without unnecessary jargon
- **Consistency**: Follow the existing tone and style of the book
- **Inclusive Language**: Use welcoming, inclusive language

### Structure

- **Headings**: Use clear, hierarchical headings (`#`, `##`, `###`)
- **Code Blocks**: Properly format code with language specifications:
  ````markdown
  ```r
  # R code here
  ```

  ```python
  # Python code here
  ```
  ````

### Mathematical Notation

- Use LaTeX for mathematical expressions: `$inline math$` or `$$display math$$`
- Ensure equations are properly formatted and explained

### References and Citations

- Add citations to `book.bib` in BibTeX format
- Reference using `@citationkey` in text

## Code Standards

### R Code

- **Style**: Follow the [Tidyverse Style Guide](https://style.tidyverse.org/)
- **Libraries**: Use tidyverse packages where appropriate
- **Comments**: Include explanatory comments for complex operations
- **Reproducibility**: Ensure code can be run by others with the renv environment

### Python Code

- **Style**: Follow [PEP 8](https://pep8.org/) style guidelines
- **Libraries**: Prefer standard data science libraries (pandas, numpy, scikit-learn, statsmodels)
- **Comments**: Include explanatory comments for complex operations
- **Reproducibility**: Ensure code is reproducible with common library versions

### General Code Practices

- **Test Code**: All code examples must run without errors
- **Efficient Code**: Prefer clear, readable code over overly clever solutions
- **Data**: If introducing new datasets, ensure they are appropriately licensed and documented
- **Output**: Show relevant output for examples to help readers understand results

## Testing and Validation

Before submitting your pull request:

1. **Preview Locally**: Run `quarto preview` to ensure your changes render correctly
2. **Full Render**: Run `quarto render` to verify the entire book builds without errors
3. **Run Code Examples**: Execute all code blocks you've modified to ensure they work
4. **Check Links**: Verify that any added hyperlinks work correctly
5. **Review Formatting**: Ensure equations, tables, and figures display properly

## Reporting Issues

### Bug Reports

Use the **Bug Report** issue template to report:
- Errors in code examples
- Technical inaccuracies
- Rendering or display problems
- Broken links

**Include:**
- Clear description of the issue
- Location (chapter, section, line number if applicable)
- Steps to reproduce (for code errors)
- Expected vs. actual behavior
- Your environment (Quarto version, R/Python version)

### Feature Requests

Use the **Feature Request** issue template to suggest:
- New content topics
- Additional examples
- Structural improvements
- Tool or resource additions

**Include:**
- Description of the proposed feature
- Rationale (why it would benefit the book)
- Suggested implementation approach (if applicable)

### General Questions

Use the **Discussion** template for:
- Questions about content or concepts
- Suggestions that aren't specific bugs or features
- General feedback

## Community Guidelines

### Code of Conduct

This project follows these core principles:

- **Respectful**: Treat all contributors with respect and kindness
- **Constructive**: Provide constructive feedback; be open to receiving it
- **Collaborative**: Work together toward improving the resource
- **Inclusive**: Welcome contributions from people of all backgrounds and skill levels

### Communication

- **Be Patient**: Remember that contributors and maintainers are often volunteers
- **Be Specific**: Provide clear, detailed information in issues and pull requests
- **Stay On Topic**: Keep discussions focused on the issue at hand
- **Assume Good Intent**: Approach disagreements with the assumption that others have good intentions

### Recognition

Contributors will be acknowledged in the book. Significant contributions may be highlighted in the acknowledgments section.

## Getting Help

- **Questions About Contributing**: Open a discussion issue
- **Technical Issues**: Check existing issues or open a new bug report
- **General Book Questions**: Refer to the book's content or open a discussion issue

---

Thank you for contributing to making regression modeling more accessible to the people analytics community!

**Maintained by**: Keith McNulty
**Repository**: https://github.com/keithmcnulty/regression-handbook-2nd-edition
**Book Website**: https://peopleanalytics-regression-book-2nd-edition.org/
