INTERFACE /inw/if_apack_manifest
  PUBLIC .

  TYPES:
    BEGIN OF ty_dependency,
      group_id       TYPE string,
      artifact_id    TYPE string,
      version        TYPE string,
      git_url        TYPE string,
      target_package TYPE devclass,
    END OF ty_dependency .
  TYPES:
    ty_dependencies    TYPE STANDARD TABLE OF ty_dependency
                            WITH NON-UNIQUE DEFAULT KEY .
  TYPES ty_repository_type TYPE string .
  TYPES:
    BEGIN OF ty_descriptor,
      group_id        TYPE string,
      artifact_id     TYPE string,
      version         TYPE string,
      repository_type TYPE ty_repository_type,
      git_url         TYPE string,
      dependencies    TYPE ty_dependencies,
    END OF ty_descriptor .

  CONSTANTS co_file_name TYPE string VALUE '.apack-manifest.xml' ##NO_TEXT.
  CONSTANTS co_abap_git TYPE ty_repository_type VALUE 'abapGit' ##NO_TEXT.
  CONSTANTS co_interface_version TYPE i VALUE 1 ##NO_TEXT.
  DATA descriptor TYPE ty_descriptor READ-ONLY .
ENDINTERFACE.
