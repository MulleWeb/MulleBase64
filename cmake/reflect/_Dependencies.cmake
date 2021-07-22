#
# This file will be included by cmake/share/Files.cmake
#
# cmake/reflect/_Dependencies.cmake is generated by `mulle-sde reflect`.
# Edits will be lost.
#
# Disable generation of this file with:
#
# mulle-sde environment set MULLE_SOURCETREE_TO_CMAKE_DEPENDENCIES_FILE DISABLE
#
if( MULLE_TRACE_INCLUDE)
   message( STATUS "# Include \"${CMAKE_CURRENT_LIST_FILE}\"" )
endif()

#
# Generated from sourcetree: 16f9b811-efc1-47bc-9a6e-9a9489e0a2a5;MulleObjCValueFoundation;no-singlephase;
# Disable with : `mulle-sourcetree mark MulleObjCValueFoundation no-link`
# Disable for this platform: `mulle-sourcetree mark MulleObjCValueFoundation no-cmake-platform-darwin`
#
if( NOT MULLE_OBJC_VALUE_FOUNDATION_LIBRARY)
   find_library( MULLE_OBJC_VALUE_FOUNDATION_LIBRARY NAMES ${CMAKE_STATIC_LIBRARY_PREFIX}MulleObjCValueFoundation${CMAKE_STATIC_LIBRARY_SUFFIX} MulleObjCValueFoundation NO_CMAKE_SYSTEM_PATH NO_SYSTEM_ENVIRONMENT_PATH)
   message( STATUS "MULLE_OBJC_VALUE_FOUNDATION_LIBRARY is ${MULLE_OBJC_VALUE_FOUNDATION_LIBRARY}")
   #
   # The order looks ascending, but due to the way this file is read
   # it ends up being descending, which is what we need.
   #
   if( MULLE_OBJC_VALUE_FOUNDATION_LIBRARY)
      #
      # Add MULLE_OBJC_VALUE_FOUNDATION_LIBRARY to ALL_LOAD_DEPENDENCY_LIBRARIES list.
      # Disable with: `mulle-sourcetree mark MulleObjCValueFoundation no-cmake-add`
      #
      set( ALL_LOAD_DEPENDENCY_LIBRARIES
         ${ALL_LOAD_DEPENDENCY_LIBRARIES}
         ${MULLE_OBJC_VALUE_FOUNDATION_LIBRARY}
         CACHE INTERNAL "need to cache this"
      )
      #
      # Inherit information from dependency.
      # Encompasses: no-cmake-searchpath,no-cmake-dependency,no-cmake-loader
      # Disable with: `mulle-sourcetree mark MulleObjCValueFoundation no-cmake-inherit`
      #
      # temporarily expand CMAKE_MODULE_PATH
      get_filename_component( _TMP_MULLE_OBJC_VALUE_FOUNDATION_ROOT "${MULLE_OBJC_VALUE_FOUNDATION_LIBRARY}" DIRECTORY)
      get_filename_component( _TMP_MULLE_OBJC_VALUE_FOUNDATION_ROOT "${_TMP_MULLE_OBJC_VALUE_FOUNDATION_ROOT}" DIRECTORY)
      #
      #
      # Append header directory to user search path.
      # Disable with: `mulle-sourcetree mark MulleObjCValueFoundation no-cmake-searchpath`
      #
      foreach( _TMP_MULLE_OBJC_VALUE_FOUNDATION_NAME "MulleObjCValueFoundation")
         set( _TMP_MULLE_OBJC_VALUE_FOUNDATION_DIR "${_TMP_MULLE_OBJC_VALUE_FOUNDATION_ROOT}/include/${_TMP_MULLE_OBJC_VALUE_FOUNDATION_NAME}")
         if( IS_DIRECTORY "${_TMP_MULLE_OBJC_VALUE_FOUNDATION_DIR}")
            set( INHERITED_INCLUDE_DIRS
               ${INHERITED_INCLUDE_DIRS}
               "${_TMP_MULLE_OBJC_VALUE_FOUNDATION_DIR}"
               CACHE INTERNAL "need to cache this"
            )
            break()
         else()
            message( STATUS "${_TMP_MULLE_OBJC_VALUE_FOUNDATION_DIR} not found")
         endif()
      endforeach()
      #
      # Search for "DependenciesAndLibraries.cmake" to include.
      # Disable with: `mulle-sourcetree mark MulleObjCValueFoundation no-cmake-dependency`
      #
      foreach( _TMP_MULLE_OBJC_VALUE_FOUNDATION_NAME "MulleObjCValueFoundation")
         set( _TMP_MULLE_OBJC_VALUE_FOUNDATION_DIR "${_TMP_MULLE_OBJC_VALUE_FOUNDATION_ROOT}/include/${_TMP_MULLE_OBJC_VALUE_FOUNDATION_NAME}/cmake")
         # use explicit path to avoid "surprises"
         if( EXISTS "${_TMP_MULLE_OBJC_VALUE_FOUNDATION_DIR}/DependenciesAndLibraries.cmake")
            unset( MULLE_OBJC_VALUE_FOUNDATION_DEFINITIONS)
            list( INSERT CMAKE_MODULE_PATH 0 "${_TMP_MULLE_OBJC_VALUE_FOUNDATION_DIR}")
            #
            include( "${_TMP_MULLE_OBJC_VALUE_FOUNDATION_DIR}/DependenciesAndLibraries.cmake")
            #
            #
            list( REMOVE_ITEM CMAKE_MODULE_PATH "${_TMP_MULLE_OBJC_VALUE_FOUNDATION_DIR}")
            set( INHERITED_DEFINITIONS
               ${INHERITED_DEFINITIONS}
               ${MULLE_OBJC_VALUE_FOUNDATION_DEFINITIONS}
               CACHE INTERNAL "need to cache this"
            )
            break()
         else()
            message( STATUS "${_TMP_MULLE_OBJC_VALUE_FOUNDATION_DIR}/DependenciesAndLibraries.cmake not found")
         endif()
      endforeach()
      #
      # Search for "MulleObjCLoader+<name>.h" in include directory.
      # Disable with: `mulle-sourcetree mark MulleObjCValueFoundation no-cmake-loader`
      #
      if( NOT NO_INHERIT_OBJC_LOADERS)
         foreach( _TMP_MULLE_OBJC_VALUE_FOUNDATION_NAME "MulleObjCValueFoundation")
            set( _TMP_MULLE_OBJC_VALUE_FOUNDATION_FILE "${_TMP_MULLE_OBJC_VALUE_FOUNDATION_ROOT}/include/${_TMP_MULLE_OBJC_VALUE_FOUNDATION_NAME}/MulleObjCLoader+${_TMP_MULLE_OBJC_VALUE_FOUNDATION_NAME}.h")
            if( EXISTS "${_TMP_MULLE_OBJC_VALUE_FOUNDATION_FILE}")
               set( INHERITED_OBJC_LOADERS
                  ${INHERITED_OBJC_LOADERS}
                  ${_TMP_MULLE_OBJC_VALUE_FOUNDATION_FILE}
                  CACHE INTERNAL "need to cache this"
               )
               break()
            endif()
         endforeach()
      endif()
   else()
      # Disable with: `mulle-sourcetree mark MulleObjCValueFoundation no-require-link`
      message( FATAL_ERROR "MULLE_OBJC_VALUE_FOUNDATION_LIBRARY was not found")
   endif()
endif()
