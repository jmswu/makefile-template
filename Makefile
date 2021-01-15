# This make file is written for Windows only

SHELL	:= cmd
CC 		:= gcc
FLAGS 	:= -Wall -std=c99

FOLDER_BUILD 	:= build
FOLDER_SOURCE 	:= src

IF_NOT_EXIT			:= @if not exist	# windows command
IF_EXIT				:= @if exist		# windows command
RMDIR				:= @rmdir /S /Q		# windows command
MKDIR				:= @mkdir			# windows command
MAKE_BUILD_FOLDER	:= $(IF_NOT_EXIT) $(FOLDER_BUILD)/NUL $(MKDIR) $(FOLDER_BUILD)
REMOVE_BUILD_FOLDER	:= $(IF_EXIT) $(FOLDER_BUILD) $(RMDIR) $(FOLDER_BUILD)


TARGET_NAME 	:= app
TARGET			:= $(FOLDER_BUILD)/$(TARGET_NAME)
TARGET_RUN		:= @$(TARGET)

FILE_SOURCE		:= $(wildcard $(FOLDER_SOURCE)/*.c)

EXTENSION_DOT_C	:= .c
EXTENSION_DOC_O	:= .o
_FILE_OBJECT 	:= $(subst $(EXTENSION_DOT_C),$(EXTENSION_DOC_O),$(FILE_SOURCE))
FILE_OBJECT 	:= $(subst $(FOLDER_SOURCE),$(FOLDER_BUILD),$(_FILE_OBJECT))

$(TARGET): $(FILE_SOURCE)
	$(MAKE_BUILD_FOLDER)
	$(CC) $(FLAGS) -o $@ $^
	$(TARGET_RUN)

.PHONY: clean
clean:
	$(REMOVE_BUILD_FOLDER)