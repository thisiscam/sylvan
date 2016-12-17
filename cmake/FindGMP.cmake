# Try to find the GMP librairies
# GMP_FOUND - system has GMP lib
# GMP_INCLUDE_DIR - the GMP include directory
# GMP_LIBRARIES - Libraries needed to use GMP

if (GMP_INCLUDE_DIR AND GMP_LIBRARIES)
    # Already in cache, be silent
    set(GMP_FIND_QUIETLY TRUE)
endif (GMP_INCLUDE_DIR AND GMP_LIBRARIES)

if(${CYGWIN})
	set(CMAKE_FIND_LIBRARY_SUFFIXES .lib)
endif()

find_path(GMP_INCLUDE_DIR NAMES gmp.h HINTS $ENV{GMP_ROOT} )
find_library(GMP_LIBRARIES NAMES gmp libgmp gmp.lib HINTS $ENV{GMP_ROOT} )
find_library(GMPXX_LIBRARIES NAMES gmpxx libgmpxx gmpxx.lib HINTS $ENV{GMP_ROOT} )
MESSAGE(STATUS "xx" ${GMP_INCLUDE_DIR})
MESSAGE(STATUS "GMP libs: " ${GMP_LIBRARIES} " " ${GMPXX_LIBRARIES} )

include(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(GMP DEFAULT_MSG GMP_INCLUDE_DIR GMP_LIBRARIES)

mark_as_advanced(GMP_INCLUDE_DIR GMP_LIBRARIES)
