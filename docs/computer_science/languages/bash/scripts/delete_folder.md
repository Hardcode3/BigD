# Delete a folder properly

```bash
#!/bin/bash

# tell the user the current working directory
echo "Working in the directory $(pwd)"

# get the relative path of the script given the location at which it is executed
# and change directory to the script location
RELATIVE_EXEC_PATH="$( dirname "${BASH_SOURCE[0]}" )"
echo "Relative path of the script relative to the execution path: ${RELATIVE_EXEC_PATH}"
cd ${RELATIVE_EXEC_PATH}

# get the absolute path of the script
SCRIPT_DIR=$(pwd)
echo "Directory of the script: ${SCRIPT_DIR}"

# set the folder to be deleted relatively to the location of the script
BUILD_DIR="${SCRIPT_DIR}/../build"

# check if the folder exists and if so, delete it
if [ -d "${BUILD_DIR}" ]; then
    rm -rf "${BUILD_DIR}"
    echo "Folder ${BUILD_DIR} successfully deleted. Solution has been cleared."
else
    echo "Folder ${BUILD_DIR} not found (not deleted). Solution may already be cleared."
fi
```
