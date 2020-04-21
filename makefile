#
# The root makefile
#

OUTPUT_PATH=out
OUTPUT_NAME=test

# The cross compile if exists, otherwise uses the gcc
CROSS_COMPILE?=

#
# Source (.c) Files
#
SOURCE_FILES= \
	Source/test.c

#
# Header (.h) File Directories
#
#  Bear in mind, include directories must have -I prefix
#
INCLUDE_DIRECTORIES= \
	-IInclude/

#
# Project Definitions
#
#  Bear in mind, definitions must have -D prefix
#
DEFINES= \
	-DTEST_CONFIG=255

#
# All Flags
#
CFLAGS=${INCLUDE_DIRECTORIES} ${DEFINES}


#############################################
# Rules
#############################################


#
# The main rule
#
all: out test

# Rebuild
rebuild: clean all

# The test rule
test:
	${CROSS_COMPILE}gcc -g ${SOURCE_FILES} ${CFLAGS} -o ${OUTPUT_PATH}/${OUTPUT_NAME}

# The clean rule
clean:
	rm -f test

# The rule to create out path
out:
	mkdir -p ${OUTPUT_PATH}

# The rule to run the output executable
run:
	./${OUTPUT_PATH}/${OUTPUT_NAME}

