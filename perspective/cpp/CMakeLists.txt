cmake_minimum_required(VERSION 3.7.2)
project(psp)
include(CheckCCompilerFlag)

set(CMAKE_BUILD_TYPE "Release")
set(CMAKE_CXX_STANDARD 14)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

include(FindPkgConfig)

set(PSP_CPP_SRC "${CMAKE_SOURCE_DIR}")

set(SOURCE_FILES
    ${PSP_CPP_SRC}/src/cpp/vendor/arrow_compute_registry.cpp
    ${PSP_CPP_SRC}/src/cpp/aggregate.cpp
    ${PSP_CPP_SRC}/src/cpp/aggspec.cpp
    ${PSP_CPP_SRC}/src/cpp/arg_sort.cpp
    ${PSP_CPP_SRC}/src/cpp/arrow_loader.cpp
    ${PSP_CPP_SRC}/src/cpp/arrow_writer.cpp
    ${PSP_CPP_SRC}/src/cpp/base.cpp
    ${PSP_CPP_SRC}/src/cpp/base_impl_linux.cpp
    ${PSP_CPP_SRC}/src/cpp/base_impl_osx.cpp
    ${PSP_CPP_SRC}/src/cpp/base_impl_wasm.cpp
    ${PSP_CPP_SRC}/src/cpp/base_impl_win.cpp
    ${PSP_CPP_SRC}/src/cpp/binding.cpp

    # ${PSP_CPP_SRC}/src/cpp/build_filter.cpp
    # ${PSP_CPP_SRC}/src/cpp/calc_agg_dtype.cpp
    ${PSP_CPP_SRC}/src/cpp/column.cpp
    ${PSP_CPP_SRC}/src/cpp/comparators.cpp
    ${PSP_CPP_SRC}/src/cpp/compat.cpp
    ${PSP_CPP_SRC}/src/cpp/compat_impl_linux.cpp
    ${PSP_CPP_SRC}/src/cpp/compat_impl_osx.cpp
    ${PSP_CPP_SRC}/src/cpp/compat_impl_win.cpp
    ${PSP_CPP_SRC}/src/cpp/computed_expression.cpp
    ${PSP_CPP_SRC}/src/cpp/computed_function.cpp
    ${PSP_CPP_SRC}/src/cpp/config.cpp
    ${PSP_CPP_SRC}/src/cpp/context_base.cpp
    ${PSP_CPP_SRC}/src/cpp/context_grouped_pkey.cpp
    ${PSP_CPP_SRC}/src/cpp/context_handle.cpp
    ${PSP_CPP_SRC}/src/cpp/context_one.cpp
    ${PSP_CPP_SRC}/src/cpp/context_two.cpp
    ${PSP_CPP_SRC}/src/cpp/context_zero.cpp
    ${PSP_CPP_SRC}/src/cpp/context_unit.cpp
    ${PSP_CPP_SRC}/src/cpp/data.cpp
    ${PSP_CPP_SRC}/src/cpp/data_slice.cpp
    ${PSP_CPP_SRC}/src/cpp/data_table.cpp
    ${PSP_CPP_SRC}/src/cpp/date.cpp
    ${PSP_CPP_SRC}/src/cpp/dense_nodes.cpp
    ${PSP_CPP_SRC}/src/cpp/dense_tree_context.cpp
    ${PSP_CPP_SRC}/src/cpp/dense_tree.cpp
    ${PSP_CPP_SRC}/src/cpp/dependency.cpp
    ${PSP_CPP_SRC}/src/cpp/expression_tables.cpp
    ${PSP_CPP_SRC}/src/cpp/expression_vocab.cpp
    ${PSP_CPP_SRC}/src/cpp/extract_aggregate.cpp
    ${PSP_CPP_SRC}/src/cpp/filter.cpp
    ${PSP_CPP_SRC}/src/cpp/flat_traversal.cpp
    ${PSP_CPP_SRC}/src/cpp/get_data_extents.cpp
    ${PSP_CPP_SRC}/src/cpp/gnode.cpp
    ${PSP_CPP_SRC}/src/cpp/gnode_state.cpp
    ${PSP_CPP_SRC}/src/cpp/mask.cpp
    ${PSP_CPP_SRC}/src/cpp/multi_sort.cpp
    ${PSP_CPP_SRC}/src/cpp/none.cpp
    ${PSP_CPP_SRC}/src/cpp/path.cpp
    ${PSP_CPP_SRC}/src/cpp/pivot.cpp
    ${PSP_CPP_SRC}/src/cpp/pool.cpp
    ${PSP_CPP_SRC}/src/cpp/port.cpp
    ${PSP_CPP_SRC}/src/cpp/process_state.cpp
    ${PSP_CPP_SRC}/src/cpp/pyutils.cpp
    ${PSP_CPP_SRC}/src/cpp/raii.cpp
    ${PSP_CPP_SRC}/src/cpp/raii_impl_linux.cpp
    ${PSP_CPP_SRC}/src/cpp/raii_impl_osx.cpp
    ${PSP_CPP_SRC}/src/cpp/raii_impl_win.cpp
    ${PSP_CPP_SRC}/src/cpp/range.cpp
    ${PSP_CPP_SRC}/src/cpp/regex.cpp
    ${PSP_CPP_SRC}/src/cpp/rlookup.cpp
    ${PSP_CPP_SRC}/src/cpp/scalar.cpp
    ${PSP_CPP_SRC}/src/cpp/schema_column.cpp
    ${PSP_CPP_SRC}/src/cpp/schema.cpp
    ${PSP_CPP_SRC}/src/cpp/slice.cpp
    ${PSP_CPP_SRC}/src/cpp/sort_specification.cpp
    ${PSP_CPP_SRC}/src/cpp/sparse_tree.cpp
    ${PSP_CPP_SRC}/src/cpp/sparse_tree_node.cpp
    ${PSP_CPP_SRC}/src/cpp/step_delta.cpp
    ${PSP_CPP_SRC}/src/cpp/storage.cpp
    ${PSP_CPP_SRC}/src/cpp/storage_impl_linux.cpp
    ${PSP_CPP_SRC}/src/cpp/storage_impl_osx.cpp
    ${PSP_CPP_SRC}/src/cpp/storage_impl_win.cpp
    ${PSP_CPP_SRC}/src/cpp/sym_table.cpp
    ${PSP_CPP_SRC}/src/cpp/table.cpp
    ${PSP_CPP_SRC}/src/cpp/time.cpp
    ${PSP_CPP_SRC}/src/cpp/traversal.cpp
    ${PSP_CPP_SRC}/src/cpp/traversal_nodes.cpp
    ${PSP_CPP_SRC}/src/cpp/tree_context_common.cpp
    ${PSP_CPP_SRC}/src/cpp/utils.cpp
    ${PSP_CPP_SRC}/src/cpp/update_task.cpp
    ${PSP_CPP_SRC}/src/cpp/view.cpp
    ${PSP_CPP_SRC}/src/cpp/view_config.cpp
    ${PSP_CPP_SRC}/src/cpp/vocab.cpp
    ${PSP_CPP_SRC}/src/cpp/arrow_csv.cpp
)

pkg_search_module(DATE REQUIRED date)
pkg_search_module(ARROW REQUIRED arrow)

add_library(psp SHARED ${SOURCE_FILES})

target_include_directories(
    psp
    PRIVATE
      ${DATE_INCLUDE_DIRS}
      ${ARROW_INCLUDE_DIRS}
      "$ENV{ARROW_SRC}/src"
      "$ENV{EXPRTK}/include"
      "$ENV{ORDERED_MAP}/include"
    PUBLIC
      "${PSP_CPP_SRC}/src/include")

target_link_directories(
    psp PRIVATE
    "$ENV{ORDERED_MAP}/lib")

install(
    TARGETS psp)
