

set(SVLS_DEFINITIONS "")
set(SVLS_NEEDED_LIBS svLS)

if(WIN32 OR (CYGWIN AND NOT IS64))
	#no svls for x32
endif()

if(LINUX AND IS64)
	#no SVLS for linux
endif()

if(IS64 AND (WIN32 OR CYGWIN))
unset(SVLS_INCLUDE_DIR)
	set(SVLS_PATH_PREFIX "svls-2013.08.10/win/x64")
	set(SVLS_FULL_PATH "${LicensedLibs_Bin_Directory}${SVLS_PATH_PREFIX}")
	set(SVLS_LIB_DIR "${SVLS_FULL_PATH}" CACHE TYPE PATH)
	set(SVLS_POSSIBLE_INCLUDE_DIR "${SVLS_FULL_PATH}" CACHE TYPE PATH)
endif()

find_path(SVLS_INCLUDE_DIR svLS.h HINTS ${SVLS_POSSIBLE_INCLUDE_DIR})

GENLIBS(SVLS_LIBRARY "${SVLS_NEEDED_LIBS}" "SVLS" "${SVLS_LIB_DIR}")
set(SVLS_LIBRARY ${SVLS_svLS_LIBRARY})

include_directories(${SVLS_INCLUDE_DIR})
link_directories(${SVLS_LIB_DIR})
add_definitions(${SVLS_DEFINITIONS})

