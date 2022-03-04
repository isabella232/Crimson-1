#!/bin/sh
set -e

gftools builder sources/config.yaml
desktop=$(ls fonts/ttf/*.ttf)
for font in $desktop
do
  pyftsubset $font --unicodes-file=sources/glyphset.txt --glyph-names --drop-tables=  --layout-features+='aalt','lnum','case','dlig','zero','subs','sinf','sups','dnom' --layout-features-='smcp','c2sc','calt' --recommended-glyphs --notdef-outline --symbol-cmap --legacy-cmap --name-IDs='*' --name-legacy --name-languages='*'
  rm $font

done

#necessitate rename module `brew install rename`
rename -d .subset fonts/ttf/*.ttf 

echo "Complete"

