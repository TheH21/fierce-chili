#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5e7d4257a34eaa0014bcd8e4/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5e7d4257a34eaa0014bcd8e4
curl -s -X POST https://api.stackbit.com/project/5e7d4257a34eaa0014bcd8e4/webhook/build/ssgbuild > /dev/null
hugo
curl -s -X POST https://api.stackbit.com/project/5e7d4257a34eaa0014bcd8e4/webhook/build/publish > /dev/null
