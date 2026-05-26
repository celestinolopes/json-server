#!/bin/sh
set -eu

db_file="${DB_PATH:-db.json}"

# A mounted Render disk starts empty; seed it from the repository once.
if [ "$db_file" != "db.json" ] && [ ! -f "$db_file" ]; then
  cp db.json "$db_file"
fi

exec json-server "$db_file" --host 0.0.0.0 --port "${PORT:-3000}"
