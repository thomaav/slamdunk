LIB_SLAMCOMMON_DIR := $(dir $(lastword $(MAKEFILE_LIST)))
LIB_SLAMCOMMON     := $(LIB_SLAMCOMMON_DIR)libslamcommon.a

LIB_SLAMCOMMON_CXXFLAGS := -I$(LIB_SLAMCOMMON_DIR)src
LIB_SLAMCOMMON_LDFLAGS  := -pthread $(LIB_SLAMCOMMON)

CXXFLAGS += $(LIB_SLAMCOMMON_CXXFLAGS)
LDFLAGS  += $(LIB_SLAMCOMMON_LDFLAGS)

LOCAL_DEPENDENCIES+= $(LIB_SLAMCOMMON)

$(LIB_SLAMCOMMON): $(shell find $(LIB_SLAMCOMMON_DIR)src/ -name *.h -print -o -name *.cpp -print)
	make -C $(LIB_SLAMCOMMON_DIR)