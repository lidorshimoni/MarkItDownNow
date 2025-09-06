# MarkItDown Distribution

[![PyPI](https://img.shields.io/pypi/v/markitdown.svg)](https://pypi.org/project/markitdown/)
![PyPI - Downloads](https://img.shields.io/pypi/dd/markitdown)
[![Built by AutoGen Team](https://img.shields.io/badge/Built%20by-AutoGen%20Team-blue)](https://github.com/microsoft/autogen)

This repository provides packaging and distribution scripts for [MarkItDown](https://github.com/microsoft/markitdown), a lightweight Python utility for converting various files to Markdown for use with LLMs and related text analysis pipelines.

## About MarkItDown

MarkItDown converts files like PDF, PowerPoint, Word, Excel, Images, Audio, HTML, and more to Markdown format, preserving important document structure and content. It's designed for text analysis tools and LLMs, with a focus on token-efficient Markdown output.

### Supported Formats
- PDF
- PowerPoint (PPTX)
- Word (DOCX)
- Excel (XLSX, XLS)
- Images (with EXIF metadata and OCR)
- Audio (with EXIF metadata and speech transcription)
- HTML
- Text-based formats (CSV, JSON, XML)
- ZIP files
- YouTube URLs
- EPubs
- And more!

## Repository Contents

This repository includes:
- `markitdown_build/`: The complete MarkItDown source code and packages
- `Markitdown_to_exe.bat`: Batch script to build a Windows executable using PyInstaller
- `markitdown_silent_wrapper.vbs`: VBScript wrapper for silent installation
- `markitdown-installer.iss`: Inno Setup script for creating a Windows installer
- `dist/`: Distribution artifacts (generated)

## Installation

### From PyPI (Recommended)
```bash
pip install 'markitdown[all]'
```

### Windows Executable
Download the latest executable from the [Releases](https://github.com/microsoft/markitdown/releases) page or build it yourself:

1. Run `Markitdown_to_exe.bat` to generate the executable
2. The executable will be in the `dist/` folder

### Windows Installer
1. Install [Inno Setup](http://www.jrsoftware.org/isinfo.php)
2. Run `markitdown-installer.iss` to build the installer
3. The installer will be in the `dist/` folder

## Usage

### Command Line
```bash
markitdown path-to-file.pdf > document.md
```

### Python API
```python
from markitdown import MarkItDown

md = MarkItDown()
result = md.convert("example.pdf")
print(result.text_content)
```

## Building from Source

1. Clone this repository:
```bash
git clone https://github.com/microsoft/markitdown.git
cd markitdown
```

2. Navigate to the package:
```bash
cd markitdown_build/markitdown/packages/markitdown
```

3. Install in development mode:
```bash
pip install -e '.[all]'
```

## Prerequisites

- Python 3.10 or higher
- For building executables: PyInstaller
- For building installers: Inno Setup

## Contributing

This repository is part of the main [MarkItDown project](https://github.com/microsoft/markitdown). Please see the main repository for contribution guidelines, issues, and pull requests.

## License

This project is licensed under the MIT License - see the [LICENSE](markitdown_build/markitdown/LICENSE) file for details.

## Trademarks

This project may contain trademarks or logos for projects, products, or services. Authorized use of Microsoft trademarks or logos is subject to and must follow [Microsoft's Trademark & Brand Guidelines](https://www.microsoft.com/en-us/legal/intellectualproperty/trademarks/usage/general).</content>
<parameter name="filePath">/home/lidor/Desktop2/MarkItDownNow/README.md
