# Configure a Python environment

!!! citation "Refs"
    - [Oracle](https://docs.oracle.com/cd/E19683-01/816-0210/6m6nb7mao/index.html)
    - [RedHat](https://www.redhat.com/sysadmin/arguments-options-bash-scripts)

```bash
#!/bin/bash

###########################################################################################

# detect the installed python version added to the path
# should also consider the different names for python i.e. python, python3 
# mutliple python versions may be installed

# define a script version here
SCRIPT_VERSION="1.0.0"

PY_LAUNCHER_EXE="py"
COMMON_PY_LAUNCHER_LOC="C:\Windows\py.exe" # TODO add this check
PYTHON_REQUIRED_VERSION="3.9"
INSTALL_TOKEN="<token_here>"
REQUIRED_PACKAGES=(
    "matplotlib==3.4.3"
    "numpy>=1.20.3"
    "scipy==1.7.3"
    "tqdm==4.64.1"
    "segysak==0.4"
    "ebcdic==1.1.1"
    "PyQt5==5.15.7"
    "numba==0.57.0"
    "pandas==2.0.3"
    "xlsxwriter==3.0.3"
    "netcdf4==1.5.7"
    "xarray==2023.6.0"
    "seg2_files==0.0.1"
    "obspy==1.4.0"
    "cython==3.0.0"
    "spyder-kernels"
    )

############################################################
# Quick helper function to display script version.         #
############################################################
display_script_version()
{
    echo "Version $SCRIPT_VERSION"
}

############################################################
# Help                                                     #
############################################################
display_help()
{
    echo "#################################################################################################################################################"
    echo "SCRIPT MANUAL"
    echo
    echo ">>> This script is meant to be used to install a python virtual environment
    echo ""
    echo "WHAT IS A VENV ?"
    echo "|  A Python virtual environment, often referred to as venv (short for "virtual environment"), is a self-contained directory that contains "
    echo "|  a Python interpreter and a set of additional tools and libraries. The purpose of using a virtual environment is to isolate dependencies "
    echo "|  and packages for a specific project, preventing conflicts between different projects that may require different versions of the same package."
    echo ""
    echo "Syntax is: script_name.sh [-h|help|v|version|venv]"
    echo ""
    echo "Options:"
    echo "|"
    echo "|  -h                                Display help for the script and exit"
    echo "|  -v                                Print software version and exit"
    echo "|  -d <venv_dir> -n <venv_name>      Create a virtual environment for the monitoring team"
    echo "|                                      argument 1: <venv_dir> is the path where you want to create your venv (to a folder)"
    echo "|                                      argument 2: <venv_name> is the name of the venv that will be created for you."
    echo "|                                    NOTE: You need to activate your venv afterwards"
    echo "|  -b                                Install the librairies on the base python interpreter instead of the virtual environment"
    echo ""
    echo "Packages that will be installed are:"
    echo 
    for package in "${REQUIRED_PACKAGES[@]}"; do
        echo "| $@ | $package"
    done
    echo "################################################################################################################################"
}

############################################################
# Quick helper function to display the detected arguments. #
############################################################
display_args()
{
    # Check provided arguments
    echo "Detected the following arguments:"
    for arg in "$@"; do
        echo "| $arg"
    done
}

############################################################
# Determines if a folder exists                            #
############################################################
folder_exists()
{
    local folder_path="$1"

    if [ -z "$folder_path" ]; then
        echo "Error: The folder path "${folder_path}" does not exist in your files, double check it..."
        return 1
    fi

    if [ -d "$folder_path" ]; then
        return 0
    else
        return 1
    fi
}

############################################################
# Determines if a file exists                              #
############################################################
file_exists()
{
    local file_path="$1"

    if [ -z "$file_path" ]; then
        echo "Error: The file path "${file_path}" does not exist in your files, double check it..."
        return 1
    fi

    if [ -d "$file_path" ]; then
        return 0
    else
        return 1
    fi
}

file_exists()
{
    local file_path="$1"

    if [ -z "$file_path" ]; then
        echo "Error: The file path "${file_path}" does not exist in your files, double check it..."
        return 1
    fi

    if [ -d "$file_path" ]; then
        return 0
    else
        return 1
    fi
}

############################################################
# Main program.                                            #
############################################################
USE_VENV=0

OPTSTRING="hvn:d:b"
while getopts "$OPTSTRING" option; do
    case $option in
        h)
            display_help
            exit 0
            ;;
        v)
            display_script_version
            exit 0
            ;;
        n)
            VENV_NAME=$OPTARG
            USE_VENV=1
            ;;
        d)
            VENV_DIR=$OPTARG
            USE_VENV=1
            ;;
        b) 
            USE_VENV=0
            ;;
        ?) # handle invalid options here
            echo
            echo ">>> Invalid option ${option}, printing usage <<<"
            echo
            display_help
            exit 0
            ;;
   esac
done

if [ -z "$@" ]; then
    echo "No argument detected, please provite an argument to run the script..."
    display_help
    exit 1
fi

if [ $USE_VENV -eq 1 ]; then
    # Check if both path and name options are provided
    if [ -z "$VENV_NAME" ] || [ -z "$VENV_DIR" ]; then
        echo "Both path and name arguments have to be passed to the script in order to create the virtual environment..."
        echo 
        display_help
        exit 1
    fi

    # Check if both paths exist
    if folder_exists "$VENV_DIR"; then
        echo "Install folder <"$VENV_DIR"> has been found..."
    else
        echo "Error, the folder <$VENV_DIR> specified to install the virtual environment does not exist..."
        exit 1
    fi

    # Build the venv path
    VENV_PATH="${VENV_DIR}/${VENV_NAME}"
fi

# Prepare the installation of the environment
echo "Preparing the installation for the python requirements of the Monitoring Team..."
echo "Checking the available Python versions on the system..."
if command -v "${PY_LAUNCHER_EXE}" >/dev/null 2>&1; then
    PY_LAUNCHER_PATH=$(where "${PY_LAUNCHER_EXE}")
    echo "The launcher py has been detected at path ${PY_LAUNCHER_PATH}, proceeding..."
else
    echo "The launcher py was not found, please install python with the py launcher to be able to proceed..."
    echo "Download python here: https://www.python.org/downloads/windows/ and check 'dowload the py launcher' during installation..."
    read -p "Press Enter to close this window..."
    exit 1
fi

echo "Checking if python ${PYTHON_REQUIRED_VERSION} is installed on the system..."
echo "Detected the following ${PY_LAUNCHER_EXE} versions:"
AVAILABLE_PYTHON_VERSIONS="$(${PY_LAUNCHER_EXE} --list)"
echo "${AVAILABLE_PYTHON_VERSIONS}"

if echo "${AVAILABLE_PYTHON_VERSIONS}" | grep -q "${PYTHON_REQUIRED_VERSION}"; then
    PYTHON_CALL="${PY_LAUNCHER_EXE} -${PYTHON_REQUIRED_VERSION}"
    PYTHON_INSTALLED_VERSION=$(${PYTHON_CALL} --version)
    echo "Python version ${PYTHON_INSTALLED_VERSION} found..."
else
    echo "Python version ${PYTHON_REQUIRED_VERSION}.* not found in the available versions, please install a valid python version..."
    echo "Download python here: https://www.python.org/downloads/windows/"
    read -p "Press Enter to close this window..."
    exit 1
fi

if [ $USE_VENV -eq 1 ]; then
    # Create and activate the python environment to install the packages
    # Check if the venv files exist
    ${PYTHON_CALL} -m venv ${VENV_PATH}
    if folder_exists "${VENV_PATH}"; then
        echo "Virtual environment ${VENV_PATH} has been successfully built..."
    else
        echo "Error: The virtual environment ${VENV_PATH} has not been built correctly..."
        exit 1
    fi
    source "${VENV_PATH}/Scripts/activate"
    echo "Virtual environment activated, ready to install packages"
fi

echo "Installing Custom lib..."
if [ $USE_VENV -eq 1 ]; then
    pip install ${INSTALL_TOKEN} > /dev/null 2>&1
else
    ${PYTHON_CALL} -m pip install ${INSTALL_TOKEN} > /dev/null 2>&1
fi
CUSTOM_LIB_INSTALL_EXIT_CODE=$?

if [ ${CUSTOM_LIB_INSTALL_EXIT_CODE} -eq 0 ]; then
    echo "Successfully installed custom lib on the base Python environment with exit code ${CUSTOM_LIB_INSTALL_EXIT_CODE}"
else
    echo "Failed to install custom lib with exit code ${CUSTOM_LIB_INSTALL_EXIT_CODE}, call a dev..."
    read -p "Press Enter to close this window..."
    exit 1
fi

for package in "${REQUIRED_PACKAGES[@]}"; do
    if [ $USE_VENV -eq 0 ]; then
        ${PYTHON_CALL} -m pip install ${package} > /dev/null 2>&1
    else
        pip install ${package} > /dev/null 2>&1
    fi
	EXIT_CODE=$?
    if [ $EXIT_CODE -eq 0 ]; then
        echo "Successfully installed ${package} on the Python environment with exit code ${EXIT_CODE}"
	else
		echo "Could not install ${package} on the Python environment with exit code ${EXIT_CODE}"
    fi
done

if [ $USE_VENV -eq 1 ]; then
    # deactivate the Python venv after having installed the packages
    echo "Deactivating the virtual environment"
    deactivate
fi

echo "Finished installing the requirements on the base Python environment..."

echo "The packages installed on the base Python environment are:"
INSTALLED_PACKAGES="$(${PYTHON_CALL} -m pip list)"
echo "${INSTALLED_PACKAGES}"

echo "Python ${PYTHON_INSTALLED_VERSION} is now configured"

read -p "Press Enter to close this window..."

exit 0
```
