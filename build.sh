#!/bin/sh
set -e

gftools builder sources/config.yaml
desktop=$(ls fonts/ttf/*.ttf)
for font in $desktop
do
  pyftsubset $font --unicodes-file=sources/glyphset.txt --layout-features='*' --notdef-outline  --name-languages='*' --name-IDs='*' --drop-tables=
  rm $font

done

#necessitate rename module `brew install rename`
rename -d .subset fonts/ttf/*.ttf 

echo "Complete"

