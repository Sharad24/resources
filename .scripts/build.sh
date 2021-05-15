#!/bin/bash

rm -rf docs/
set -x
mkdir docs
for file in $(find _posts -type f -name '*.Rmd')
	do
	(\
		diff -q {,tmp/}"${file}" && \
			rsync -rv {tmp/,}$(dirname "${file}")/ \
	) || \
		Rscript -e "rmarkdown::render('${file}',NULL,NULL)"
done
rm -rf tmp/_posts
cp -r _posts tmp

Rscript -e 'rmarkdown::render_site(encoding = "UTF-8")'
