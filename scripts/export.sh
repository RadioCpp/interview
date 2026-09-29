#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."
mkdir -p exports
for task in fullstack ml-mlops qa-sdet; do
  git archive --format=zip --output="exports/$task.zip" "HEAD:$task"
done
git rev-parse HEAD > exports/COMMIT.txt
printf '%s\n' 'Created exports/fullstack.zip, exports/ml-mlops.zip, exports/qa-sdet.zip'
