# Configure and build a CMake solution

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

# set the build folder to be created relatively to the location of the script
BUILD_DIR="${ROOT_DIR}/build"

CMAKE_EXEC_NAME="cmake"
# Check if cmake is installed and added to the PATH
if ! command -v "${CMAKE_EXEC_NAME}" &> /dev/null; then
    echo "Error: CMake is not installed. Please install CMake before running this script or add it to your PATH."
    exit 1
else
    CMAKE_EXEC_PATH=$(where "${CMAKE_EXEC_NAME}")
    CMAKE_VERSION=$("${CMAKE_EXEC_NAME}" --version)
    echo "CMake version ${CMAKE_VERSION} executable found at path ${CMAKE_EXEC_PATH}"
fi

# if the build directory does not exist, then create it and otherwise just use it for cmake
if [ -d "${BUILD_DIR}" ]; then
    echo "Found an existing build directory at the path ${BUILD_DIR}, proceeding"
else
    echo "Creating the build directory in ${BUILD_DIR}"
    mkdir "${BUILD_DIR}"
    echo "Successfully created the build directory in ${BUILD_DIR}"
fi

cd "${ROOT_DIR}"
cmake -B "${BUILD_DIR}"
echo "CMake configuration done, building the solution..."

THREADS_NO=4
cmake --build "${BUILD_DIR}" --config Release -j ${THREADS_NO}
echo "Generating done, build artifacts has been created in ${BUILD_DIR}"
```
