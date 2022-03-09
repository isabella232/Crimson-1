#!/bin/sh
set -e

echo "build font"
gftools builder sources/config.yaml

echo "subset font"
desktop=$(ls fonts/ttf/*.ttf)
for font in $desktop
do
  pyftsubset $font --unicodes-file=sources/glyphset.txt --glyph-names --drop-tables=  --layout-features+='lnum','case','dlig','zero','subs','sinf','sups' --layout-features-='smcp','c2sc' --recommended-glyphs --notdef-outline --symbol-cmap --legacy-cmap --name-IDs='*' --name-legacy --name-languages='*'
  rm $font

done

#necessitate rename module `brew install rename`
rename -d .subset fonts/ttf/*.ttf 

echo "autohint fonts"
#necessitate ttfautohint module `brew install ttfautohint``

for font in $desktop
do
  ttfautohint $font $font.fix
   mv $font.fix $font
   gftools fix-hinting $font
   mv $font.fix $font
done


echo "Complete"

