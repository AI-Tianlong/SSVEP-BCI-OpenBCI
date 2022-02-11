
####### Expanded from @PACKAGE_INIT@ by configure_package_config_file() #######
####### Any changes to this file will be overwritten by the next CMake run ####
####### The input file was Config.cmake.in                            ########

get_filename_component(PACKAGE_PREFIX_DIR "${CMAKE_CURRENT_LIST_DIR}/../../../" ABSOLUTE)

macro(set_and_check _var _file)
  set(${_var} "${_file}")
  if(NOT EXISTS "${_file}")
    message(FATAL_ERROR "File or directory ${_file} referenced by variable ${_var} does not exist !")
  endif()
endmacro()

macro(check_required_components _NAME)
  foreach(comp ${${_NAME}_FIND_COMPONENTS})
    if(NOT ${_NAME}_${comp}_FOUND)
      if(${_NAME}_FIND_REQUIRED_${comp})
        set(${_NAME}_FOUND FALSE)
      endif()
    endif()
  endforeach()
endmacro()

####################################################################################

include("${CMAKE_CURRENT_LIST_DIR}/brainflowTargets.cmake")
check_required_components("brainflow")

# in theory with lines above you can write smth like:
# target_link_libraries (target brainflow::GetData brainflow::BoardController)
# directly in dependend package CMakeLists.txt after find_package
# but it doesn't link libraries so it leads to linking error and I have no idea why
# workaround - set variables for include and library path and use these variables in package consumer code

set (brainflow_INCLUDE_DIRS D:/a/brainflow/brainflow/installed32/inc)
set (brainflow_LIBRARY_DIRS D:/a/brainflow/brainflow/installed32/lib)

if (CMAKE_SIZEOF_VOID_P EQUAL 8)
    MESSAGE ("64 bits compiler detected")
    SET (PLATFORM_ACH "X64")
    SET (BOARD_CONTROLLER_NAME "BoardController" "libBoardController")
    SET (DATA_HANDLER_NAME "DataHandler" "libDataHandler")
    SET (ML_MODULE_NAME "MLModule" "libMLModule")
    SET (BRAINFLOW_NAME "Brainflow" "libBrainflow")
else (CMAKE_SIZEOF_VOID_P EQUAL 8)
    MESSAGE ("32 bits compiler detected")
    SET (PLATFORM_ACH "X86")
    if (MSVC)
        SET (BOARD_CONTROLLER_NAME "BoardController32" "libBoardController32")
        SET (DATA_HANDLER_NAME "DataHandler32" "libDataHandler32")
        SET (ML_MODULE_NAME "MLModule32" "libMLModule32")
        SET (BRAINFLOW_NAME "Brainflow32" "libBrainflow32")
    else (MSVC)
        SET (BOARD_CONTROLLER_NAME "BoardController" "libBoardController")
        SET (DATA_HANDLER_NAME "DataHandler" "libDataHandler")
        SET (ML_MODULE_NAME "MLModule" "libMLModule")
        SET (BRAINFLOW_NAME "Brainflow" "libBrainflow")
    endif (MSVC)
endif (CMAKE_SIZEOF_VOID_P EQUAL 8)

find_library (
    BoardControllerPath
    ${BOARD_CONTROLLER_NAME}
    PATHS D:/a/brainflow/brainflow/installed32/lib
)

find_library (
    DataHandlerPath
    ${DATA_HANDLER_NAME}
    PATHS D:/a/brainflow/brainflow/installed32/lib
)

find_library (
    BrainflowPath
    ${BRAINFLOW_NAME}
    PATHS D:/a/brainflow/brainflow/installed32/lib
)

find_library (
    MLModulePath
    ${ML_MODULE_NAME}
    PATHS D:/a/brainflow/brainflow/installed32/lib
)
