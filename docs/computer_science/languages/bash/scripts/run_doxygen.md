# Run doxygen on a C++ project

!!! warning
    The source code directory must be relative from where the code is executed
    If the source code starts `..` from the documentation folder, then the source code directory is `../`

!!! warning
    The `OUTPUT_DIRECTORY` variable must be set to none (no input)
    Otherwise, the output path is built from the executable path.
    It ensures that the doc is in the same folder no matter where doxygen is executed.

```bash
#!/bin/bash

# tell the user the current working directory
echo "Working in the directory $(pwd)"

# get the relative path of the script given the location at which it is executed
# and change directory to the script location
RELATIVE_EXEC_PATH="$( dirname "${BASH_SOURCE[0]}" )"
echo "Relative path of the script relative to the execution path: ${RELATIVE_EXEC_PATH}"
cd "${RELATIVE_EXEC_PATH}"

# get the absolute path of the script
SCRIPT_DIR=$(pwd)
echo "Directory of the script: ${SCRIPT_DIR}"

# set the root directory
ROOT_DIR="${SCRIPT_DIR}/.."

# set the documentation folder relatively to the location of the script and create the path to the Doxyfile
DOC_DIR="${ROOT_DIR}/doc"
DOXYFILE_ABS_PATH="${DOC_DIR}/Doxyfile"

DOXYGEN_EXEC_NAME="doxygen"
# Check if Doxygen is installed and added to the PATH
if ! command -v "${DOXYGEN_EXEC_NAME}" &/dev/null; then
    echo "Error: Doxygen is not installed. Please install Doxygen before running this script or add it to your PATH."
    exit 1
else
    DOXYGEN_EXEC_PATH=$(where "${DOXYGEN_EXEC_NAME}")
    DOXYGEN_VERSION=$("${DOXYGEN_EXEC_NAME}" -v)
    echo "Doxygen version ${DOXYGEN_VERSION} executable found at path ${DOXYGEN_EXEC_PATH}"
fi

# Check if the documentation exists
if [ ! -d "${DOC_DIR}" ]; then
    echo "Error: Documentation directory not found at ${DOC_DIR}. Please check if the directory exists."
    exit 1
fi

# Check if the Doxyfile exists
if [ ! -f "${DOXYFILE_ABS_PATH}" ]; then
    echo "Error: Doxyfile not found at ${DOXYFILE_ABS_PATH}. Please check if the text file exists in the documentation directory at ${DOC_DIR}"
    exit 1
fi

# Execute Doxygen with the specified Doxyfile
cd "${DOC_DIR}"
echo "Changing directory to the root of the project: $(pwd)"
echo "Running doxygen on the file ${DOXYFILE_ABS_PATH}"
doxygen "${DOXYFILE_ABS_PATH}"
DOXYGEN_EXIT_CODE=$?

# Generated doc path
OUTPUT_DOC_NAME="SpotDemigDoc"
OUTPUT_DOC_PATH="${DOC_DIR}/${OUTPUT_DOC_NAME}/index.html"

if [ $DOXYGEN_EXIT_CODE -eq 0 ]; then
    echo "Doxygen executed successfully, articafts are in ${DOC_DIR}/${OUTPUT_DOC_NAME} exit code ${DOXYGEN_EXIT_CODE}."
else
    echo "Doxygen encountered an error, exit code ${DOXYGEN_EXIT_CODE}."
    exit 1
fi

if [ ! -f $OUTPUT_DOC_PATH ]; then
    echo "Error, the output doxygen index html index at $OUTPUT_DOC_PATH can not be open because the path is incorrect"
    exit 1
fi

# Check the operating system and open the index.html from the generated doc
case "$(uname -s)" in
    Linux*)                         # Linux
        xdg-open $OUTPUT_DOC_PATH
        ;;
    Darwin*)                        # macOS
        open $OUTPUT_DOC_PATH
        ;;
    CYGWIN*|MINGW*)                 # Windows (Cygwin and MSYS2)
        start $OUTPUT_DOC_PATH
        ;;
    *)
        echo "Unsupported operating system"
        exit 1
        ;;
esac
```
