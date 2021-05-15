#!/bin/bash

set -x
find _posts -type d -name '*_files' | xargs rm -r --
find _posts -type f -name '*.html' | xargs rm --