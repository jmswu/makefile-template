# This make file is written for Windows only



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
FLAGS 	:= -Wall -std=c99

IF_NOT_EXIT			:=@if not exist
IF_EXIT				:=@if exist
RMDIR				:=@rmdir /S /Q
MKDIR				:=@mkdir
MAKE_BUILD_FOLDER	:=$(IF_NOT_EXIT) $(FOLDER_BUILD)/NUL $(MKDIR) $(FOLDER_BUILD)
REMOVE_BUILD_FOLDER	:=$(IF_EXIT) $(FOLDER_BUILD) $(RMDIR) $(FOLDER_BUILD)


TARGET			:= $(FOLDER_BUILD)/$(TARGET_NAME)
TARGET_RUN		:= @$(TARGET)

FILE_SOURCE		:= $(wildcard $(FOLDER_SOURCE)/*.c)

EXTENSION_DOT_C	:= .c
EXTENSION_DOC_O	:= .o
_FILE_OBJECT 	:= $(subst $(EXTENSION_DOT_C),$(EXTENSION_DOC_O),$(FILE_SOURCE))
FILE_OBJECT 	:= $(subst $(FOLDER_SOURCE),$(FOLDER_BUILD),$(_FILE_OBJECT))

# build application
$(TARGET): $(FILE_SOURCE)
	$(MAKE_BUILD_FOLDER)
	$(CC) $(FLAGS) -o $@ $^
	$(TARGET_RUN)

# clean build folder
.PHONY: clean
clean:
	$(REMOVE_BUILD_FOLDER)

