#!/usr/bin/bash

project_root=$(realpath "$(dirname "$0")")

# select testable role_paths
role_paths=$(find "$project_root/roles" -maxdepth 2 -name "molecule" -not -path "*/.tox*")

rc=0

for role_path in $role_paths; do
  role_path=$(realpath "$role_path/..")
  echo "Role at $role_path"
  cd "$role_path" || exit 2
  echo "Start test at $PWD"
  molecule test || rc=1
done

exit $rc
