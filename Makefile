# This make file is written for Windows only
# good reference about patten matching: 
# https://stackoverflow.com/questions/40621451/makefile-automatically-compile-all-c-files-keeping-o-files-in-separate-folde


# define build folder here
FOLDER_BUILD 	:= build
# define source folder here
FOLDER_SOURCE 	:= src
# define application name here
TARGET_NAME 	:= app

#----------------------------------
# Don't change anything below here
#----------------------------------

SHELL	:= cmd
CC 		:= gcc

CFLAGS  = -std=c99
CFLAGS += -Werror
CFLAGS += -Wall
CFLAGS += -Wextra
CFLAGS += -Wpointer-arith
CFLAGS += -Wcast-align
CFLAGS += -Wwrite-strings
CFLAGS += -Wswitch-default
CFLAGS += -Wunreachable-code
CFLAGS += -Winit-self
CFLAGS += -Wmissing-field-initializers
CFLAGS += -Wno-unknown-pragmas
CFLAGS += -Wstrict-prototypes
CFLAGS += -Wundef
CFLAGS += -Wold-style-definition
CFLAGS += -Wno-misleading-indentation

IF_NOT_EXIT			:=@if not exist
IF_EXIT				:=@if exist
RMDIR				:=@rmdir /S /Q
MKDIR				:=@mkdir
MAKE_BUILD_FOLDER	:=$(IF_NOT_EXIT) $(FOLDER_BUILD)/NUL $(MKDIR) $(FOLDER_BUILD)
REMOVE_BUILD_FOLDER	:=$(IF_EXIT) $(FOLDER_BUILD) $(RMDIR) $(FOLDER_BUILD)


TARGET			:= $(FOLDER_BUILD)/$(TARGET_NAME)
RUN_TARGET		:= @$(TARGET)

FILES_SOURCE		:= $(wildcard $(FOLDER_SOURCE)/*.c)
FILES_OBJECT			:= $(patsubst $(FOLDER_SOURCE)/%.c,$(FOLDER_BUILD)/%.o,$(FILES_SOURCE))

# build application
$(TARGET): $(FILES_OBJECT)
	$(MAKE_BUILD_FOLDER)
	$(CC) $(CFLAGS) -o $@ $^
	$(RUN_TARGET)

# build object files
$(FOLDER_BUILD)/%.o: $(FOLDER_SOURCE)/%.c
	$(MAKE_BUILD_FOLDER)
	$(CC) -I$(FOLDER_SOURCE) $(CFLAGS) -c $< -o $@

# clean build folder
.PHONY: clean
clean:
	$(REMOVE_BUILD_FOLDER)

.DELETE_ON_ERROR:
	$(REMOVE_BUILD_FOLDER)
