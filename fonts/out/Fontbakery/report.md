## Fontbakery report

Fontbakery version: 0.8.6

<details>
<summary><b>[1] Family checks</b></summary>
<details>
<summary>ℹ <b>INFO:</b> Check axis ordering on the STAT table. </summary>

* [com.google.fonts/check/STAT/axis_order](https://font-bakery.readthedocs.io/en/latest/fontbakery/profiles/googlefonts.html#com.google.fonts/check/STAT/axis_order)
<pre>--- Rationale ---
This is (for now) a merely informative check to detect what&#x27;s the axis ordering
declared on the STAT table of fonts in the Google Fonts collection.
We may later update this to enforce some unified axis ordering scheme, yet to be
determined.</pre>

* ℹ **INFO** From a total of 6 font files, 6 of them (100.00%) lack a STAT table.

	And these are the most common STAT axis orderings:
	 [code: summary]

</details>
<br>
</details>
<details>
<summary><b>[21] CrimsonText-Bold.ttf</b></summary>
<details>
<summary>🔥 <b>FAIL:</b> Check `Google Fonts Latin Core` glyph coverage.</summary>

* [com.google.fonts/check/glyph_coverage](https://font-bakery.readthedocs.io/en/latest/fontbakery/profiles/googlefonts.html#com.google.fonts/check/glyph_coverage)
<pre>--- Rationale ---
Google Fonts expects that fonts in its collection support at least the minimal
set of characters defined in the `GF-latin-core` glyph-set.</pre>

* 🔥 **FAIL** Missing required codepoints:

	- 0x00AD (SOFT HYPHEN)

	- 0x2122 (TRADE MARK SIGN)
 
	- And 0xFFFD (REPLACEMENT CHARACTER)
 [code: missing-codepoints]

</details>
<details>
<summary>🔥 <b>FAIL:</b> Checking OS/2 usWeightClass.</summary>

* [com.google.fonts/check/usweightclass](https://font-bakery.readthedocs.io/en/latest/fontbakery/profiles/googlefonts.html#com.google.fonts/check/usweightclass)
<pre>--- Rationale ---
Google Fonts expects variable fonts, static ttfs and static otfs to have
differing OS/2 usWeightClass values.
For Variable Fonts, Thin-Black must be 100-900
For static ttfs, Thin-Black can be 100-900 or 250-900
For static otfs, Thin-Black must be 250-900
If static otfs are set lower than 250, text may appear blurry in legacy Windows
applications.
Glyphsapp users can change the usWeightClass value of an instance by adding a
&#x27;weightClass&#x27; customParameter.</pre>

* 🔥 **FAIL** OS/2 usWeightClass is '400' when it should be '700'. [code: bad-value]

</details>
<details>
<summary>🔥 <b>FAIL:</b> Is the Grid-fitting and Scan-conversion Procedure ('gasp') table set to optimize rendering?</summary>

* [com.google.fonts/check/gasp](https://font-bakery.readthedocs.io/en/latest/fontbakery/profiles/googlefonts.html#com.google.fonts/check/gasp)
<pre>--- Rationale ---
Traditionally version 0 &#x27;gasp&#x27; tables were set so that font sizes below 8 ppem
had no grid fitting but did have antialiasing. From 9-16 ppem, just grid
fitting. And fonts above 17ppem had both antialiasing and grid fitting toggled
on. The use of accelerated graphics cards and higher resolution screens make
this approach obsolete. Microsoft&#x27;s DirectWrite pushed this even further with
much improved rendering built into the OS and apps.
In this scenario it makes sense to simply toggle all 4 flags ON for all font
sizes.</pre>

* 🔥 **FAIL** Font is missing the 'gasp' table. Try exporting the font with autohinting enabled.
If you are dealing with an unhinted font, it can be fixed by running the fonts through the command 'gftools fix-nonhinting'
GFTools is available at https://pypi.org/project/gftools/ [code: lacks-gasp]

</details>
<details>
<summary>🔥 <b>FAIL:</b> Ensure component transforms do not perform scaling or rotation.</summary>

* [com.google.fonts/check/transformed_components](https://font-bakery.readthedocs.io/en/latest/fontbakery/profiles/googlefonts.html#com.google.fonts/check/transformed_components)
<pre>--- Rationale ---
Some families have glyphs which have been constructed by using transformed
components e.g the &#x27;u&#x27; being constructed from a flipped &#x27;n&#x27;.
From a designers point of view, this sounds like a win (less work). However,
such approaches can lead to rasterization issues, such as having the &#x27;u&#x27; not
sitting on the baseline at certain sizes after running the font through
ttfautohint.
As of July 2019, Marc Foley observed that ttfautohint assigns cvt values to
transformed glyphs as if they are not transformed and the result is they render
very badly, and that vttLib does not support flipped components.
When building the font with fontmake, this problem can be fixed by using the
&quot;Decompose Transformed Components&quot; filter.</pre>

* 🔥 **FAIL** The following glyphs had components with scaling or rotation:

* exclamdown (component exclam)
* questiondown (component question)
* quotedblleft (component quotesinglbase)
* quotedblleft (component quotesinglbase)
* quoteleft (component quotesinglbase)
* guillemotright (component guilsinglleft)
* guillemotright (component guilsinglleft)
* guilsinglright (component guilsinglleft)
 [code: transformed-components]

</details>
<details>
<summary>🔥 <b>FAIL:</b> Check glyphs do not have components which are themselves components.</summary>

* [com.google.fonts/check/glyf_nested_components](https://font-bakery.readthedocs.io/en/latest/fontbakery/profiles/googlefonts.html#com.google.fonts/check/glyf_nested_components)
<pre>--- Rationale ---
There have been bugs rendering variable fonts with nested components.
Additionally, some static fonts with nested components have been reported to
have rendering and printing issues.
For more info, see:
* https://github.com/googlefonts/fontbakery/issues/2961
* https://github.com/arrowtype/recursive/issues/412</pre>

* 🔥 **FAIL** The following glyphs have components which themselves are component glyphs:
	* uni1E74
	* ij
	* ij
	* uni1E2D
	* uni1E2D
	* uni1E75
	* Iotadieresis
	* onehalf
	* onequarter
	* threequarters and uni037E [code: found-nested-components]

</details>
<details>
<summary>🔥 <b>FAIL:</b> Font enables smart dropout control in "prep" table instructions?</summary>

* [com.google.fonts/check/smart_dropout](https://font-bakery.readthedocs.io/en/latest/fontbakery/profiles/googlefonts.html#com.google.fonts/check/smart_dropout)
<pre>--- Rationale ---
This setup is meant to ensure consistent rendering quality for fonts across all
devices (with different rendering/hinting capabilities).
Below is the snippet of instructions we expect to see in the fonts:
B8 01 FF    PUSHW 0x01FF
85          SCANCTRL (unconditinally turn on
                      dropout control mode)
B0 04       PUSHB 0x04
8D          SCANTYPE (enable smart dropout control)
&quot;Smart dropout control&quot; means activating rules 1, 2 and 5:
Rule 1: If a pixel&#x27;s center falls within the glyph outline,
        that pixel is turned on.
Rule 2: If a contour falls exactly on a pixel&#x27;s center,
        that pixel is turned on.
Rule 5: If a scan line between two adjacent pixel centers
        (either vertical or horizontal) is intersected
        by both an on-Transition contour and an off-Transition
        contour and neither of the pixels was already turned on
        by rules 1 and 2, turn on the pixel which is closer to
        the midpoint between the on-Transition contour and
        off-Transition contour. This is &quot;Smart&quot; dropout control.
For more detailed info (such as other rules not enabled in this snippet), please
refer to the TrueType Instruction Set documentation.</pre>

* 🔥 **FAIL** The 'prep' table does not contain TrueType instructions enabling smart dropout control. To fix, export the font with autohinting enabled, or run ttfautohint on the font, or run the `gftools fix-nonhinting` script. [code: lacks-smart-dropout]

</details>
<details>
<summary>⚠ <b>WARN:</b> Checking OS/2 achVendID.</summary>

* [com.google.fonts/check/vendor_id](https://font-bakery.readthedocs.io/en/latest/fontbakery/profiles/googlefonts.html#com.google.fonts/check/vendor_id)
<pre>--- Rationale ---
Microsoft keeps a list of font vendors and their respective contact info. This
list is updated regularly and is indexed by a 4-char &quot;Vendor ID&quot; which is stored
in the achVendID field of the OS/2 table.
Registering your ID is not mandatory, but it is a good practice since some
applications may display the type designer / type foundry contact info on some
dialog and also because that info will be visible on Microsoft&#x27;s website:
https://docs.microsoft.com/en-us/typography/vendors/
This check verifies whether or not a given font&#x27;s vendor ID is registered in
that list or if it has some of the default values used by the most common font
editors.
Each new FontBakery release includes a cached copy of that list of vendor IDs.
If you registered recently, you&#x27;re safe to ignore warnings emitted by this
check, since your ID will soon be included in one of our upcoming releases.</pre>

* ⚠ **WARN** OS/2 VendorID is 'PfEd', a font editor default. If you registered it recently, then it's safe to ignore this warning message. Otherwise, you should set it to your own unique 4 character code, and register it with Microsoft at https://www.microsoft.com/typography/links/vendorlist.aspx
 [code: bad]

</details>
<details>
<summary>⚠ <b>WARN:</b> Is there kerning info for non-ligated sequences?</summary>

* [com.google.fonts/check/kerning_for_non_ligated_sequences](https://font-bakery.readthedocs.io/en/latest/fontbakery/profiles/googlefonts.html#com.google.fonts/check/kerning_for_non_ligated_sequences)
<pre>--- Rationale ---
Fonts with ligatures should have kerning on the corresponding non-ligated
sequences for text where ligatures aren&#x27;t used (eg
https://github.com/impallari/Raleway/issues/14).</pre>

* ⚠ **WARN** GPOS table lacks kerning info for the following non-ligated sequences:
	- f + f
	- f + i
	- i + f
	- f + l
	- l + f
	- i + l

   [code: lacks-kern-info]

</details>
<details>
<summary>⚠ <b>WARN:</b> Ensure fonts have ScriptLangTags declared on the 'meta' table.</summary>

* [com.google.fonts/check/meta/script_lang_tags](https://font-bakery.readthedocs.io/en/latest/fontbakery/profiles/googlefonts.html#com.google.fonts/check/meta/script_lang_tags)
<pre>--- Rationale ---
The OpenType &#x27;meta&#x27; table originated at Apple. Microsoft added it to OT with
just two DataMap records:
- dlng: comma-separated ScriptLangTags that indicate which scripts, or languages
and scripts, with possible variants, the font is designed for
- slng: comma-separated ScriptLangTags that indicate which scripts, or languages
and scripts, with possible variants, the font supports
The slng structure is intended to describe which languages and scripts the font
overall supports. For example, a Traditional Chinese font that also contains
Latin characters, can indicate Hant,Latn, showing that it supports Hant, the
Traditional Chinese variant of the Hani script, and it also supports the Latn
script
The dlng structure is far more interesting. A font may contain various glyphs,
but only a particular subset of the glyphs may be truly &quot;leading&quot; in the design,
while other glyphs may have been included for technical reasons. Such a
Traditional Chinese font could only list Hant there, showing that it’s designed
for Traditional Chinese, but the font would omit Latn, because the developers
don’t think the font is really recommended for purely Latin-script use.
The tags used in the structures can comprise just script, or also language and
script. For example, if a font has Bulgarian Cyrillic alternates in the locl
feature for the cyrl BGR OT languagesystem, it could also indicate in dlng
explicitly that it supports bul-Cyrl. (Note that the scripts and languages in
meta use the ISO language and script codes, not the OpenType ones).
This check ensures that the font has the meta table containing the slng and dlng
structures.
All families in the Google Fonts collection should contain the &#x27;meta&#x27; table.
Windows 10 already uses it when deciding on which fonts to fall back to. The
Google Fonts API and also other environments could use the data for smarter
filtering. Most importantly, those entries should be added to the Noto fonts.
In the font making process, some environments store this data in external files
already. But the meta table provides a convenient way to store this inside the
font file, so some tools may add the data, and unrelated tools may read this
data. This makes the solution much more portable and universal.</pre>

* ⚠ **WARN** This font file does not have a 'meta' table. [code: lacks-meta-table]

</details>
<details>
<summary>⚠ <b>WARN:</b> Check font contains no unreachable glyphs</summary>

* [com.google.fonts/check/unreachable_glyphs](https://font-bakery.readthedocs.io/en/latest/fontbakery/profiles/universal.html#com.google.fonts/check/unreachable_glyphs)
<pre>--- Rationale ---
Glyphs are either accessible directly through Unicode codepoints or through
substitution rules. Any glyphs not accessible by either of these means are
redundant and serve only to increase the font&#x27;s file size.</pre>

* ⚠ **WARN** The following glyphs could not be reached by codepoint or substitution rules:
	- zero.lf
	- eight.lf
	- .null
	- nine.lf
	- three.lf
	- two.lf
	- five.lf
	- six.lf
	- four.lf
	- one.lf 
	- And seven.lf
 [code: unreachable-glyphs]

</details>
<details>
<summary>⚠ <b>WARN:</b> Check if each glyph has the recommended amount of contours.</summary>

* [com.google.fonts/check/contour_count](https://font-bakery.readthedocs.io/en/latest/fontbakery/profiles/universal.html#com.google.fonts/check/contour_count)
<pre>--- Rationale ---
Visually QAing thousands of glyphs by hand is tiring. Most glyphs can only be
constructured in a handful of ways. This means a glyph&#x27;s contour count will only
differ slightly amongst different fonts, e.g a &#x27;g&#x27; could either be 2 or 3
contours, depending on whether its double story or single story.
However, a quotedbl should have 2 contours, unless the font belongs to a display
family.
This check currently does not cover variable fonts because there&#x27;s plenty of
alternative ways of constructing glyphs with multiple outlines for each feature
in a VarFont. The expected contour count data for this check is currently
optimized for the typical construction of glyphs in static fonts.</pre>

* ⚠ **WARN** This check inspects the glyph outlines and detects the total number of contours in each of them. The expected values are infered from the typical ammounts of contours observed in a large collection of reference font families. The divergences listed below may simply indicate a significantly different design on some of your glyphs. On the other hand, some of these may flag actual bugs in the font such as glyphs mapped to an incorrect codepoint. Please consider reviewing the design and codepoint assignment of these to make sure they are correct.

The following glyphs do not have the recommended number of contours:

	- Glyph name: longs	Contours detected: 0	Expected: 1
	- Glyph name: uni02BB	Contours detected: 0	Expected: 1
	- Glyph name: uni02BC	Contours detected: 0	Expected: 1
	- Glyph name: circumflex	Contours detected: 0	Expected: 1
	- Glyph name: breve	Contours detected: 0	Expected: 1
	- Glyph name: dotaccent	Contours detected: 0	Expected: 1
	- Glyph name: hungarumlaut	Contours detected: 0	Expected: 2
	- Glyph name: uni0374	Contours detected: 0	Expected: 1
	- Glyph name: uni0375	Contours detected: 0	Expected: 1
	- Glyph name: uni037A	Contours detected: 0	Expected: 1 
	- And 829 more.

Use -F or --full-lists to disable shortening of long lists.
 [code: contour-count]

</details>
<details>
<summary>⚠ <b>WARN:</b> Do any segments have colinear vectors?</summary>

* [com.google.fonts/check/outline_colinear_vectors](https://font-bakery.readthedocs.io/en/latest/fontbakery/profiles/<Section: Outline Correctness Checks>.html#com.google.fonts/check/outline_colinear_vectors)
<pre>--- Rationale ---
This check looks for consecutive line segments which have the same angle. This
normally happens if an outline point has been added by accident.
This check is not run for variable fonts, as they may legitimately have colinear
vectors.</pre>

* ⚠ **WARN** The following glyphs have colinear vectors:
	* A (U+0041): L<<118.0,122.0>--<123.0,134.0>> -> L<<123.0,134.0>--<344.0,642.0>>
	* AE (U+00C6): L<<106.0,69.0>--<147.0,132.0>> -> L<<147.0,132.0>--<429.0,584.0>>
	* AEacute (U+01FC): L<<106.0,69.0>--<147.0,132.0>> -> L<<147.0,132.0>--<429.0,584.0>>
	* Aacute (U+00C1): L<<118.0,122.0>--<123.0,134.0>> -> L<<123.0,134.0>--<344.0,642.0>>
	* Abreve (U+0102): L<<118.0,122.0>--<123.0,134.0>> -> L<<123.0,134.0>--<344.0,642.0>>
	* Acircumflex (U+00C2): L<<118.0,122.0>--<123.0,134.0>> -> L<<123.0,134.0>--<344.0,642.0>>
	* Adieresis (U+00C4): L<<118.0,122.0>--<123.0,134.0>> -> L<<123.0,134.0>--<344.0,642.0>>
	* Agrave (U+00C0): L<<118.0,122.0>--<123.0,134.0>> -> L<<123.0,134.0>--<344.0,642.0>>
	* Amacron (U+0100): L<<118.0,122.0>--<123.0,134.0>> -> L<<123.0,134.0>--<344.0,642.0>>
	* Aogonek (U+0104): L<<118.0,122.0>--<123.0,134.0>> -> L<<123.0,134.0>--<344.0,642.0>> and 53 more.

Use -F or --full-lists to disable shortening of long lists. [code: found-colinear-vectors]

</details>
<details>
<summary>⚠ <b>WARN:</b> Do outlines contain any jaggy segments?</summary>

* [com.google.fonts/check/outline_jaggy_segments](https://font-bakery.readthedocs.io/en/latest/fontbakery/profiles/<Section: Outline Correctness Checks>.html#com.google.fonts/check/outline_jaggy_segments)
<pre>--- Rationale ---
This check heuristically detects outline segments which form a particularly
small angle, indicative of an outline error. This may cause false positives in
cases such as extreme ink traps, so should be regarded as advisory and backed up
by manual inspection.</pre>

* ⚠ **WARN** The following glyphs have jaggy segments:
	* r (U+0072): B<<241.5,402.0>-<240.0,384.0>-<239.0,382.0>>/B<<239.0,382.0>-<289.0,447.0>-<352.0,447.0>> = 11.003540851749474
	* racute (U+0155): B<<241.5,402.0>-<240.0,384.0>-<239.0,382.0>>/B<<239.0,382.0>-<289.0,447.0>-<352.0,447.0>> = 11.003540851749474
	* rcaron (U+0159): B<<241.5,402.0>-<240.0,384.0>-<239.0,382.0>>/B<<239.0,382.0>-<289.0,447.0>-<352.0,447.0>> = 11.003540851749474
	* rmacronbelow (U+1E5F): B<<241.5,402.0>-<240.0,384.0>-<239.0,382.0>>/B<<239.0,382.0>-<289.0,447.0>-<352.0,447.0>> = 11.003540851749474
	* uni0157 (U+0157): B<<241.5,402.0>-<240.0,384.0>-<239.0,382.0>>/B<<239.0,382.0>-<289.0,447.0>-<352.0,447.0>> = 11.003540851749474
	* uni1E59 (U+1E59): B<<241.5,402.0>-<240.0,384.0>-<239.0,382.0>>/B<<239.0,382.0>-<289.0,447.0>-<352.0,447.0>> = 11.003540851749474
	* uni1E5B (U+1E5B): B<<241.5,402.0>-<240.0,384.0>-<239.0,382.0>>/B<<239.0,382.0>-<289.0,447.0>-<352.0,447.0>> = 11.003540851749474 and uni1E5D (U+1E5D): B<<241.5,402.0>-<240.0,384.0>-<239.0,382.0>>/B<<239.0,382.0>-<289.0,447.0>-<352.0,447.0>> = 11.003540851749474 [code: found-jaggy-segments]

</details>
<details>
<summary>⚠ <b>WARN:</b> Do outlines contain any semi-vertical or semi-horizontal lines?</summary>

* [com.google.fonts/check/outline_semi_vertical](https://font-bakery.readthedocs.io/en/latest/fontbakery/profiles/<Section: Outline Correctness Checks>.html#com.google.fonts/check/outline_semi_vertical)
<pre>--- Rationale ---
This check detects line segments which are nearly, but not quite, exactly
horizontal or vertical. Sometimes such lines are created by design, but often
they are indicative of a design error.
This check is disabled for italic styles, which often contain nearly-upright
lines.</pre>

* ⚠ **WARN** The following glyphs have semi-vertical/semi-horizontal lines:
 * Hbar (U+0126): L<<243.0,535.0>--<362.0,534.0>>
 * Hbar (U+0126): L<<362.0,534.0>--<483.0,535.0>>
 * Hbar (U+0126): L<<363.0,490.0>--<242.0,489.0>>
 * Hbar (U+0126): L<<483.0,489.0>--<363.0,490.0>>
 * four.osf (U+F734): L<<124.0,76.0>--<279.0,75.0>>
 * four.osf (U+F734): L<<279.0,5.0>--<39.0,6.0>>
 * germandbls (U+00DF): L<<97.0,135.0>--<98.0,361.0>>
 * l (U+006C): L<<233.0,577.0>--<232.0,149.0>>
 * lacute (U+013A): L<<233.0,577.0>--<232.0,149.0>>
 * lcaron (U+013E): L<<233.0,577.0>--<232.0,149.0>> and 12 more.

Use -F or --full-lists to disable shortening of long lists. [code: found-semi-vertical]

</details>
<details>
<summary>ℹ <b>INFO:</b> Show hinting filesize impact.</summary>

* [com.google.fonts/check/hinting_impact](https://font-bakery.readthedocs.io/en/latest/fontbakery/profiles/googlefonts.html#com.google.fonts/check/hinting_impact)
<pre>--- Rationale ---
This check is merely informative, displaying and useful comparison of filesizes
of hinted versus unhinted font files.</pre>

* ℹ **INFO** Hinting filesize impact:

 |               | CrimsonText-Bold.ttf          |
 |:------------- | ---------------:|
 | Dehinted Size | 95.6kb |
 | Hinted Size   | 95.6kb   |
 | Increase      | -24 bytes      |
 | Change        | -0.0 %  |
 [code: size-impact]

</details>
<details>
<summary>ℹ <b>INFO:</b> Font has old ttfautohint applied?</summary>

* [com.google.fonts/check/old_ttfautohint](https://font-bakery.readthedocs.io/en/latest/fontbakery/profiles/googlefonts.html#com.google.fonts/check/old_ttfautohint)
<pre>--- Rationale ---
Check if font has been hinted with an outdated version of ttfautohint.</pre>

* ℹ **INFO** Could not detect which version of ttfautohint was used in this font. It is typically specified as a comment in the font version entries of the 'name' table. Such font version strings are currently: ['Version 1.000'] [code: version-not-detected]

</details>
<details>
<summary>ℹ <b>INFO:</b> EPAR table present in font?</summary>

* [com.google.fonts/check/epar](https://font-bakery.readthedocs.io/en/latest/fontbakery/profiles/googlefonts.html#com.google.fonts/check/epar)
<pre>--- Rationale ---
The EPAR table is/was a way of expressing common licensing permissions and
restrictions in metadata; while almost nothing supported it, Dave Crossland
wonders that adding it to everything in Google Fonts could help make it more
popular.
More info is available at:
https://davelab6.github.io/epar/</pre>

* ℹ **INFO** EPAR table not present in font. To learn more see https://github.com/googlefonts/fontbakery/issues/818 [code: lacks-EPAR]

</details>
<details>
<summary>ℹ <b>INFO:</b> Familyname must be unique according to namecheck.fontdata.com</summary>

* [com.google.fonts/check/fontdata_namecheck](https://font-bakery.readthedocs.io/en/latest/fontbakery/profiles/googlefonts.html#com.google.fonts/check/fontdata_namecheck)
<pre>--- Rationale ---
We need to check names are not already used, and today the best place to check
that is http://namecheck.fontdata.com</pre>

* ℹ **INFO** The family name "CrimsonText" seems to be already in use.
Please visit http://namecheck.fontdata.com for more info. [code: name-collision]

</details>
<details>
<summary>ℹ <b>INFO:</b> Check for font-v versioning.</summary>

* [com.google.fonts/check/fontv](https://font-bakery.readthedocs.io/en/latest/fontbakery/profiles/googlefonts.html#com.google.fonts/check/fontv)
<pre>--- Rationale ---
The git sha1 tagging and dev/release features of Source Foundry `font-v` tool
are awesome and we would love to consider upstreaming the approach into fontmake
someday. For now we only emit a WARN if a given font does not yet follow the
experimental versioning style, but at some point we may start enforcing it.</pre>

* ℹ **INFO** Version string is: "Version 1.000"
The version string must ideally include a git commit hash and either a "dev" or a "release" suffix such as in the example below:
"Version 1.3; git-0d08353-release" [code: bad-format]

</details>
<details>
<summary>ℹ <b>INFO:</b> Font contains all required tables?</summary>

* [com.google.fonts/check/required_tables](https://font-bakery.readthedocs.io/en/latest/fontbakery/profiles/universal.html#com.google.fonts/check/required_tables)
<pre>--- Rationale ---
Depending on the typeface and coverage of a font, certain tables are recommended
for optimum quality. For example, the performance of a non-linear font is
improved if the VDMX, LTSH, and hdmx tables are present. Non-monospaced Latin
fonts should have a kern table. A gasp table is necessary if a designer wants to
influence the sizes at which grayscaling is used under Windows. Etc.</pre>

* ℹ **INFO** This font contains the following optional tables:
	- loca
	- GPOS 
	- And GSUB [code: optional-tables]

</details>
<details>
<summary>ℹ <b>INFO:</b> List all superfamily filepaths</summary>

* [com.google.fonts/check/superfamily/list](https://font-bakery.readthedocs.io/en/latest/fontbakery/profiles/universal.html#com.google.fonts/check/superfamily/list)
<pre>--- Rationale ---
This is a merely informative check that lists all sibling families detected by
fontbakery.
Only the fontfiles in these directories will be considered in superfamily-level
checks.</pre>

* ℹ **INFO** . [code: family-path]

</details>
<br>
</details>
<details>
<summary><b>[25] CrimsonText-BoldItalic.ttf</b></summary>
<details>
<summary>🔥 <b>FAIL:</b> Check `Google Fonts Latin Core` glyph coverage.</summary>

* [com.google.fonts/check/glyph_coverage](https://font-bakery.readthedocs.io/en/latest/fontbakery/profiles/googlefonts.html#com.google.fonts/check/glyph_coverage)
<pre>--- Rationale ---
Google Fonts expects that fonts in its collection support at least the minimal
set of characters defined in the `GF-latin-core` glyph-set.</pre>

* 🔥 **FAIL** Missing required codepoints:

	- 0x00AA (FEMININE ORDINAL INDICATOR)

	- 0x00AD (SOFT HYPHEN)

	- 0x00B2 (SUPERSCRIPT TWO)

	- 0x00B3 (SUPERSCRIPT THREE)

	- 0x00B9 (SUPERSCRIPT ONE)

	- 0x00BA (MASCULINE ORDINAL INDICATOR)

	- 0x2002 (EN SPACE)

	- 0x2009 (THIN SPACE)

	- 0x200B (ZERO WIDTH SPACE)

	- 0x2074 (SUPERSCRIPT FOUR)
 
	- And 4 more.

Use -F or --full-lists to disable shortening of long lists. [code: missing-codepoints]

</details>
<details>
<summary>🔥 <b>FAIL:</b> Checking OS/2 usWeightClass.</summary>

* [com.google.fonts/check/usweightclass](https://font-bakery.readthedocs.io/en/latest/fontbakery/profiles/googlefonts.html#com.google.fonts/check/usweightclass)
<pre>--- Rationale ---
Google Fonts expects variable fonts, static ttfs and static otfs to have
differing OS/2 usWeightClass values.
For Variable Fonts, Thin-Black must be 100-900
For static ttfs, Thin-Black can be 100-900 or 250-900
For static otfs, Thin-Black must be 250-900
If static otfs are set lower than 250, text may appear blurry in legacy Windows
applications.
Glyphsapp users can change the usWeightClass value of an instance by adding a
&#x27;weightClass&#x27; customParameter.</pre>

* 🔥 **FAIL** OS/2 usWeightClass is '400' when it should be '700'. [code: bad-value]

</details>
<details>
<summary>🔥 <b>FAIL:</b> Is the Grid-fitting and Scan-conversion Procedure ('gasp') table set to optimize rendering?</summary>

* [com.google.fonts/check/gasp](https://font-bakery.readthedocs.io/en/latest/fontbakery/profiles/googlefonts.html#com.google.fonts/check/gasp)
<pre>--- Rationale ---
Traditionally version 0 &#x27;gasp&#x27; tables were set so that font sizes below 8 ppem
had no grid fitting but did have antialiasing. From 9-16 ppem, just grid
fitting. And fonts above 17ppem had both antialiasing and grid fitting toggled
on. The use of accelerated graphics cards and higher resolution screens make
this approach obsolete. Microsoft&#x27;s DirectWrite pushed this even further with
much improved rendering built into the OS and apps.
In this scenario it makes sense to simply toggle all 4 flags ON for all font
sizes.</pre>

* 🔥 **FAIL** Font is missing the 'gasp' table. Try exporting the font with autohinting enabled.
If you are dealing with an unhinted font, it can be fixed by running the fonts through the command 'gftools fix-nonhinting'
GFTools is available at https://pypi.org/project/gftools/ [code: lacks-gasp]

</details>
<details>
<summary>🔥 <b>FAIL:</b> Checking OS/2 fsSelection value.</summary>

* [com.google.fonts/check/fsselection](https://font-bakery.readthedocs.io/en/latest/fontbakery/profiles/googlefonts.html#com.google.fonts/check/fsselection)

* 🔥 **FAIL** OS/2 fsSelection BOLD bit should be set. [code: bad-BOLD]

</details>
<details>
<summary>🔥 <b>FAIL:</b> Checking head.macStyle value.</summary>

* [com.google.fonts/check/mac_style](https://font-bakery.readthedocs.io/en/latest/fontbakery/profiles/googlefonts.html#com.google.fonts/check/mac_style)
<pre>--- Rationale ---
The values of the flags on the macStyle entry on the &#x27;head&#x27; OpenType table that
describe whether a font is bold and/or italic must be coherent with the actual
style of the font as inferred by its filename.</pre>

* 🔥 **FAIL** head macStyle BOLD bit should be set. [code: bad-BOLD]

</details>
<details>
<summary>🔥 <b>FAIL:</b> Ensure component transforms do not perform scaling or rotation.</summary>

* [com.google.fonts/check/transformed_components](https://font-bakery.readthedocs.io/en/latest/fontbakery/profiles/googlefonts.html#com.google.fonts/check/transformed_components)
<pre>--- Rationale ---
Some families have glyphs which have been constructed by using transformed
components e.g the &#x27;u&#x27; being constructed from a flipped &#x27;n&#x27;.
From a designers point of view, this sounds like a win (less work). However,
such approaches can lead to rasterization issues, such as having the &#x27;u&#x27; not
sitting on the baseline at certain sizes after running the font through
ttfautohint.
As of July 2019, Marc Foley observed that ttfautohint assigns cvt values to
transformed glyphs as if they are not transformed and the result is they render
very badly, and that vttLib does not support flipped components.
When building the font with fontmake, this problem can be fixed by using the
&quot;Decompose Transformed Components&quot; filter.</pre>

* 🔥 **FAIL** The following glyphs had components with scaling or rotation:

* questiondown (component question)
 [code: transformed-components]

</details>
<details>
<summary>🔥 <b>FAIL:</b> Check name table: FONT_FAMILY_NAME entries.</summary>

* [com.google.fonts/check/name/familyname](https://font-bakery.readthedocs.io/en/latest/fontbakery/profiles/googlefonts.html#com.google.fonts/check/name/familyname)
<pre>--- Rationale ---
Checks that the family name infered from the font filename matches the string at
nameID 1 (NAMEID_FONT_FAMILY_NAME) if it conforms to RIBBI and otherwise checks
that nameID 1 is the family name + the style name.</pre>

* 🔥 **FAIL** Entry [FONT_FAMILY_NAME(1):WINDOWS(3)] on the "name" table: Expected "Crimson Text" but got "Crimson Text Bold". [code: mismatch]

</details>
<details>
<summary>🔥 <b>FAIL:</b> Check name table: FONT_SUBFAMILY_NAME entries.</summary>

* [com.google.fonts/check/name/subfamilyname](https://font-bakery.readthedocs.io/en/latest/fontbakery/profiles/googlefonts.html#com.google.fonts/check/name/subfamilyname)

* 🔥 **FAIL** SUBFAMILY_NAME for Win "Italic" must be "Bold Italic" [code: bad-familyname]

</details>
<details>
<summary>🔥 <b>FAIL:</b> Check name table: TYPOGRAPHIC_FAMILY_NAME entries.</summary>

* [com.google.fonts/check/name/typographicfamilyname](https://font-bakery.readthedocs.io/en/latest/fontbakery/profiles/googlefonts.html#com.google.fonts/check/name/typographicfamilyname)
<pre>--- Rationale ---
Requirements for the TYPOGRAPHIC_FAMILY_NAME entries in the &#x27;name&#x27; table.</pre>

* 🔥 **FAIL** Font style is "BoldItalic" and, for that reason, it is not expected to have a [TYPOGRAPHIC_FAMILY_NAME(16):WINDOWS(3)] entry! [code: ribbi]

</details>
<details>
<summary>🔥 <b>FAIL:</b> Check glyphs do not have components which are themselves components.</summary>

* [com.google.fonts/check/glyf_nested_components](https://font-bakery.readthedocs.io/en/latest/fontbakery/profiles/googlefonts.html#com.google.fonts/check/glyf_nested_components)
<pre>--- Rationale ---
There have been bugs rendering variable fonts with nested components.
Additionally, some static fonts with nested components have been reported to
have rendering and printing issues.
For more info, see:
* https://github.com/googlefonts/fontbakery/issues/2961
* https://github.com/arrowtype/recursive/issues/412</pre>

* 🔥 **FAIL** The following glyphs have components which themselves are component glyphs:
	* Ldot
	* ldot and uni2011 [code: found-nested-components]

</details>
<details>
<summary>🔥 <b>FAIL:</b> Font enables smart dropout control in "prep" table instructions?</summary>

* [com.google.fonts/check/smart_dropout](https://font-bakery.readthedocs.io/en/latest/fontbakery/profiles/googlefonts.html#com.google.fonts/check/smart_dropout)
<pre>--- Rationale ---
This setup is meant to ensure consistent rendering quality for fonts across all
devices (with different rendering/hinting capabilities).
Below is the snippet of instructions we expect to see in the fonts:
B8 01 FF    PUSHW 0x01FF
85          SCANCTRL (unconditinally turn on
                      dropout control mode)
B0 04       PUSHB 0x04
8D          SCANTYPE (enable smart dropout control)
&quot;Smart dropout control&quot; means activating rules 1, 2 and 5:
Rule 1: If a pixel&#x27;s center falls within the glyph outline,
        that pixel is turned on.
Rule 2: If a contour falls exactly on a pixel&#x27;s center,
        that pixel is turned on.
Rule 5: If a scan line between two adjacent pixel centers
        (either vertical or horizontal) is intersected
        by both an on-Transition contour and an off-Transition
        contour and neither of the pixels was already turned on
        by rules 1 and 2, turn on the pixel which is closer to
        the midpoint between the on-Transition contour and
        off-Transition contour. This is &quot;Smart&quot; dropout control.
For more detailed info (such as other rules not enabled in this snippet), please
refer to the TrueType Instruction Set documentation.</pre>

* 🔥 **FAIL** The 'prep' table does not contain TrueType instructions enabling smart dropout control. To fix, export the font with autohinting enabled, or run ttfautohint on the font, or run the `gftools fix-nonhinting` script. [code: lacks-smart-dropout]

</details>
<details>
<summary>⚠ <b>WARN:</b> Checking OS/2 achVendID.</summary>

* [com.google.fonts/check/vendor_id](https://font-bakery.readthedocs.io/en/latest/fontbakery/profiles/googlefonts.html#com.google.fonts/check/vendor_id)
<pre>--- Rationale ---
Microsoft keeps a list of font vendors and their respective contact info. This
list is updated regularly and is indexed by a 4-char &quot;Vendor ID&quot; which is stored
in the achVendID field of the OS/2 table.
Registering your ID is not mandatory, but it is a good practice since some
applications may display the type designer / type foundry contact info on some
dialog and also because that info will be visible on Microsoft&#x27;s website:
https://docs.microsoft.com/en-us/typography/vendors/
This check verifies whether or not a given font&#x27;s vendor ID is registered in
that list or if it has some of the default values used by the most common font
editors.
Each new FontBakery release includes a cached copy of that list of vendor IDs.
If you registered recently, you&#x27;re safe to ignore warnings emitted by this
check, since your ID will soon be included in one of our upcoming releases.</pre>

* ⚠ **WARN** OS/2 VendorID is 'PfEd', a font editor default. If you registered it recently, then it's safe to ignore this warning message. Otherwise, you should set it to your own unique 4 character code, and register it with Microsoft at https://www.microsoft.com/typography/links/vendorlist.aspx
 [code: bad]

</details>
<details>
<summary>⚠ <b>WARN:</b> Ensure fonts have ScriptLangTags declared on the 'meta' table.</summary>

* [com.google.fonts/check/meta/script_lang_tags](https://font-bakery.readthedocs.io/en/latest/fontbakery/profiles/googlefonts.html#com.google.fonts/check/meta/script_lang_tags)
<pre>--- Rationale ---
The OpenType &#x27;meta&#x27; table originated at Apple. Microsoft added it to OT with
just two DataMap records:
- dlng: comma-separated ScriptLangTags that indicate which scripts, or languages
and scripts, with possible variants, the font is designed for
- slng: comma-separated ScriptLangTags that indicate which scripts, or languages
and scripts, with possible variants, the font supports
The slng structure is intended to describe which languages and scripts the font
overall supports. For example, a Traditional Chinese font that also contains
Latin characters, can indicate Hant,Latn, showing that it supports Hant, the
Traditional Chinese variant of the Hani script, and it also supports the Latn
script
The dlng structure is far more interesting. A font may contain various glyphs,
but only a particular subset of the glyphs may be truly &quot;leading&quot; in the design,
while other glyphs may have been included for technical reasons. Such a
Traditional Chinese font could only list Hant there, showing that it’s designed
for Traditional Chinese, but the font would omit Latn, because the developers
don’t think the font is really recommended for purely Latin-script use.
The tags used in the structures can comprise just script, or also language and
script. For example, if a font has Bulgarian Cyrillic alternates in the locl
feature for the cyrl BGR OT languagesystem, it could also indicate in dlng
explicitly that it supports bul-Cyrl. (Note that the scripts and languages in
meta use the ISO language and script codes, not the OpenType ones).
This check ensures that the font has the meta table containing the slng and dlng
structures.
All families in the Google Fonts collection should contain the &#x27;meta&#x27; table.
Windows 10 already uses it when deciding on which fonts to fall back to. The
Google Fonts API and also other environments could use the data for smarter
filtering. Most importantly, those entries should be added to the Noto fonts.
In the font making process, some environments store this data in external files
already. But the meta table provides a convenient way to store this inside the
font file, so some tools may add the data, and unrelated tools may read this
data. This makes the solution much more portable and universal.</pre>

* ⚠ **WARN** This font file does not have a 'meta' table. [code: lacks-meta-table]

</details>
<details>
<summary>⚠ <b>WARN:</b> Check font contains no unreachable glyphs</summary>

* [com.google.fonts/check/unreachable_glyphs](https://font-bakery.readthedocs.io/en/latest/fontbakery/profiles/universal.html#com.google.fonts/check/unreachable_glyphs)
<pre>--- Rationale ---
Glyphs are either accessible directly through Unicode codepoints or through
substitution rules. Any glyphs not accessible by either of these means are
redundant and serve only to increase the font&#x27;s file size.</pre>

* ⚠ **WARN** The following glyphs could not be reached by codepoint or substitution rules:
	- .null
 [code: unreachable-glyphs]

</details>
<details>
<summary>⚠ <b>WARN:</b> Check if each glyph has the recommended amount of contours.</summary>

* [com.google.fonts/check/contour_count](https://font-bakery.readthedocs.io/en/latest/fontbakery/profiles/universal.html#com.google.fonts/check/contour_count)
<pre>--- Rationale ---
Visually QAing thousands of glyphs by hand is tiring. Most glyphs can only be
constructured in a handful of ways. This means a glyph&#x27;s contour count will only
differ slightly amongst different fonts, e.g a &#x27;g&#x27; could either be 2 or 3
contours, depending on whether its double story or single story.
However, a quotedbl should have 2 contours, unless the font belongs to a display
family.
This check currently does not cover variable fonts because there&#x27;s plenty of
alternative ways of constructing glyphs with multiple outlines for each feature
in a VarFont. The expected contour count data for this check is currently
optimized for the typical construction of glyphs in static fonts.</pre>

* ⚠ **WARN** This check inspects the glyph outlines and detects the total number of contours in each of them. The expected values are infered from the typical ammounts of contours observed in a large collection of reference font families. The divergences listed below may simply indicate a significantly different design on some of your glyphs. On the other hand, some of these may flag actual bugs in the font such as glyphs mapped to an incorrect codepoint. Please consider reviewing the design and codepoint assignment of these to make sure they are correct.

The following glyphs do not have the recommended number of contours:

	- Glyph name: uni02BB	Contours detected: 0	Expected: 1
	- Glyph name: uni02BC	Contours detected: 0	Expected: 1
	- Glyph name: fi	Contours detected: 1	Expected: 3
	- Glyph name: fl	Contours detected: 1	Expected: 2
	- Glyph name: uni02BB	Contours detected: 0	Expected: 1 
	- And Glyph name: uni02BC	Contours detected: 0	Expected: 1
 [code: contour-count]

</details>
<details>
<summary>⚠ <b>WARN:</b> Does GPOS table have kerning information? This check skips monospaced fonts as defined by post.isFixedPitch value</summary>

* [com.google.fonts/check/gpos_kerning_info](https://font-bakery.readthedocs.io/en/latest/fontbakery/profiles/gpos.html#com.google.fonts/check/gpos_kerning_info)

* ⚠ **WARN** GPOS table lacks kerning information. [code: lacks-kern-info]

</details>
<details>
<summary>⚠ <b>WARN:</b> Do any segments have colinear vectors?</summary>

* [com.google.fonts/check/outline_colinear_vectors](https://font-bakery.readthedocs.io/en/latest/fontbakery/profiles/<Section: Outline Correctness Checks>.html#com.google.fonts/check/outline_colinear_vectors)
<pre>--- Rationale ---
This check looks for consecutive line segments which have the same angle. This
normally happens if an outline point has been added by accident.
This check is not run for variable fonts, as they may legitimately have colinear
vectors.</pre>

* ⚠ **WARN** The following glyphs have colinear vectors:
	* H (U+0048): L<<473.0,662.0>--<605.0,656.0>> -> L<<605.0,656.0>--<726.0,662.0>>
	* Hbar (U+0126): L<<480.0,662.0>--<612.0,656.0>> -> L<<612.0,656.0>--<733.0,662.0>>
	* Hcircumflex (U+0124): L<<473.0,662.0>--<605.0,656.0>> -> L<<605.0,656.0>--<726.0,662.0>>
	* M (U+004D): L<<460.0,231.0>--<627.0,546.0>> -> L<<627.0,546.0>--<681.0,662.0>>
	* M (U+004D): L<<98.0,80.0>--<104.0,101.0>> -> L<<104.0,101.0>--<225.0,566.0>>
	* V (U+0056): L<<181.0,3.0>--<89.0,510.0>> -> L<<89.0,510.0>--<81.0,551.0>>
	* arrowleft (U+2190): L<<141.0,213.0>--<173.0,167.0>> -> L<<173.0,167.0>--<207.0,123.0>>
	* arrowright (U+2192): L<<470.0,138.0>--<506.0,170.0>> -> L<<506.0,170.0>--<553.0,213.0>>
	* arrowright (U+2192): L<<568.0,282.0>--<534.0,329.0>> -> L<<534.0,329.0>--<493.0,382.0>>
	* dagger (U+2020): L<<113.0,437.0>--<210.0,432.0>> -> L<<210.0,432.0>--<214.0,432.0>> and 5 more.

Use -F or --full-lists to disable shortening of long lists. [code: found-colinear-vectors]

</details>
<details>
<summary>⚠ <b>WARN:</b> Do outlines contain any jaggy segments?</summary>

* [com.google.fonts/check/outline_jaggy_segments](https://font-bakery.readthedocs.io/en/latest/fontbakery/profiles/<Section: Outline Correctness Checks>.html#com.google.fonts/check/outline_jaggy_segments)
<pre>--- Rationale ---
This check heuristically detects outline segments which form a particularly
small angle, indicative of an outline error. This may cause false positives in
cases such as extreme ink traps, so should be regarded as advisory and backed up
by manual inspection.</pre>

* ⚠ **WARN** The following glyphs have jaggy segments:
	* Q (U+0051): B<<127.5,-15.0>-<168.0,-10.0>-<215.0,-7.0>>/B<<215.0,-7.0>-<155.0,2.0>-<109.0,38.0>> = 12.18298839025442
	* eng (U+014B): B<<242.5,333.0>-<241.0,320.0>-<237.0,308.0>>/B<<237.0,308.0>-<255.0,343.0>-<279.5,375.5>> = 8.781162734385404
	* k (U+006B): L<<227.0,584.0>--<182.0,346.0>>/B<<182.0,346.0>-<191.0,366.0>-<208.5,390.0>> = 13.520904038314477
	* ogonek (U+02DB): L<<60.0,-9.0>--<149.0,-13.0>>/B<<149.0,-13.0>-<130.0,-13.0>-<106.5,-24.5>> = 2.5733594631768395
	* q (U+0071): L<<194.0,-116.0>--<230.0,66.0>>/B<<230.0,66.0>-<222.0,49.0>-<205.0,31.5>> = 14.01232371722324
	* r (U+0072): L<<224.0,338.0>--<216.0,294.0>>/B<<216.0,294.0>-<245.0,362.0>-<285.5,405.5>> = 12.791975449394828
	* racute (U+0155): L<<224.0,338.0>--<216.0,294.0>>/B<<216.0,294.0>-<245.0,362.0>-<285.5,405.5>> = 12.791975449394828
	* rcaron (U+0159): L<<224.0,338.0>--<216.0,294.0>>/B<<216.0,294.0>-<245.0,362.0>-<285.5,405.5>> = 12.791975449394828
	* uni0137 (U+0137): L<<227.0,584.0>--<182.0,346.0>>/B<<182.0,346.0>-<191.0,366.0>-<208.5,390.0>> = 13.520904038314477
	* uni0157 (U+0157): L<<224.0,338.0>--<216.0,294.0>>/B<<216.0,294.0>-<245.0,362.0>-<285.5,405.5>> = 12.791975449394828 and 3 more.

Use -F or --full-lists to disable shortening of long lists. [code: found-jaggy-segments]

</details>
<details>
<summary>ℹ <b>INFO:</b> Show hinting filesize impact.</summary>

* [com.google.fonts/check/hinting_impact](https://font-bakery.readthedocs.io/en/latest/fontbakery/profiles/googlefonts.html#com.google.fonts/check/hinting_impact)
<pre>--- Rationale ---
This check is merely informative, displaying and useful comparison of filesizes
of hinted versus unhinted font files.</pre>

* ℹ **INFO** Hinting filesize impact:

 |               | CrimsonText-BoldItalic.ttf          |
 |:------------- | ---------------:|
 | Dehinted Size | 58.3kb |
 | Hinted Size   | 58.3kb   |
 | Increase      | -24 bytes      |
 | Change        | -0.0 %  |
 [code: size-impact]

</details>
<details>
<summary>ℹ <b>INFO:</b> Font has old ttfautohint applied?</summary>

* [com.google.fonts/check/old_ttfautohint](https://font-bakery.readthedocs.io/en/latest/fontbakery/profiles/googlefonts.html#com.google.fonts/check/old_ttfautohint)
<pre>--- Rationale ---
Check if font has been hinted with an outdated version of ttfautohint.</pre>

* ℹ **INFO** Could not detect which version of ttfautohint was used in this font. It is typically specified as a comment in the font version entries of the 'name' table. Such font version strings are currently: ['Version 1.000'] [code: version-not-detected]

</details>
<details>
<summary>ℹ <b>INFO:</b> EPAR table present in font?</summary>

* [com.google.fonts/check/epar](https://font-bakery.readthedocs.io/en/latest/fontbakery/profiles/googlefonts.html#com.google.fonts/check/epar)
<pre>--- Rationale ---
The EPAR table is/was a way of expressing common licensing permissions and
restrictions in metadata; while almost nothing supported it, Dave Crossland
wonders that adding it to everything in Google Fonts could help make it more
popular.
More info is available at:
https://davelab6.github.io/epar/</pre>

* ℹ **INFO** EPAR table not present in font. To learn more see https://github.com/googlefonts/fontbakery/issues/818 [code: lacks-EPAR]

</details>
<details>
<summary>ℹ <b>INFO:</b> Familyname must be unique according to namecheck.fontdata.com</summary>

* [com.google.fonts/check/fontdata_namecheck](https://font-bakery.readthedocs.io/en/latest/fontbakery/profiles/googlefonts.html#com.google.fonts/check/fontdata_namecheck)
<pre>--- Rationale ---
We need to check names are not already used, and today the best place to check
that is http://namecheck.fontdata.com</pre>

* ℹ **INFO** The family name "CrimsonText" seems to be already in use.
Please visit http://namecheck.fontdata.com for more info. [code: name-collision]

</details>
<details>
<summary>ℹ <b>INFO:</b> Check for font-v versioning.</summary>

* [com.google.fonts/check/fontv](https://font-bakery.readthedocs.io/en/latest/fontbakery/profiles/googlefonts.html#com.google.fonts/check/fontv)
<pre>--- Rationale ---
The git sha1 tagging and dev/release features of Source Foundry `font-v` tool
are awesome and we would love to consider upstreaming the approach into fontmake
someday. For now we only emit a WARN if a given font does not yet follow the
experimental versioning style, but at some point we may start enforcing it.</pre>

* ℹ **INFO** Version string is: "Version 1.000"
The version string must ideally include a git commit hash and either a "dev" or a "release" suffix such as in the example below:
"Version 1.3; git-0d08353-release" [code: bad-format]

</details>
<details>
<summary>ℹ <b>INFO:</b> Font contains all required tables?</summary>

* [com.google.fonts/check/required_tables](https://font-bakery.readthedocs.io/en/latest/fontbakery/profiles/universal.html#com.google.fonts/check/required_tables)
<pre>--- Rationale ---
Depending on the typeface and coverage of a font, certain tables are recommended
for optimum quality. For example, the performance of a non-linear font is
improved if the VDMX, LTSH, and hdmx tables are present. Non-monospaced Latin
fonts should have a kern table. A gasp table is necessary if a designer wants to
influence the sizes at which grayscaling is used under Windows. Etc.</pre>

* ℹ **INFO** This font contains the following optional tables:
	- loca
	- GPOS 
	- And GSUB [code: optional-tables]

</details>
<details>
<summary>ℹ <b>INFO:</b> List all superfamily filepaths</summary>

* [com.google.fonts/check/superfamily/list](https://font-bakery.readthedocs.io/en/latest/fontbakery/profiles/universal.html#com.google.fonts/check/superfamily/list)
<pre>--- Rationale ---
This is a merely informative check that lists all sibling families detected by
fontbakery.
Only the fontfiles in these directories will be considered in superfamily-level
checks.</pre>

* ℹ **INFO** . [code: family-path]

</details>
<br>
</details>
<details>
<summary><b>[19] CrimsonText-Italic.ttf</b></summary>
<details>
<summary>🔥 <b>FAIL:</b> Check `Google Fonts Latin Core` glyph coverage.</summary>

* [com.google.fonts/check/glyph_coverage](https://font-bakery.readthedocs.io/en/latest/fontbakery/profiles/googlefonts.html#com.google.fonts/check/glyph_coverage)
<pre>--- Rationale ---
Google Fonts expects that fonts in its collection support at least the minimal
set of characters defined in the `GF-latin-core` glyph-set.</pre>

* 🔥 **FAIL** Missing required codepoints:

	- 0x00AA (FEMININE ORDINAL INDICATOR)

	- 0x00AD (SOFT HYPHEN)

	- 0x00B2 (SUPERSCRIPT TWO)

	- 0x00B3 (SUPERSCRIPT THREE)

	- 0x00B9 (SUPERSCRIPT ONE)

	- 0x00BA (MASCULINE ORDINAL INDICATOR)

	- 0x2002 (EN SPACE)

	- 0x2009 (THIN SPACE)

	- 0x200B (ZERO WIDTH SPACE)

	- 0x2074 (SUPERSCRIPT FOUR)
 
	- And 4 more.

Use -F or --full-lists to disable shortening of long lists. [code: missing-codepoints]

</details>
<details>
<summary>🔥 <b>FAIL:</b> Is the Grid-fitting and Scan-conversion Procedure ('gasp') table set to optimize rendering?</summary>

* [com.google.fonts/check/gasp](https://font-bakery.readthedocs.io/en/latest/fontbakery/profiles/googlefonts.html#com.google.fonts/check/gasp)
<pre>--- Rationale ---
Traditionally version 0 &#x27;gasp&#x27; tables were set so that font sizes below 8 ppem
had no grid fitting but did have antialiasing. From 9-16 ppem, just grid
fitting. And fonts above 17ppem had both antialiasing and grid fitting toggled
on. The use of accelerated graphics cards and higher resolution screens make
this approach obsolete. Microsoft&#x27;s DirectWrite pushed this even further with
much improved rendering built into the OS and apps.
In this scenario it makes sense to simply toggle all 4 flags ON for all font
sizes.</pre>

* 🔥 **FAIL** Font is missing the 'gasp' table. Try exporting the font with autohinting enabled.
If you are dealing with an unhinted font, it can be fixed by running the fonts through the command 'gftools fix-nonhinting'
GFTools is available at https://pypi.org/project/gftools/ [code: lacks-gasp]

</details>
<details>
<summary>🔥 <b>FAIL:</b> Ensure component transforms do not perform scaling or rotation.</summary>

* [com.google.fonts/check/transformed_components](https://font-bakery.readthedocs.io/en/latest/fontbakery/profiles/googlefonts.html#com.google.fonts/check/transformed_components)
<pre>--- Rationale ---
Some families have glyphs which have been constructed by using transformed
components e.g the &#x27;u&#x27; being constructed from a flipped &#x27;n&#x27;.
From a designers point of view, this sounds like a win (less work). However,
such approaches can lead to rasterization issues, such as having the &#x27;u&#x27; not
sitting on the baseline at certain sizes after running the font through
ttfautohint.
As of July 2019, Marc Foley observed that ttfautohint assigns cvt values to
transformed glyphs as if they are not transformed and the result is they render
very badly, and that vttLib does not support flipped components.
When building the font with fontmake, this problem can be fixed by using the
&quot;Decompose Transformed Components&quot; filter.</pre>

* 🔥 **FAIL** The following glyphs had components with scaling or rotation:

* questiondown (component question)
 [code: transformed-components]

</details>
<details>
<summary>🔥 <b>FAIL:</b> Check glyphs do not have components which are themselves components.</summary>

* [com.google.fonts/check/glyf_nested_components](https://font-bakery.readthedocs.io/en/latest/fontbakery/profiles/googlefonts.html#com.google.fonts/check/glyf_nested_components)
<pre>--- Rationale ---
There have been bugs rendering variable fonts with nested components.
Additionally, some static fonts with nested components have been reported to
have rendering and printing issues.
For more info, see:
* https://github.com/googlefonts/fontbakery/issues/2961
* https://github.com/arrowtype/recursive/issues/412</pre>

* 🔥 **FAIL** The following glyphs have components which themselves are component glyphs:
	* Ldot
	* ldot and uni2011 [code: found-nested-components]

</details>
<details>
<summary>🔥 <b>FAIL:</b> Font enables smart dropout control in "prep" table instructions?</summary>

* [com.google.fonts/check/smart_dropout](https://font-bakery.readthedocs.io/en/latest/fontbakery/profiles/googlefonts.html#com.google.fonts/check/smart_dropout)
<pre>--- Rationale ---
This setup is meant to ensure consistent rendering quality for fonts across all
devices (with different rendering/hinting capabilities).
Below is the snippet of instructions we expect to see in the fonts:
B8 01 FF    PUSHW 0x01FF
85          SCANCTRL (unconditinally turn on
                      dropout control mode)
B0 04       PUSHB 0x04
8D          SCANTYPE (enable smart dropout control)
&quot;Smart dropout control&quot; means activating rules 1, 2 and 5:
Rule 1: If a pixel&#x27;s center falls within the glyph outline,
        that pixel is turned on.
Rule 2: If a contour falls exactly on a pixel&#x27;s center,
        that pixel is turned on.
Rule 5: If a scan line between two adjacent pixel centers
        (either vertical or horizontal) is intersected
        by both an on-Transition contour and an off-Transition
        contour and neither of the pixels was already turned on
        by rules 1 and 2, turn on the pixel which is closer to
        the midpoint between the on-Transition contour and
        off-Transition contour. This is &quot;Smart&quot; dropout control.
For more detailed info (such as other rules not enabled in this snippet), please
refer to the TrueType Instruction Set documentation.</pre>

* 🔥 **FAIL** The 'prep' table does not contain TrueType instructions enabling smart dropout control. To fix, export the font with autohinting enabled, or run ttfautohint on the font, or run the `gftools fix-nonhinting` script. [code: lacks-smart-dropout]

</details>
<details>
<summary>⚠ <b>WARN:</b> Checking OS/2 achVendID.</summary>

* [com.google.fonts/check/vendor_id](https://font-bakery.readthedocs.io/en/latest/fontbakery/profiles/googlefonts.html#com.google.fonts/check/vendor_id)
<pre>--- Rationale ---
Microsoft keeps a list of font vendors and their respective contact info. This
list is updated regularly and is indexed by a 4-char &quot;Vendor ID&quot; which is stored
in the achVendID field of the OS/2 table.
Registering your ID is not mandatory, but it is a good practice since some
applications may display the type designer / type foundry contact info on some
dialog and also because that info will be visible on Microsoft&#x27;s website:
https://docs.microsoft.com/en-us/typography/vendors/
This check verifies whether or not a given font&#x27;s vendor ID is registered in
that list or if it has some of the default values used by the most common font
editors.
Each new FontBakery release includes a cached copy of that list of vendor IDs.
If you registered recently, you&#x27;re safe to ignore warnings emitted by this
check, since your ID will soon be included in one of our upcoming releases.</pre>

* ⚠ **WARN** OS/2 VendorID is 'PfEd', a font editor default. If you registered it recently, then it's safe to ignore this warning message. Otherwise, you should set it to your own unique 4 character code, and register it with Microsoft at https://www.microsoft.com/typography/links/vendorlist.aspx
 [code: bad]

</details>
<details>
<summary>⚠ <b>WARN:</b> Is there kerning info for non-ligated sequences?</summary>

* [com.google.fonts/check/kerning_for_non_ligated_sequences](https://font-bakery.readthedocs.io/en/latest/fontbakery/profiles/googlefonts.html#com.google.fonts/check/kerning_for_non_ligated_sequences)
<pre>--- Rationale ---
Fonts with ligatures should have kerning on the corresponding non-ligated
sequences for text where ligatures aren&#x27;t used (eg
https://github.com/impallari/Raleway/issues/14).</pre>

* ⚠ **WARN** GPOS table lacks kerning info for the following non-ligated sequences:
	- f + f
	- f + i
	- i + f
	- f + l
	- l + f
	- i + l

   [code: lacks-kern-info]

</details>
<details>
<summary>⚠ <b>WARN:</b> Ensure fonts have ScriptLangTags declared on the 'meta' table.</summary>

* [com.google.fonts/check/meta/script_lang_tags](https://font-bakery.readthedocs.io/en/latest/fontbakery/profiles/googlefonts.html#com.google.fonts/check/meta/script_lang_tags)
<pre>--- Rationale ---
The OpenType &#x27;meta&#x27; table originated at Apple. Microsoft added it to OT with
just two DataMap records:
- dlng: comma-separated ScriptLangTags that indicate which scripts, or languages
and scripts, with possible variants, the font is designed for
- slng: comma-separated ScriptLangTags that indicate which scripts, or languages
and scripts, with possible variants, the font supports
The slng structure is intended to describe which languages and scripts the font
overall supports. For example, a Traditional Chinese font that also contains
Latin characters, can indicate Hant,Latn, showing that it supports Hant, the
Traditional Chinese variant of the Hani script, and it also supports the Latn
script
The dlng structure is far more interesting. A font may contain various glyphs,
but only a particular subset of the glyphs may be truly &quot;leading&quot; in the design,
while other glyphs may have been included for technical reasons. Such a
Traditional Chinese font could only list Hant there, showing that it’s designed
for Traditional Chinese, but the font would omit Latn, because the developers
don’t think the font is really recommended for purely Latin-script use.
The tags used in the structures can comprise just script, or also language and
script. For example, if a font has Bulgarian Cyrillic alternates in the locl
feature for the cyrl BGR OT languagesystem, it could also indicate in dlng
explicitly that it supports bul-Cyrl. (Note that the scripts and languages in
meta use the ISO language and script codes, not the OpenType ones).
This check ensures that the font has the meta table containing the slng and dlng
structures.
All families in the Google Fonts collection should contain the &#x27;meta&#x27; table.
Windows 10 already uses it when deciding on which fonts to fall back to. The
Google Fonts API and also other environments could use the data for smarter
filtering. Most importantly, those entries should be added to the Noto fonts.
In the font making process, some environments store this data in external files
already. But the meta table provides a convenient way to store this inside the
font file, so some tools may add the data, and unrelated tools may read this
data. This makes the solution much more portable and universal.</pre>

* ⚠ **WARN** This font file does not have a 'meta' table. [code: lacks-meta-table]

</details>
<details>
<summary>⚠ <b>WARN:</b> Check font contains no unreachable glyphs</summary>

* [com.google.fonts/check/unreachable_glyphs](https://font-bakery.readthedocs.io/en/latest/fontbakery/profiles/universal.html#com.google.fonts/check/unreachable_glyphs)
<pre>--- Rationale ---
Glyphs are either accessible directly through Unicode codepoints or through
substitution rules. Any glyphs not accessible by either of these means are
redundant and serve only to increase the font&#x27;s file size.</pre>

* ⚠ **WARN** The following glyphs could not be reached by codepoint or substitution rules:
	- .null
 [code: unreachable-glyphs]

</details>
<details>
<summary>⚠ <b>WARN:</b> Check if each glyph has the recommended amount of contours.</summary>

* [com.google.fonts/check/contour_count](https://font-bakery.readthedocs.io/en/latest/fontbakery/profiles/universal.html#com.google.fonts/check/contour_count)
<pre>--- Rationale ---
Visually QAing thousands of glyphs by hand is tiring. Most glyphs can only be
constructured in a handful of ways. This means a glyph&#x27;s contour count will only
differ slightly amongst different fonts, e.g a &#x27;g&#x27; could either be 2 or 3
contours, depending on whether its double story or single story.
However, a quotedbl should have 2 contours, unless the font belongs to a display
family.
This check currently does not cover variable fonts because there&#x27;s plenty of
alternative ways of constructing glyphs with multiple outlines for each feature
in a VarFont. The expected contour count data for this check is currently
optimized for the typical construction of glyphs in static fonts.</pre>

* ⚠ **WARN** This check inspects the glyph outlines and detects the total number of contours in each of them. The expected values are infered from the typical ammounts of contours observed in a large collection of reference font families. The divergences listed below may simply indicate a significantly different design on some of your glyphs. On the other hand, some of these may flag actual bugs in the font such as glyphs mapped to an incorrect codepoint. Please consider reviewing the design and codepoint assignment of these to make sure they are correct.

The following glyphs do not have the recommended number of contours:

	- Glyph name: fi	Contours detected: 1	Expected: 3 
	- And Glyph name: fl	Contours detected: 1	Expected: 2
 [code: contour-count]

</details>
<details>
<summary>⚠ <b>WARN:</b> Do any segments have colinear vectors?</summary>

* [com.google.fonts/check/outline_colinear_vectors](https://font-bakery.readthedocs.io/en/latest/fontbakery/profiles/<Section: Outline Correctness Checks>.html#com.google.fonts/check/outline_colinear_vectors)
<pre>--- Rationale ---
This check looks for consecutive line segments which have the same angle. This
normally happens if an outline point has been added by accident.
This check is not run for variable fonts, as they may legitimately have colinear
vectors.</pre>

* ⚠ **WARN** The following glyphs have colinear vectors:
	* A (U+0041): L<<418.0,660.0>--<501.0,132.0>> -> L<<501.0,132.0>--<513.0,60.0>>
	* AE (U+00C6): L<<616.0,505.0>--<601.0,347.0>> -> L<<601.0,347.0>--<601.0,346.0>>
	* Aacute (U+00C1): L<<418.0,660.0>--<501.0,132.0>> -> L<<501.0,132.0>--<513.0,60.0>>
	* Abreve (U+0102): L<<418.0,660.0>--<501.0,132.0>> -> L<<501.0,132.0>--<513.0,60.0>>
	* Acircumflex (U+00C2): L<<418.0,660.0>--<501.0,132.0>> -> L<<501.0,132.0>--<513.0,60.0>>
	* Adieresis (U+00C4): L<<418.0,660.0>--<501.0,132.0>> -> L<<501.0,132.0>--<513.0,60.0>>
	* Agrave (U+00C0): L<<418.0,660.0>--<501.0,132.0>> -> L<<501.0,132.0>--<513.0,60.0>>
	* Amacron (U+0100): L<<418.0,660.0>--<501.0,132.0>> -> L<<501.0,132.0>--<513.0,60.0>>
	* Aogonek (U+0104): L<<448.0,660.0>--<531.0,132.0>> -> L<<531.0,132.0>--<543.0,60.0>>
	* Aring (U+00C5): L<<418.0,660.0>--<501.0,132.0>> -> L<<501.0,132.0>--<513.0,60.0>> and 22 more.

Use -F or --full-lists to disable shortening of long lists. [code: found-colinear-vectors]

</details>
<details>
<summary>⚠ <b>WARN:</b> Do outlines contain any jaggy segments?</summary>

* [com.google.fonts/check/outline_jaggy_segments](https://font-bakery.readthedocs.io/en/latest/fontbakery/profiles/<Section: Outline Correctness Checks>.html#com.google.fonts/check/outline_jaggy_segments)
<pre>--- Rationale ---
This check heuristically detects outline segments which form a particularly
small angle, indicative of an outline error. This may cause false positives in
cases such as extreme ink traps, so should be regarded as advisory and backed up
by manual inspection.</pre>

* ⚠ **WARN** The following glyphs have jaggy segments:
	* braceleft (U+007B): B<<116.0,328.5>-<93.0,309.0>-<71.0,308.0>>/B<<71.0,308.0>-<94.0,307.0>-<112.0,283.0>> = 5.092115124498886
	* braceright (U+007D): B<<153.5,288.5>-<178.0,308.0>-<200.0,308.0>>/B<<200.0,308.0>-<178.0,309.0>-<162.0,332.0>> = 2.6025622024996635
	* g (U+0067): B<<174.5,106.0>-<198.0,118.0>-<217.0,122.0>>/B<<217.0,122.0>-<197.0,122.0>-<174.0,132.0>> = 11.888658039627968
	* gbreve (U+011F): B<<174.5,106.0>-<198.0,118.0>-<217.0,122.0>>/B<<217.0,122.0>-<197.0,122.0>-<174.0,132.0>> = 11.888658039627968
	* gcircumflex (U+011D): B<<174.5,106.0>-<198.0,118.0>-<217.0,122.0>>/B<<217.0,122.0>-<197.0,122.0>-<174.0,132.0>> = 11.888658039627968
	* gdotaccent (U+0121): B<<174.5,106.0>-<198.0,118.0>-<217.0,122.0>>/B<<217.0,122.0>-<197.0,122.0>-<174.0,132.0>> = 11.888658039627968
	* r (U+0072): L<<235.0,330.0>--<219.0,246.0>>/B<<219.0,246.0>-<232.0,275.0>-<250.5,306.5>> = 13.361244092859023
	* racute (U+0155): L<<235.0,330.0>--<219.0,246.0>>/B<<219.0,246.0>-<232.0,275.0>-<250.5,306.5>> = 13.361244092859023
	* rcaron (U+0159): L<<235.0,330.0>--<219.0,246.0>>/B<<219.0,246.0>-<232.0,275.0>-<250.5,306.5>> = 13.361244092859023
	* uni00B5 (U+00B5): B<<96.5,46.5>-<93.0,63.0>-<93.0,76.0>>/B<<93.0,76.0>-<88.0,46.0>-<82.0,15.0>> = 9.462322208025613 and 13 more.

Use -F or --full-lists to disable shortening of long lists. [code: found-jaggy-segments]

</details>
<details>
<summary>ℹ <b>INFO:</b> Show hinting filesize impact.</summary>

* [com.google.fonts/check/hinting_impact](https://font-bakery.readthedocs.io/en/latest/fontbakery/profiles/googlefonts.html#com.google.fonts/check/hinting_impact)
<pre>--- Rationale ---
This check is merely informative, displaying and useful comparison of filesizes
of hinted versus unhinted font files.</pre>

* ℹ **INFO** Hinting filesize impact:

 |               | CrimsonText-Italic.ttf          |
 |:------------- | ---------------:|
 | Dehinted Size | 58.7kb |
 | Hinted Size   | 58.7kb   |
 | Increase      | -24 bytes      |
 | Change        | -0.0 %  |
 [code: size-impact]

</details>
<details>
<summary>ℹ <b>INFO:</b> Font has old ttfautohint applied?</summary>

* [com.google.fonts/check/old_ttfautohint](https://font-bakery.readthedocs.io/en/latest/fontbakery/profiles/googlefonts.html#com.google.fonts/check/old_ttfautohint)
<pre>--- Rationale ---
Check if font has been hinted with an outdated version of ttfautohint.</pre>

* ℹ **INFO** Could not detect which version of ttfautohint was used in this font. It is typically specified as a comment in the font version entries of the 'name' table. Such font version strings are currently: ['Version 1.000'] [code: version-not-detected]

</details>
<details>
<summary>ℹ <b>INFO:</b> EPAR table present in font?</summary>

* [com.google.fonts/check/epar](https://font-bakery.readthedocs.io/en/latest/fontbakery/profiles/googlefonts.html#com.google.fonts/check/epar)
<pre>--- Rationale ---
The EPAR table is/was a way of expressing common licensing permissions and
restrictions in metadata; while almost nothing supported it, Dave Crossland
wonders that adding it to everything in Google Fonts could help make it more
popular.
More info is available at:
https://davelab6.github.io/epar/</pre>

* ℹ **INFO** EPAR table not present in font. To learn more see https://github.com/googlefonts/fontbakery/issues/818 [code: lacks-EPAR]

</details>
<details>
<summary>ℹ <b>INFO:</b> Familyname must be unique according to namecheck.fontdata.com</summary>

* [com.google.fonts/check/fontdata_namecheck](https://font-bakery.readthedocs.io/en/latest/fontbakery/profiles/googlefonts.html#com.google.fonts/check/fontdata_namecheck)
<pre>--- Rationale ---
We need to check names are not already used, and today the best place to check
that is http://namecheck.fontdata.com</pre>

* ℹ **INFO** The family name "CrimsonText" seems to be already in use.
Please visit http://namecheck.fontdata.com for more info. [code: name-collision]

</details>
<details>
<summary>ℹ <b>INFO:</b> Check for font-v versioning.</summary>

* [com.google.fonts/check/fontv](https://font-bakery.readthedocs.io/en/latest/fontbakery/profiles/googlefonts.html#com.google.fonts/check/fontv)
<pre>--- Rationale ---
The git sha1 tagging and dev/release features of Source Foundry `font-v` tool
are awesome and we would love to consider upstreaming the approach into fontmake
someday. For now we only emit a WARN if a given font does not yet follow the
experimental versioning style, but at some point we may start enforcing it.</pre>

* ℹ **INFO** Version string is: "Version 1.000"
The version string must ideally include a git commit hash and either a "dev" or a "release" suffix such as in the example below:
"Version 1.3; git-0d08353-release" [code: bad-format]

</details>
<details>
<summary>ℹ <b>INFO:</b> Font contains all required tables?</summary>

* [com.google.fonts/check/required_tables](https://font-bakery.readthedocs.io/en/latest/fontbakery/profiles/universal.html#com.google.fonts/check/required_tables)
<pre>--- Rationale ---
Depending on the typeface and coverage of a font, certain tables are recommended
for optimum quality. For example, the performance of a non-linear font is
improved if the VDMX, LTSH, and hdmx tables are present. Non-monospaced Latin
fonts should have a kern table. A gasp table is necessary if a designer wants to
influence the sizes at which grayscaling is used under Windows. Etc.</pre>

* ℹ **INFO** This font contains the following optional tables:
	- loca
	- GPOS 
	- And GSUB [code: optional-tables]

</details>
<details>
<summary>ℹ <b>INFO:</b> List all superfamily filepaths</summary>

* [com.google.fonts/check/superfamily/list](https://font-bakery.readthedocs.io/en/latest/fontbakery/profiles/universal.html#com.google.fonts/check/superfamily/list)
<pre>--- Rationale ---
This is a merely informative check that lists all sibling families detected by
fontbakery.
Only the fontfiles in these directories will be considered in superfamily-level
checks.</pre>

* ℹ **INFO** . [code: family-path]

</details>
<br>
</details>
<details>
<summary><b>[19] CrimsonText-Regular.ttf</b></summary>
<details>
<summary>🔥 <b>FAIL:</b> Check `Google Fonts Latin Core` glyph coverage.</summary>

* [com.google.fonts/check/glyph_coverage](https://font-bakery.readthedocs.io/en/latest/fontbakery/profiles/googlefonts.html#com.google.fonts/check/glyph_coverage)
<pre>--- Rationale ---
Google Fonts expects that fonts in its collection support at least the minimal
set of characters defined in the `GF-latin-core` glyph-set.</pre>

* 🔥 **FAIL** Missing required codepoints:

	- 0x00AD (SOFT HYPHEN)

	- 0x2122 (TRADE MARK SIGN)
 
	- And 0xFFFD (REPLACEMENT CHARACTER)
 [code: missing-codepoints]

</details>
<details>
<summary>🔥 <b>FAIL:</b> Is the Grid-fitting and Scan-conversion Procedure ('gasp') table set to optimize rendering?</summary>

* [com.google.fonts/check/gasp](https://font-bakery.readthedocs.io/en/latest/fontbakery/profiles/googlefonts.html#com.google.fonts/check/gasp)
<pre>--- Rationale ---
Traditionally version 0 &#x27;gasp&#x27; tables were set so that font sizes below 8 ppem
had no grid fitting but did have antialiasing. From 9-16 ppem, just grid
fitting. And fonts above 17ppem had both antialiasing and grid fitting toggled
on. The use of accelerated graphics cards and higher resolution screens make
this approach obsolete. Microsoft&#x27;s DirectWrite pushed this even further with
much improved rendering built into the OS and apps.
In this scenario it makes sense to simply toggle all 4 flags ON for all font
sizes.</pre>

* 🔥 **FAIL** Font is missing the 'gasp' table. Try exporting the font with autohinting enabled.
If you are dealing with an unhinted font, it can be fixed by running the fonts through the command 'gftools fix-nonhinting'
GFTools is available at https://pypi.org/project/gftools/ [code: lacks-gasp]

</details>
<details>
<summary>🔥 <b>FAIL:</b> Ensure component transforms do not perform scaling or rotation.</summary>

* [com.google.fonts/check/transformed_components](https://font-bakery.readthedocs.io/en/latest/fontbakery/profiles/googlefonts.html#com.google.fonts/check/transformed_components)
<pre>--- Rationale ---
Some families have glyphs which have been constructed by using transformed
components e.g the &#x27;u&#x27; being constructed from a flipped &#x27;n&#x27;.
From a designers point of view, this sounds like a win (less work). However,
such approaches can lead to rasterization issues, such as having the &#x27;u&#x27; not
sitting on the baseline at certain sizes after running the font through
ttfautohint.
As of July 2019, Marc Foley observed that ttfautohint assigns cvt values to
transformed glyphs as if they are not transformed and the result is they render
very badly, and that vttLib does not support flipped components.
When building the font with fontmake, this problem can be fixed by using the
&quot;Decompose Transformed Components&quot; filter.</pre>

* 🔥 **FAIL** The following glyphs had components with scaling or rotation:

* uni03FF (component uni03F9)
* uni03FF (component period)
* exclamdown (component exclam)
* questiondown (component question)
* quotedblleft (component quotesinglbase)
* quotedblleft (component quotesinglbase)
* quoteleft (component quotesinglbase)
* guillemotright (component guilsinglleft)
* guillemotright (component guilsinglleft)
* guilsinglright (component guilsinglleft)
 [code: transformed-components]

</details>
<details>
<summary>🔥 <b>FAIL:</b> Check glyphs do not have components which are themselves components.</summary>

* [com.google.fonts/check/glyf_nested_components](https://font-bakery.readthedocs.io/en/latest/fontbakery/profiles/googlefonts.html#com.google.fonts/check/glyf_nested_components)
<pre>--- Rationale ---
There have been bugs rendering variable fonts with nested components.
Additionally, some static fonts with nested components have been reported to
have rendering and printing issues.
For more info, see:
* https://github.com/googlefonts/fontbakery/issues/2961
* https://github.com/arrowtype/recursive/issues/412</pre>

* 🔥 **FAIL** The following glyphs have components which themselves are component glyphs:
	* uni1E2A
	* uni1E74
	* uni1E1B
	* ij
	* ij
	* uni1E2D
	* uni1E2D
	* uni1E75
	* uni0403
	* uni0450 and 142 more.

Use -F or --full-lists to disable shortening of long lists. [code: found-nested-components]

</details>
<details>
<summary>🔥 <b>FAIL:</b> Font enables smart dropout control in "prep" table instructions?</summary>

* [com.google.fonts/check/smart_dropout](https://font-bakery.readthedocs.io/en/latest/fontbakery/profiles/googlefonts.html#com.google.fonts/check/smart_dropout)
<pre>--- Rationale ---
This setup is meant to ensure consistent rendering quality for fonts across all
devices (with different rendering/hinting capabilities).
Below is the snippet of instructions we expect to see in the fonts:
B8 01 FF    PUSHW 0x01FF
85          SCANCTRL (unconditinally turn on
                      dropout control mode)
B0 04       PUSHB 0x04
8D          SCANTYPE (enable smart dropout control)
&quot;Smart dropout control&quot; means activating rules 1, 2 and 5:
Rule 1: If a pixel&#x27;s center falls within the glyph outline,
        that pixel is turned on.
Rule 2: If a contour falls exactly on a pixel&#x27;s center,
        that pixel is turned on.
Rule 5: If a scan line between two adjacent pixel centers
        (either vertical or horizontal) is intersected
        by both an on-Transition contour and an off-Transition
        contour and neither of the pixels was already turned on
        by rules 1 and 2, turn on the pixel which is closer to
        the midpoint between the on-Transition contour and
        off-Transition contour. This is &quot;Smart&quot; dropout control.
For more detailed info (such as other rules not enabled in this snippet), please
refer to the TrueType Instruction Set documentation.</pre>

* 🔥 **FAIL** The 'prep' table does not contain TrueType instructions enabling smart dropout control. To fix, export the font with autohinting enabled, or run ttfautohint on the font, or run the `gftools fix-nonhinting` script. [code: lacks-smart-dropout]

</details>
<details>
<summary>⚠ <b>WARN:</b> Checking OS/2 achVendID.</summary>

* [com.google.fonts/check/vendor_id](https://font-bakery.readthedocs.io/en/latest/fontbakery/profiles/googlefonts.html#com.google.fonts/check/vendor_id)
<pre>--- Rationale ---
Microsoft keeps a list of font vendors and their respective contact info. This
list is updated regularly and is indexed by a 4-char &quot;Vendor ID&quot; which is stored
in the achVendID field of the OS/2 table.
Registering your ID is not mandatory, but it is a good practice since some
applications may display the type designer / type foundry contact info on some
dialog and also because that info will be visible on Microsoft&#x27;s website:
https://docs.microsoft.com/en-us/typography/vendors/
This check verifies whether or not a given font&#x27;s vendor ID is registered in
that list or if it has some of the default values used by the most common font
editors.
Each new FontBakery release includes a cached copy of that list of vendor IDs.
If you registered recently, you&#x27;re safe to ignore warnings emitted by this
check, since your ID will soon be included in one of our upcoming releases.</pre>

* ⚠ **WARN** OS/2 VendorID is 'PfEd', a font editor default. If you registered it recently, then it's safe to ignore this warning message. Otherwise, you should set it to your own unique 4 character code, and register it with Microsoft at https://www.microsoft.com/typography/links/vendorlist.aspx
 [code: bad]

</details>
<details>
<summary>⚠ <b>WARN:</b> Is there kerning info for non-ligated sequences?</summary>

* [com.google.fonts/check/kerning_for_non_ligated_sequences](https://font-bakery.readthedocs.io/en/latest/fontbakery/profiles/googlefonts.html#com.google.fonts/check/kerning_for_non_ligated_sequences)
<pre>--- Rationale ---
Fonts with ligatures should have kerning on the corresponding non-ligated
sequences for text where ligatures aren&#x27;t used (eg
https://github.com/impallari/Raleway/issues/14).</pre>

* ⚠ **WARN** GPOS table lacks kerning info for the following non-ligated sequences:
	- f + f
	- f + i
	- i + f
	- f + l
	- l + f
	- i + l

   [code: lacks-kern-info]

</details>
<details>
<summary>⚠ <b>WARN:</b> Ensure fonts have ScriptLangTags declared on the 'meta' table.</summary>

* [com.google.fonts/check/meta/script_lang_tags](https://font-bakery.readthedocs.io/en/latest/fontbakery/profiles/googlefonts.html#com.google.fonts/check/meta/script_lang_tags)
<pre>--- Rationale ---
The OpenType &#x27;meta&#x27; table originated at Apple. Microsoft added it to OT with
just two DataMap records:
- dlng: comma-separated ScriptLangTags that indicate which scripts, or languages
and scripts, with possible variants, the font is designed for
- slng: comma-separated ScriptLangTags that indicate which scripts, or languages
and scripts, with possible variants, the font supports
The slng structure is intended to describe which languages and scripts the font
overall supports. For example, a Traditional Chinese font that also contains
Latin characters, can indicate Hant,Latn, showing that it supports Hant, the
Traditional Chinese variant of the Hani script, and it also supports the Latn
script
The dlng structure is far more interesting. A font may contain various glyphs,
but only a particular subset of the glyphs may be truly &quot;leading&quot; in the design,
while other glyphs may have been included for technical reasons. Such a
Traditional Chinese font could only list Hant there, showing that it’s designed
for Traditional Chinese, but the font would omit Latn, because the developers
don’t think the font is really recommended for purely Latin-script use.
The tags used in the structures can comprise just script, or also language and
script. For example, if a font has Bulgarian Cyrillic alternates in the locl
feature for the cyrl BGR OT languagesystem, it could also indicate in dlng
explicitly that it supports bul-Cyrl. (Note that the scripts and languages in
meta use the ISO language and script codes, not the OpenType ones).
This check ensures that the font has the meta table containing the slng and dlng
structures.
All families in the Google Fonts collection should contain the &#x27;meta&#x27; table.
Windows 10 already uses it when deciding on which fonts to fall back to. The
Google Fonts API and also other environments could use the data for smarter
filtering. Most importantly, those entries should be added to the Noto fonts.
In the font making process, some environments store this data in external files
already. But the meta table provides a convenient way to store this inside the
font file, so some tools may add the data, and unrelated tools may read this
data. This makes the solution much more portable and universal.</pre>

* ⚠ **WARN** This font file does not have a 'meta' table. [code: lacks-meta-table]

</details>
<details>
<summary>⚠ <b>WARN:</b> Check font contains no unreachable glyphs</summary>

* [com.google.fonts/check/unreachable_glyphs](https://font-bakery.readthedocs.io/en/latest/fontbakery/profiles/universal.html#com.google.fonts/check/unreachable_glyphs)
<pre>--- Rationale ---
Glyphs are either accessible directly through Unicode codepoints or through
substitution rules. Any glyphs not accessible by either of these means are
redundant and serve only to increase the font&#x27;s file size.</pre>

* ⚠ **WARN** The following glyphs could not be reached by codepoint or substitution rules:
	- zero.lf
	- eight.lf
	- .null
	- nine.lf
	- three.lf
	- two.lf
	- five.lf
	- six.lf
	- four.lf
	- one.lf 
	- And seven.lf
 [code: unreachable-glyphs]

</details>
<details>
<summary>⚠ <b>WARN:</b> Check if each glyph has the recommended amount of contours.</summary>

* [com.google.fonts/check/contour_count](https://font-bakery.readthedocs.io/en/latest/fontbakery/profiles/universal.html#com.google.fonts/check/contour_count)
<pre>--- Rationale ---
Visually QAing thousands of glyphs by hand is tiring. Most glyphs can only be
constructured in a handful of ways. This means a glyph&#x27;s contour count will only
differ slightly amongst different fonts, e.g a &#x27;g&#x27; could either be 2 or 3
contours, depending on whether its double story or single story.
However, a quotedbl should have 2 contours, unless the font belongs to a display
family.
This check currently does not cover variable fonts because there&#x27;s plenty of
alternative ways of constructing glyphs with multiple outlines for each feature
in a VarFont. The expected contour count data for this check is currently
optimized for the typical construction of glyphs in static fonts.</pre>

* ⚠ **WARN** This check inspects the glyph outlines and detects the total number of contours in each of them. The expected values are infered from the typical ammounts of contours observed in a large collection of reference font families. The divergences listed below may simply indicate a significantly different design on some of your glyphs. On the other hand, some of these may flag actual bugs in the font such as glyphs mapped to an incorrect codepoint. Please consider reviewing the design and codepoint assignment of these to make sure they are correct.

The following glyphs do not have the recommended number of contours:

	- Glyph name: beta	Contours detected: 1	Expected: 2
	- Glyph name: rho	Contours detected: 1	Expected: 2
	- Glyph name: uni1E08	Contours detected: 3	Expected: 2
	- Glyph name: uni1E09	Contours detected: 3	Expected: 2
	- Glyph name: uni1E56	Contours detected: 2	Expected: 3
	- Glyph name: uni1FD2	Contours detected: 1	Expected: 4
	- Glyph name: uni1FD3	Contours detected: 1	Expected: 4
	- Glyph name: uni1FD7	Contours detected: 1	Expected: 4
	- Glyph name: uni1FE2	Contours detected: 1	Expected: 4
	- Glyph name: uni1FE3	Contours detected: 1	Expected: 4 
	- And 20 more.

Use -F or --full-lists to disable shortening of long lists.
 [code: contour-count]

</details>
<details>
<summary>⚠ <b>WARN:</b> Do outlines contain any jaggy segments?</summary>

* [com.google.fonts/check/outline_jaggy_segments](https://font-bakery.readthedocs.io/en/latest/fontbakery/profiles/<Section: Outline Correctness Checks>.html#com.google.fonts/check/outline_jaggy_segments)
<pre>--- Rationale ---
This check heuristically detects outline segments which form a particularly
small angle, indicative of an outline error. This may cause false positives in
cases such as extreme ink traps, so should be regarded as advisory and backed up
by manual inspection.</pre>

* ⚠ **WARN** The following glyphs have jaggy segments:
	* Omegatonos (U+038F): B<<170.0,78.0>-<194.0,68.0>-<304.0,68.0>>/B<<304.0,68.0>-<287.0,72.0>-<258.5,91.5>> = 13.240519915187184
	* Omegatonos (U+038F): B<<636.0,94.0>-<608.0,72.0>-<592.0,68.0>>/B<<592.0,68.0>-<702.0,68.0>-<726.0,78.0>> = 14.036243467926484
	* braceleft (U+007B): B<<165.0,325.0>-<146.0,309.0>-<126.0,308.0>>/B<<126.0,308.0>-<146.0,308.0>-<165.5,293.0>> = 2.862405226111651
	* braceright (U+007D): B<<158.5,293.0>-<178.0,308.0>-<198.0,308.0>>/B<<198.0,308.0>-<179.0,309.0>-<159.5,325.0>> = 3.012787504183286
	* uni03A9 (U+03A9): B<<156.0,78.0>-<180.0,68.0>-<290.0,68.0>>/B<<290.0,68.0>-<273.0,72.0>-<244.5,91.5>> = 13.240519915187184
	* uni03A9 (U+03A9): B<<622.0,94.0>-<594.0,72.0>-<578.0,68.0>>/B<<578.0,68.0>-<688.0,68.0>-<712.0,78.0>> = 14.036243467926484
	* uni03D2 (U+03D2): B<<274.0,599.5>-<324.0,532.0>-<339.0,415.0>>/B<<339.0,415.0>-<342.0,440.0>-<348.5,466.0>> = 14.148532945941765
	* uni03D3 (U+03D3): B<<274.0,599.5>-<324.0,532.0>-<339.0,415.0>>/B<<339.0,415.0>-<342.0,440.0>-<348.5,466.0>> = 14.148532945941765
	* uni03D4 (U+03D4): B<<274.0,599.5>-<324.0,532.0>-<339.0,415.0>>/B<<339.0,415.0>-<342.0,440.0>-<348.5,466.0>> = 14.148532945941765
	* uni03E2 (U+03E2): B<<845.5,-48.0>-<895.0,-7.0>-<929.0,58.0>>/B<<929.0,58.0>-<908.0,25.0>-<872.0,12.5>> = 4.8581644677638955 and 40 more.

Use -F or --full-lists to disable shortening of long lists. [code: found-jaggy-segments]

</details>
<details>
<summary>⚠ <b>WARN:</b> Do outlines contain any semi-vertical or semi-horizontal lines?</summary>

* [com.google.fonts/check/outline_semi_vertical](https://font-bakery.readthedocs.io/en/latest/fontbakery/profiles/<Section: Outline Correctness Checks>.html#com.google.fonts/check/outline_semi_vertical)
<pre>--- Rationale ---
This check detects line segments which are nearly, but not quite, exactly
horizontal or vertical. Sometimes such lines are created by design, but often
they are indicative of a design error.
This check is disabled for italic styles, which often contain nearly-upright
lines.</pre>

* ⚠ **WARN** The following glyphs have semi-vertical/semi-horizontal lines:
 * Geupturncy (U+0490): L<<49.0,655.0>--<372.0,656.0>>
 * Omegatonos (U+038F): L<<239.0,-1.0>--<114.0,-2.0>>
 * Omegatonos (U+038F): L<<782.0,-2.0>--<662.0,-1.0>>
 * Pi (U+03A0): L<<40.0,658.0>--<332.0,659.0>>
 * T_h (U+F10D): L<<703.0,319.0>--<704.0,135.0>>
 * bar (U+007C): L<<163.0,766.0>--<164.0,-106.0>>
 * brokenbar (U+00A6): L<<99.0,258.0>--<100.0,-106.0>>
 * brokenbar (U+00A6): L<<99.0,762.0>--<100.0,397.0>>
 * f.short (U+F10E): L<<165.0,366.0>--<166.0,135.0>>
 * f.short (U+F10E): L<<88.0,135.0>--<89.0,365.0>> and 89 more.

Use -F or --full-lists to disable shortening of long lists. [code: found-semi-vertical]

</details>
<details>
<summary>ℹ <b>INFO:</b> Show hinting filesize impact.</summary>

* [com.google.fonts/check/hinting_impact](https://font-bakery.readthedocs.io/en/latest/fontbakery/profiles/googlefonts.html#com.google.fonts/check/hinting_impact)
<pre>--- Rationale ---
This check is merely informative, displaying and useful comparison of filesizes
of hinted versus unhinted font files.</pre>

* ℹ **INFO** Hinting filesize impact:

 |               | CrimsonText-Regular.ttf          |
 |:------------- | ---------------:|
 | Dehinted Size | 142.8kb |
 | Hinted Size   | 142.8kb   |
 | Increase      | -24 bytes      |
 | Change        | -0.0 %  |
 [code: size-impact]

</details>
<details>
<summary>ℹ <b>INFO:</b> Font has old ttfautohint applied?</summary>

* [com.google.fonts/check/old_ttfautohint](https://font-bakery.readthedocs.io/en/latest/fontbakery/profiles/googlefonts.html#com.google.fonts/check/old_ttfautohint)
<pre>--- Rationale ---
Check if font has been hinted with an outdated version of ttfautohint.</pre>

* ℹ **INFO** Could not detect which version of ttfautohint was used in this font. It is typically specified as a comment in the font version entries of the 'name' table. Such font version strings are currently: ['Version 1.000'] [code: version-not-detected]

</details>
<details>
<summary>ℹ <b>INFO:</b> EPAR table present in font?</summary>

* [com.google.fonts/check/epar](https://font-bakery.readthedocs.io/en/latest/fontbakery/profiles/googlefonts.html#com.google.fonts/check/epar)
<pre>--- Rationale ---
The EPAR table is/was a way of expressing common licensing permissions and
restrictions in metadata; while almost nothing supported it, Dave Crossland
wonders that adding it to everything in Google Fonts could help make it more
popular.
More info is available at:
https://davelab6.github.io/epar/</pre>

* ℹ **INFO** EPAR table not present in font. To learn more see https://github.com/googlefonts/fontbakery/issues/818 [code: lacks-EPAR]

</details>
<details>
<summary>ℹ <b>INFO:</b> Familyname must be unique according to namecheck.fontdata.com</summary>

* [com.google.fonts/check/fontdata_namecheck](https://font-bakery.readthedocs.io/en/latest/fontbakery/profiles/googlefonts.html#com.google.fonts/check/fontdata_namecheck)
<pre>--- Rationale ---
We need to check names are not already used, and today the best place to check
that is http://namecheck.fontdata.com</pre>

* ℹ **INFO** The family name "CrimsonText" seems to be already in use.
Please visit http://namecheck.fontdata.com for more info. [code: name-collision]

</details>
<details>
<summary>ℹ <b>INFO:</b> Check for font-v versioning.</summary>

* [com.google.fonts/check/fontv](https://font-bakery.readthedocs.io/en/latest/fontbakery/profiles/googlefonts.html#com.google.fonts/check/fontv)
<pre>--- Rationale ---
The git sha1 tagging and dev/release features of Source Foundry `font-v` tool
are awesome and we would love to consider upstreaming the approach into fontmake
someday. For now we only emit a WARN if a given font does not yet follow the
experimental versioning style, but at some point we may start enforcing it.</pre>

* ℹ **INFO** Version string is: "Version 1.000"
The version string must ideally include a git commit hash and either a "dev" or a "release" suffix such as in the example below:
"Version 1.3; git-0d08353-release" [code: bad-format]

</details>
<details>
<summary>ℹ <b>INFO:</b> Font contains all required tables?</summary>

* [com.google.fonts/check/required_tables](https://font-bakery.readthedocs.io/en/latest/fontbakery/profiles/universal.html#com.google.fonts/check/required_tables)
<pre>--- Rationale ---
Depending on the typeface and coverage of a font, certain tables are recommended
for optimum quality. For example, the performance of a non-linear font is
improved if the VDMX, LTSH, and hdmx tables are present. Non-monospaced Latin
fonts should have a kern table. A gasp table is necessary if a designer wants to
influence the sizes at which grayscaling is used under Windows. Etc.</pre>

* ℹ **INFO** This font contains the following optional tables:
	- loca
	- GPOS 
	- And GSUB [code: optional-tables]

</details>
<details>
<summary>ℹ <b>INFO:</b> List all superfamily filepaths</summary>

* [com.google.fonts/check/superfamily/list](https://font-bakery.readthedocs.io/en/latest/fontbakery/profiles/universal.html#com.google.fonts/check/superfamily/list)
<pre>--- Rationale ---
This is a merely informative check that lists all sibling families detected by
fontbakery.
Only the fontfiles in these directories will be considered in superfamily-level
checks.</pre>

* ℹ **INFO** . [code: family-path]

</details>
<br>
</details>
<details>
<summary><b>[22] CrimsonText-SemiBold.ttf</b></summary>
<details>
<summary>🔥 <b>FAIL:</b> Check `Google Fonts Latin Core` glyph coverage.</summary>

* [com.google.fonts/check/glyph_coverage](https://font-bakery.readthedocs.io/en/latest/fontbakery/profiles/googlefonts.html#com.google.fonts/check/glyph_coverage)
<pre>--- Rationale ---
Google Fonts expects that fonts in its collection support at least the minimal
set of characters defined in the `GF-latin-core` glyph-set.</pre>

* 🔥 **FAIL** Missing required codepoints:

	- 0x00AD (SOFT HYPHEN)

	- 0x2122 (TRADE MARK SIGN)
 
	- And 0xFFFD (REPLACEMENT CHARACTER)
 [code: missing-codepoints]

</details>
<details>
<summary>🔥 <b>FAIL:</b> Checking OS/2 usWeightClass.</summary>

* [com.google.fonts/check/usweightclass](https://font-bakery.readthedocs.io/en/latest/fontbakery/profiles/googlefonts.html#com.google.fonts/check/usweightclass)
<pre>--- Rationale ---
Google Fonts expects variable fonts, static ttfs and static otfs to have
differing OS/2 usWeightClass values.
For Variable Fonts, Thin-Black must be 100-900
For static ttfs, Thin-Black can be 100-900 or 250-900
For static otfs, Thin-Black must be 250-900
If static otfs are set lower than 250, text may appear blurry in legacy Windows
applications.
Glyphsapp users can change the usWeightClass value of an instance by adding a
&#x27;weightClass&#x27; customParameter.</pre>

* 🔥 **FAIL** OS/2 usWeightClass is '400' when it should be '600'. [code: bad-value]

</details>
<details>
<summary>🔥 <b>FAIL:</b> Is the Grid-fitting and Scan-conversion Procedure ('gasp') table set to optimize rendering?</summary>

* [com.google.fonts/check/gasp](https://font-bakery.readthedocs.io/en/latest/fontbakery/profiles/googlefonts.html#com.google.fonts/check/gasp)
<pre>--- Rationale ---
Traditionally version 0 &#x27;gasp&#x27; tables were set so that font sizes below 8 ppem
had no grid fitting but did have antialiasing. From 9-16 ppem, just grid
fitting. And fonts above 17ppem had both antialiasing and grid fitting toggled
on. The use of accelerated graphics cards and higher resolution screens make
this approach obsolete. Microsoft&#x27;s DirectWrite pushed this even further with
much improved rendering built into the OS and apps.
In this scenario it makes sense to simply toggle all 4 flags ON for all font
sizes.</pre>

* 🔥 **FAIL** Font is missing the 'gasp' table. Try exporting the font with autohinting enabled.
If you are dealing with an unhinted font, it can be fixed by running the fonts through the command 'gftools fix-nonhinting'
GFTools is available at https://pypi.org/project/gftools/ [code: lacks-gasp]

</details>
<details>
<summary>🔥 <b>FAIL:</b> Ensure component transforms do not perform scaling or rotation.</summary>

* [com.google.fonts/check/transformed_components](https://font-bakery.readthedocs.io/en/latest/fontbakery/profiles/googlefonts.html#com.google.fonts/check/transformed_components)
<pre>--- Rationale ---
Some families have glyphs which have been constructed by using transformed
components e.g the &#x27;u&#x27; being constructed from a flipped &#x27;n&#x27;.
From a designers point of view, this sounds like a win (less work). However,
such approaches can lead to rasterization issues, such as having the &#x27;u&#x27; not
sitting on the baseline at certain sizes after running the font through
ttfautohint.
As of July 2019, Marc Foley observed that ttfautohint assigns cvt values to
transformed glyphs as if they are not transformed and the result is they render
very badly, and that vttLib does not support flipped components.
When building the font with fontmake, this problem can be fixed by using the
&quot;Decompose Transformed Components&quot; filter.</pre>

* 🔥 **FAIL** The following glyphs had components with scaling or rotation:

* exclamdown (component exclam)
* questiondown (component question)
* quotedblleft (component quotesinglbase)
* quotedblleft (component quotesinglbase)
* quoteleft (component quotesinglbase)
* guillemotright (component guilsinglleft)
* guillemotright (component guilsinglleft)
* guilsinglright (component guilsinglleft)
 [code: transformed-components]

</details>
<details>
<summary>🔥 <b>FAIL:</b> Check glyphs do not have components which are themselves components.</summary>

* [com.google.fonts/check/glyf_nested_components](https://font-bakery.readthedocs.io/en/latest/fontbakery/profiles/googlefonts.html#com.google.fonts/check/glyf_nested_components)
<pre>--- Rationale ---
There have been bugs rendering variable fonts with nested components.
Additionally, some static fonts with nested components have been reported to
have rendering and printing issues.
For more info, see:
* https://github.com/googlefonts/fontbakery/issues/2961
* https://github.com/arrowtype/recursive/issues/412</pre>

* 🔥 **FAIL** The following glyphs have components which themselves are component glyphs:
	* uni1E74
	* uni1E1B
	* ij
	* ij
	* uni1E2D
	* uni1E2D
	* uni1E75
	* Iotadieresis and uni037E [code: found-nested-components]

</details>
<details>
<summary>🔥 <b>FAIL:</b> Font enables smart dropout control in "prep" table instructions?</summary>

* [com.google.fonts/check/smart_dropout](https://font-bakery.readthedocs.io/en/latest/fontbakery/profiles/googlefonts.html#com.google.fonts/check/smart_dropout)
<pre>--- Rationale ---
This setup is meant to ensure consistent rendering quality for fonts across all
devices (with different rendering/hinting capabilities).
Below is the snippet of instructions we expect to see in the fonts:
B8 01 FF    PUSHW 0x01FF
85          SCANCTRL (unconditinally turn on
                      dropout control mode)
B0 04       PUSHB 0x04
8D          SCANTYPE (enable smart dropout control)
&quot;Smart dropout control&quot; means activating rules 1, 2 and 5:
Rule 1: If a pixel&#x27;s center falls within the glyph outline,
        that pixel is turned on.
Rule 2: If a contour falls exactly on a pixel&#x27;s center,
        that pixel is turned on.
Rule 5: If a scan line between two adjacent pixel centers
        (either vertical or horizontal) is intersected
        by both an on-Transition contour and an off-Transition
        contour and neither of the pixels was already turned on
        by rules 1 and 2, turn on the pixel which is closer to
        the midpoint between the on-Transition contour and
        off-Transition contour. This is &quot;Smart&quot; dropout control.
For more detailed info (such as other rules not enabled in this snippet), please
refer to the TrueType Instruction Set documentation.</pre>

* 🔥 **FAIL** The 'prep' table does not contain TrueType instructions enabling smart dropout control. To fix, export the font with autohinting enabled, or run ttfautohint on the font, or run the `gftools fix-nonhinting` script. [code: lacks-smart-dropout]

</details>
<details>
<summary>⚠ <b>WARN:</b> Checking OS/2 achVendID.</summary>

* [com.google.fonts/check/vendor_id](https://font-bakery.readthedocs.io/en/latest/fontbakery/profiles/googlefonts.html#com.google.fonts/check/vendor_id)
<pre>--- Rationale ---
Microsoft keeps a list of font vendors and their respective contact info. This
list is updated regularly and is indexed by a 4-char &quot;Vendor ID&quot; which is stored
in the achVendID field of the OS/2 table.
Registering your ID is not mandatory, but it is a good practice since some
applications may display the type designer / type foundry contact info on some
dialog and also because that info will be visible on Microsoft&#x27;s website:
https://docs.microsoft.com/en-us/typography/vendors/
This check verifies whether or not a given font&#x27;s vendor ID is registered in
that list or if it has some of the default values used by the most common font
editors.
Each new FontBakery release includes a cached copy of that list of vendor IDs.
If you registered recently, you&#x27;re safe to ignore warnings emitted by this
check, since your ID will soon be included in one of our upcoming releases.</pre>

* ⚠ **WARN** OS/2 VendorID is 'PfEd', a font editor default. If you registered it recently, then it's safe to ignore this warning message. Otherwise, you should set it to your own unique 4 character code, and register it with Microsoft at https://www.microsoft.com/typography/links/vendorlist.aspx
 [code: bad]

</details>
<details>
<summary>⚠ <b>WARN:</b> Is there kerning info for non-ligated sequences?</summary>

* [com.google.fonts/check/kerning_for_non_ligated_sequences](https://font-bakery.readthedocs.io/en/latest/fontbakery/profiles/googlefonts.html#com.google.fonts/check/kerning_for_non_ligated_sequences)
<pre>--- Rationale ---
Fonts with ligatures should have kerning on the corresponding non-ligated
sequences for text where ligatures aren&#x27;t used (eg
https://github.com/impallari/Raleway/issues/14).</pre>

* ⚠ **WARN** GPOS table lacks kerning info for the following non-ligated sequences:
	- f + f
	- f + i
	- i + f
	- f + l
	- l + f
	- i + l

   [code: lacks-kern-info]

</details>
<details>
<summary>⚠ <b>WARN:</b> Combined length of family and style must not exceed 27 characters.</summary>

* [com.google.fonts/check/name/family_and_style_max_length](https://font-bakery.readthedocs.io/en/latest/fontbakery/profiles/googlefonts.html#com.google.fonts/check/name/family_and_style_max_length)
<pre>--- Rationale ---
According to a GlyphsApp tutorial [1], in order to make sure all versions of
Windows recognize it as a valid font file, we must make sure that the
concatenated length of the familyname (NameID.FONT_FAMILY_NAME) and style
(NameID.FONT_SUBFAMILY_NAME) strings in the name table do not exceed 20
characters.
After discussing the problem in more detail at `FontBakery issue #2179 [2] we
decided that allowing up to 27 chars would still be on the safe side, though.
[1] https://glyphsapp.com/tutorials/multiple-masters-part-3-setting-up-instances
[2] https://github.com/googlefonts/fontbakery/issues/2179</pre>

* ⚠ **WARN** The combined length of family and style exceeds 27 chars in the following 'WINDOWS' entries:
 FONT_FAMILY_NAME = 'Crimson Text SemiBold' / SUBFAMILY_NAME = 'Regular'

Please take a look at the conversation at https://github.com/googlefonts/fontbakery/issues/2179 in order to understand the reasoning behind these name table records max-length criteria. [code: too-long]

</details>
<details>
<summary>⚠ <b>WARN:</b> Ensure fonts have ScriptLangTags declared on the 'meta' table.</summary>

* [com.google.fonts/check/meta/script_lang_tags](https://font-bakery.readthedocs.io/en/latest/fontbakery/profiles/googlefonts.html#com.google.fonts/check/meta/script_lang_tags)
<pre>--- Rationale ---
The OpenType &#x27;meta&#x27; table originated at Apple. Microsoft added it to OT with
just two DataMap records:
- dlng: comma-separated ScriptLangTags that indicate which scripts, or languages
and scripts, with possible variants, the font is designed for
- slng: comma-separated ScriptLangTags that indicate which scripts, or languages
and scripts, with possible variants, the font supports
The slng structure is intended to describe which languages and scripts the font
overall supports. For example, a Traditional Chinese font that also contains
Latin characters, can indicate Hant,Latn, showing that it supports Hant, the
Traditional Chinese variant of the Hani script, and it also supports the Latn
script
The dlng structure is far more interesting. A font may contain various glyphs,
but only a particular subset of the glyphs may be truly &quot;leading&quot; in the design,
while other glyphs may have been included for technical reasons. Such a
Traditional Chinese font could only list Hant there, showing that it’s designed
for Traditional Chinese, but the font would omit Latn, because the developers
don’t think the font is really recommended for purely Latin-script use.
The tags used in the structures can comprise just script, or also language and
script. For example, if a font has Bulgarian Cyrillic alternates in the locl
feature for the cyrl BGR OT languagesystem, it could also indicate in dlng
explicitly that it supports bul-Cyrl. (Note that the scripts and languages in
meta use the ISO language and script codes, not the OpenType ones).
This check ensures that the font has the meta table containing the slng and dlng
structures.
All families in the Google Fonts collection should contain the &#x27;meta&#x27; table.
Windows 10 already uses it when deciding on which fonts to fall back to. The
Google Fonts API and also other environments could use the data for smarter
filtering. Most importantly, those entries should be added to the Noto fonts.
In the font making process, some environments store this data in external files
already. But the meta table provides a convenient way to store this inside the
font file, so some tools may add the data, and unrelated tools may read this
data. This makes the solution much more portable and universal.</pre>

* ⚠ **WARN** This font file does not have a 'meta' table. [code: lacks-meta-table]

</details>
<details>
<summary>⚠ <b>WARN:</b> Check font contains no unreachable glyphs</summary>

* [com.google.fonts/check/unreachable_glyphs](https://font-bakery.readthedocs.io/en/latest/fontbakery/profiles/universal.html#com.google.fonts/check/unreachable_glyphs)
<pre>--- Rationale ---
Glyphs are either accessible directly through Unicode codepoints or through
substitution rules. Any glyphs not accessible by either of these means are
redundant and serve only to increase the font&#x27;s file size.</pre>

* ⚠ **WARN** The following glyphs could not be reached by codepoint or substitution rules:
	- zero.lf
	- eight.lf
	- .null
	- nine.lf
	- three.lf
	- two.lf
	- five.lf
	- six.lf
	- four.lf
	- one.lf 
	- And seven.lf
 [code: unreachable-glyphs]

</details>
<details>
<summary>⚠ <b>WARN:</b> Check if each glyph has the recommended amount of contours.</summary>

* [com.google.fonts/check/contour_count](https://font-bakery.readthedocs.io/en/latest/fontbakery/profiles/universal.html#com.google.fonts/check/contour_count)
<pre>--- Rationale ---
Visually QAing thousands of glyphs by hand is tiring. Most glyphs can only be
constructured in a handful of ways. This means a glyph&#x27;s contour count will only
differ slightly amongst different fonts, e.g a &#x27;g&#x27; could either be 2 or 3
contours, depending on whether its double story or single story.
However, a quotedbl should have 2 contours, unless the font belongs to a display
family.
This check currently does not cover variable fonts because there&#x27;s plenty of
alternative ways of constructing glyphs with multiple outlines for each feature
in a VarFont. The expected contour count data for this check is currently
optimized for the typical construction of glyphs in static fonts.</pre>

* ⚠ **WARN** This check inspects the glyph outlines and detects the total number of contours in each of them. The expected values are infered from the typical ammounts of contours observed in a large collection of reference font families. The divergences listed below may simply indicate a significantly different design on some of your glyphs. On the other hand, some of these may flag actual bugs in the font such as glyphs mapped to an incorrect codepoint. Please consider reviewing the design and codepoint assignment of these to make sure they are correct.

The following glyphs do not have the recommended number of contours:

	- Glyph name: uni02BC	Contours detected: 0	Expected: 1
	- Glyph name: circumflex	Contours detected: 0	Expected: 1
	- Glyph name: breve	Contours detected: 0	Expected: 1
	- Glyph name: dotaccent	Contours detected: 0	Expected: 1
	- Glyph name: ring	Contours detected: 0	Expected: 2
	- Glyph name: hungarumlaut	Contours detected: 0	Expected: 2
	- Glyph name: uni0312	Contours detected: 0	Expected: 1
	- Glyph name: uni0374	Contours detected: 0	Expected: 1
	- Glyph name: uni0375	Contours detected: 0	Expected: 1
	- Glyph name: uni037A	Contours detected: 0	Expected: 1 
	- And 831 more.

Use -F or --full-lists to disable shortening of long lists.
 [code: contour-count]

</details>
<details>
<summary>⚠ <b>WARN:</b> Do any segments have colinear vectors?</summary>

* [com.google.fonts/check/outline_colinear_vectors](https://font-bakery.readthedocs.io/en/latest/fontbakery/profiles/<Section: Outline Correctness Checks>.html#com.google.fonts/check/outline_colinear_vectors)
<pre>--- Rationale ---
This check looks for consecutive line segments which have the same angle. This
normally happens if an outline point has been added by accident.
This check is not run for variable fonts, as they may legitimately have colinear
vectors.</pre>

* ⚠ **WARN** The following glyphs have colinear vectors:
	* B (U+0042): L<<162.0,658.0>--<248.0,659.0>> -> L<<248.0,659.0>--<308.0,659.0>>
	* B (U+0042): L<<219.0,595.0>--<217.0,499.0>> -> L<<217.0,499.0>--<217.0,382.0>>
	* Bmacronbelow (U+1E06): L<<162.0,658.0>--<248.0,659.0>> -> L<<248.0,659.0>--<308.0,659.0>>
	* Bmacronbelow (U+1E06): L<<219.0,595.0>--<217.0,499.0>> -> L<<217.0,499.0>--<217.0,382.0>>
	* G (U+0047): L<<492.0,84.0>--<491.0,156.0>> -> L<<491.0,156.0>--<491.0,163.0>>
	* G (U+0047): L<<603.0,179.0>--<604.0,137.0>> -> L<<604.0,137.0>--<604.0,114.0>>
	* Gbreve (U+011E): L<<492.0,84.0>--<491.0,156.0>> -> L<<491.0,156.0>--<491.0,163.0>>
	* Gbreve (U+011E): L<<603.0,179.0>--<604.0,137.0>> -> L<<604.0,137.0>--<604.0,114.0>>
	* Gcircumflex (U+011C): L<<492.0,84.0>--<491.0,156.0>> -> L<<491.0,156.0>--<491.0,163.0>>
	* Gcircumflex (U+011C): L<<603.0,179.0>--<604.0,137.0>> -> L<<604.0,137.0>--<604.0,114.0>> and 62 more.

Use -F or --full-lists to disable shortening of long lists. [code: found-colinear-vectors]

</details>
<details>
<summary>⚠ <b>WARN:</b> Do outlines contain any jaggy segments?</summary>

* [com.google.fonts/check/outline_jaggy_segments](https://font-bakery.readthedocs.io/en/latest/fontbakery/profiles/<Section: Outline Correctness Checks>.html#com.google.fonts/check/outline_jaggy_segments)
<pre>--- Rationale ---
This check heuristically detects outline segments which form a particularly
small angle, indicative of an outline error. This may cause false positives in
cases such as extreme ink traps, so should be regarded as advisory and backed up
by manual inspection.</pre>

* ⚠ **WARN** The following glyphs have jaggy segments:
	* two.osf (U+F732): L<<27.0,330.0>--<30.0,339.0>>/L<<30.0,339.0>--<27.0,334.0>> = 12.528807709151433 and two.osf (U+F732): L<<30.0,339.0>--<27.0,334.0>>/B<<27.0,334.0>-<41.0,361.0>-<69.5,389.5>> = 3.556181094254921 [code: found-jaggy-segments]

</details>
<details>
<summary>⚠ <b>WARN:</b> Do outlines contain any semi-vertical or semi-horizontal lines?</summary>

* [com.google.fonts/check/outline_semi_vertical](https://font-bakery.readthedocs.io/en/latest/fontbakery/profiles/<Section: Outline Correctness Checks>.html#com.google.fonts/check/outline_semi_vertical)
<pre>--- Rationale ---
This check detects line segments which are nearly, but not quite, exactly
horizontal or vertical. Sometimes such lines are created by design, but often
they are indicative of a design error.
This check is disabled for italic styles, which often contain nearly-upright
lines.</pre>

* ⚠ **WARN** The following glyphs have semi-vertical/semi-horizontal lines:
 * B (U+0042): L<<305.0,0.0>--<163.0,1.0>>
 * Bmacronbelow (U+1E06): L<<305.0,0.0>--<163.0,1.0>>
 * T_h (U+F10D): L<<630.0,128.0>--<632.0,538.0>>
 * bar (U+007C): L<<110.0,766.0>--<111.0,-106.0>>
 * brokenbar (U+00A6): L<<109.0,246.0>--<110.0,-106.0>>
 * brokenbar (U+00A6): L<<109.0,766.0>--<110.0,414.0>>
 * f_f (U+F100): L<<390.0,128.0>--<391.0,364.0>>
 * f_f_b (U+F106): L<<494.0,366.0>--<495.0,140.0>>
 * f_f_h (U+F10A): L<<390.0,128.0>--<391.0,364.0>>
 * f_f_h (U+F10A): L<<692.0,128.0>--<693.0,508.0>> and 19 more.

Use -F or --full-lists to disable shortening of long lists. [code: found-semi-vertical]

</details>
<details>
<summary>ℹ <b>INFO:</b> Show hinting filesize impact.</summary>

* [com.google.fonts/check/hinting_impact](https://font-bakery.readthedocs.io/en/latest/fontbakery/profiles/googlefonts.html#com.google.fonts/check/hinting_impact)
<pre>--- Rationale ---
This check is merely informative, displaying and useful comparison of filesizes
of hinted versus unhinted font files.</pre>

* ℹ **INFO** Hinting filesize impact:

 |               | CrimsonText-SemiBold.ttf          |
 |:------------- | ---------------:|
 | Dehinted Size | 96.6kb |
 | Hinted Size   | 96.5kb   |
 | Increase      | -24 bytes      |
 | Change        | -0.0 %  |
 [code: size-impact]

</details>
<details>
<summary>ℹ <b>INFO:</b> Font has old ttfautohint applied?</summary>

* [com.google.fonts/check/old_ttfautohint](https://font-bakery.readthedocs.io/en/latest/fontbakery/profiles/googlefonts.html#com.google.fonts/check/old_ttfautohint)
<pre>--- Rationale ---
Check if font has been hinted with an outdated version of ttfautohint.</pre>

* ℹ **INFO** Could not detect which version of ttfautohint was used in this font. It is typically specified as a comment in the font version entries of the 'name' table. Such font version strings are currently: ['Version 1.000'] [code: version-not-detected]

</details>
<details>
<summary>ℹ <b>INFO:</b> EPAR table present in font?</summary>

* [com.google.fonts/check/epar](https://font-bakery.readthedocs.io/en/latest/fontbakery/profiles/googlefonts.html#com.google.fonts/check/epar)
<pre>--- Rationale ---
The EPAR table is/was a way of expressing common licensing permissions and
restrictions in metadata; while almost nothing supported it, Dave Crossland
wonders that adding it to everything in Google Fonts could help make it more
popular.
More info is available at:
https://davelab6.github.io/epar/</pre>

* ℹ **INFO** EPAR table not present in font. To learn more see https://github.com/googlefonts/fontbakery/issues/818 [code: lacks-EPAR]

</details>
<details>
<summary>ℹ <b>INFO:</b> Familyname must be unique according to namecheck.fontdata.com</summary>

* [com.google.fonts/check/fontdata_namecheck](https://font-bakery.readthedocs.io/en/latest/fontbakery/profiles/googlefonts.html#com.google.fonts/check/fontdata_namecheck)
<pre>--- Rationale ---
We need to check names are not already used, and today the best place to check
that is http://namecheck.fontdata.com</pre>

* ℹ **INFO** The family name "CrimsonText" seems to be already in use.
Please visit http://namecheck.fontdata.com for more info. [code: name-collision]

</details>
<details>
<summary>ℹ <b>INFO:</b> Check for font-v versioning.</summary>

* [com.google.fonts/check/fontv](https://font-bakery.readthedocs.io/en/latest/fontbakery/profiles/googlefonts.html#com.google.fonts/check/fontv)
<pre>--- Rationale ---
The git sha1 tagging and dev/release features of Source Foundry `font-v` tool
are awesome and we would love to consider upstreaming the approach into fontmake
someday. For now we only emit a WARN if a given font does not yet follow the
experimental versioning style, but at some point we may start enforcing it.</pre>

* ℹ **INFO** Version string is: "Version 1.000"
The version string must ideally include a git commit hash and either a "dev" or a "release" suffix such as in the example below:
"Version 1.3; git-0d08353-release" [code: bad-format]

</details>
<details>
<summary>ℹ <b>INFO:</b> Font contains all required tables?</summary>

* [com.google.fonts/check/required_tables](https://font-bakery.readthedocs.io/en/latest/fontbakery/profiles/universal.html#com.google.fonts/check/required_tables)
<pre>--- Rationale ---
Depending on the typeface and coverage of a font, certain tables are recommended
for optimum quality. For example, the performance of a non-linear font is
improved if the VDMX, LTSH, and hdmx tables are present. Non-monospaced Latin
fonts should have a kern table. A gasp table is necessary if a designer wants to
influence the sizes at which grayscaling is used under Windows. Etc.</pre>

* ℹ **INFO** This font contains the following optional tables:
	- loca
	- GPOS 
	- And GSUB [code: optional-tables]

</details>
<details>
<summary>ℹ <b>INFO:</b> List all superfamily filepaths</summary>

* [com.google.fonts/check/superfamily/list](https://font-bakery.readthedocs.io/en/latest/fontbakery/profiles/universal.html#com.google.fonts/check/superfamily/list)
<pre>--- Rationale ---
This is a merely informative check that lists all sibling families detected by
fontbakery.
Only the fontfiles in these directories will be considered in superfamily-level
checks.</pre>

* ℹ **INFO** . [code: family-path]

</details>
<br>
</details>
<details>
<summary><b>[20] CrimsonText-SemiBoldItalic.ttf</b></summary>
<details>
<summary>🔥 <b>FAIL:</b> Check `Google Fonts Latin Core` glyph coverage.</summary>

* [com.google.fonts/check/glyph_coverage](https://font-bakery.readthedocs.io/en/latest/fontbakery/profiles/googlefonts.html#com.google.fonts/check/glyph_coverage)
<pre>--- Rationale ---
Google Fonts expects that fonts in its collection support at least the minimal
set of characters defined in the `GF-latin-core` glyph-set.</pre>

* 🔥 **FAIL** Missing required codepoints:

	- 0x00AA (FEMININE ORDINAL INDICATOR)

	- 0x00AD (SOFT HYPHEN)

	- 0x00B2 (SUPERSCRIPT TWO)

	- 0x00B3 (SUPERSCRIPT THREE)

	- 0x00B9 (SUPERSCRIPT ONE)

	- 0x00BA (MASCULINE ORDINAL INDICATOR)

	- 0x2002 (EN SPACE)

	- 0x2009 (THIN SPACE)

	- 0x200B (ZERO WIDTH SPACE)

	- 0x2074 (SUPERSCRIPT FOUR)
 
	- And 4 more.

Use -F or --full-lists to disable shortening of long lists. [code: missing-codepoints]

</details>
<details>
<summary>🔥 <b>FAIL:</b> Checking OS/2 usWeightClass.</summary>

* [com.google.fonts/check/usweightclass](https://font-bakery.readthedocs.io/en/latest/fontbakery/profiles/googlefonts.html#com.google.fonts/check/usweightclass)
<pre>--- Rationale ---
Google Fonts expects variable fonts, static ttfs and static otfs to have
differing OS/2 usWeightClass values.
For Variable Fonts, Thin-Black must be 100-900
For static ttfs, Thin-Black can be 100-900 or 250-900
For static otfs, Thin-Black must be 250-900
If static otfs are set lower than 250, text may appear blurry in legacy Windows
applications.
Glyphsapp users can change the usWeightClass value of an instance by adding a
&#x27;weightClass&#x27; customParameter.</pre>

* 🔥 **FAIL** OS/2 usWeightClass is '400' when it should be '600'. [code: bad-value]

</details>
<details>
<summary>🔥 <b>FAIL:</b> Is the Grid-fitting and Scan-conversion Procedure ('gasp') table set to optimize rendering?</summary>

* [com.google.fonts/check/gasp](https://font-bakery.readthedocs.io/en/latest/fontbakery/profiles/googlefonts.html#com.google.fonts/check/gasp)
<pre>--- Rationale ---
Traditionally version 0 &#x27;gasp&#x27; tables were set so that font sizes below 8 ppem
had no grid fitting but did have antialiasing. From 9-16 ppem, just grid
fitting. And fonts above 17ppem had both antialiasing and grid fitting toggled
on. The use of accelerated graphics cards and higher resolution screens make
this approach obsolete. Microsoft&#x27;s DirectWrite pushed this even further with
much improved rendering built into the OS and apps.
In this scenario it makes sense to simply toggle all 4 flags ON for all font
sizes.</pre>

* 🔥 **FAIL** Font is missing the 'gasp' table. Try exporting the font with autohinting enabled.
If you are dealing with an unhinted font, it can be fixed by running the fonts through the command 'gftools fix-nonhinting'
GFTools is available at https://pypi.org/project/gftools/ [code: lacks-gasp]

</details>
<details>
<summary>🔥 <b>FAIL:</b> Ensure component transforms do not perform scaling or rotation.</summary>

* [com.google.fonts/check/transformed_components](https://font-bakery.readthedocs.io/en/latest/fontbakery/profiles/googlefonts.html#com.google.fonts/check/transformed_components)
<pre>--- Rationale ---
Some families have glyphs which have been constructed by using transformed
components e.g the &#x27;u&#x27; being constructed from a flipped &#x27;n&#x27;.
From a designers point of view, this sounds like a win (less work). However,
such approaches can lead to rasterization issues, such as having the &#x27;u&#x27; not
sitting on the baseline at certain sizes after running the font through
ttfautohint.
As of July 2019, Marc Foley observed that ttfautohint assigns cvt values to
transformed glyphs as if they are not transformed and the result is they render
very badly, and that vttLib does not support flipped components.
When building the font with fontmake, this problem can be fixed by using the
&quot;Decompose Transformed Components&quot; filter.</pre>

* 🔥 **FAIL** The following glyphs had components with scaling or rotation:

* questiondown (component question)
 [code: transformed-components]

</details>
<details>
<summary>🔥 <b>FAIL:</b> Check glyphs do not have components which are themselves components.</summary>

* [com.google.fonts/check/glyf_nested_components](https://font-bakery.readthedocs.io/en/latest/fontbakery/profiles/googlefonts.html#com.google.fonts/check/glyf_nested_components)
<pre>--- Rationale ---
There have been bugs rendering variable fonts with nested components.
Additionally, some static fonts with nested components have been reported to
have rendering and printing issues.
For more info, see:
* https://github.com/googlefonts/fontbakery/issues/2961
* https://github.com/arrowtype/recursive/issues/412</pre>

* 🔥 **FAIL** The following glyphs have components which themselves are component glyphs:
	* Ldot
	* ldot and uni2011 [code: found-nested-components]

</details>
<details>
<summary>🔥 <b>FAIL:</b> Font enables smart dropout control in "prep" table instructions?</summary>

* [com.google.fonts/check/smart_dropout](https://font-bakery.readthedocs.io/en/latest/fontbakery/profiles/googlefonts.html#com.google.fonts/check/smart_dropout)
<pre>--- Rationale ---
This setup is meant to ensure consistent rendering quality for fonts across all
devices (with different rendering/hinting capabilities).
Below is the snippet of instructions we expect to see in the fonts:
B8 01 FF    PUSHW 0x01FF
85          SCANCTRL (unconditinally turn on
                      dropout control mode)
B0 04       PUSHB 0x04
8D          SCANTYPE (enable smart dropout control)
&quot;Smart dropout control&quot; means activating rules 1, 2 and 5:
Rule 1: If a pixel&#x27;s center falls within the glyph outline,
        that pixel is turned on.
Rule 2: If a contour falls exactly on a pixel&#x27;s center,
        that pixel is turned on.
Rule 5: If a scan line between two adjacent pixel centers
        (either vertical or horizontal) is intersected
        by both an on-Transition contour and an off-Transition
        contour and neither of the pixels was already turned on
        by rules 1 and 2, turn on the pixel which is closer to
        the midpoint between the on-Transition contour and
        off-Transition contour. This is &quot;Smart&quot; dropout control.
For more detailed info (such as other rules not enabled in this snippet), please
refer to the TrueType Instruction Set documentation.</pre>

* 🔥 **FAIL** The 'prep' table does not contain TrueType instructions enabling smart dropout control. To fix, export the font with autohinting enabled, or run ttfautohint on the font, or run the `gftools fix-nonhinting` script. [code: lacks-smart-dropout]

</details>
<details>
<summary>⚠ <b>WARN:</b> Checking OS/2 achVendID.</summary>

* [com.google.fonts/check/vendor_id](https://font-bakery.readthedocs.io/en/latest/fontbakery/profiles/googlefonts.html#com.google.fonts/check/vendor_id)
<pre>--- Rationale ---
Microsoft keeps a list of font vendors and their respective contact info. This
list is updated regularly and is indexed by a 4-char &quot;Vendor ID&quot; which is stored
in the achVendID field of the OS/2 table.
Registering your ID is not mandatory, but it is a good practice since some
applications may display the type designer / type foundry contact info on some
dialog and also because that info will be visible on Microsoft&#x27;s website:
https://docs.microsoft.com/en-us/typography/vendors/
This check verifies whether or not a given font&#x27;s vendor ID is registered in
that list or if it has some of the default values used by the most common font
editors.
Each new FontBakery release includes a cached copy of that list of vendor IDs.
If you registered recently, you&#x27;re safe to ignore warnings emitted by this
check, since your ID will soon be included in one of our upcoming releases.</pre>

* ⚠ **WARN** OS/2 VendorID is 'PfEd', a font editor default. If you registered it recently, then it's safe to ignore this warning message. Otherwise, you should set it to your own unique 4 character code, and register it with Microsoft at https://www.microsoft.com/typography/links/vendorlist.aspx
 [code: bad]

</details>
<details>
<summary>⚠ <b>WARN:</b> Ensure fonts have ScriptLangTags declared on the 'meta' table.</summary>

* [com.google.fonts/check/meta/script_lang_tags](https://font-bakery.readthedocs.io/en/latest/fontbakery/profiles/googlefonts.html#com.google.fonts/check/meta/script_lang_tags)
<pre>--- Rationale ---
The OpenType &#x27;meta&#x27; table originated at Apple. Microsoft added it to OT with
just two DataMap records:
- dlng: comma-separated ScriptLangTags that indicate which scripts, or languages
and scripts, with possible variants, the font is designed for
- slng: comma-separated ScriptLangTags that indicate which scripts, or languages
and scripts, with possible variants, the font supports
The slng structure is intended to describe which languages and scripts the font
overall supports. For example, a Traditional Chinese font that also contains
Latin characters, can indicate Hant,Latn, showing that it supports Hant, the
Traditional Chinese variant of the Hani script, and it also supports the Latn
script
The dlng structure is far more interesting. A font may contain various glyphs,
but only a particular subset of the glyphs may be truly &quot;leading&quot; in the design,
while other glyphs may have been included for technical reasons. Such a
Traditional Chinese font could only list Hant there, showing that it’s designed
for Traditional Chinese, but the font would omit Latn, because the developers
don’t think the font is really recommended for purely Latin-script use.
The tags used in the structures can comprise just script, or also language and
script. For example, if a font has Bulgarian Cyrillic alternates in the locl
feature for the cyrl BGR OT languagesystem, it could also indicate in dlng
explicitly that it supports bul-Cyrl. (Note that the scripts and languages in
meta use the ISO language and script codes, not the OpenType ones).
This check ensures that the font has the meta table containing the slng and dlng
structures.
All families in the Google Fonts collection should contain the &#x27;meta&#x27; table.
Windows 10 already uses it when deciding on which fonts to fall back to. The
Google Fonts API and also other environments could use the data for smarter
filtering. Most importantly, those entries should be added to the Noto fonts.
In the font making process, some environments store this data in external files
already. But the meta table provides a convenient way to store this inside the
font file, so some tools may add the data, and unrelated tools may read this
data. This makes the solution much more portable and universal.</pre>

* ⚠ **WARN** This font file does not have a 'meta' table. [code: lacks-meta-table]

</details>
<details>
<summary>⚠ <b>WARN:</b> Check font contains no unreachable glyphs</summary>

* [com.google.fonts/check/unreachable_glyphs](https://font-bakery.readthedocs.io/en/latest/fontbakery/profiles/universal.html#com.google.fonts/check/unreachable_glyphs)
<pre>--- Rationale ---
Glyphs are either accessible directly through Unicode codepoints or through
substitution rules. Any glyphs not accessible by either of these means are
redundant and serve only to increase the font&#x27;s file size.</pre>

* ⚠ **WARN** The following glyphs could not be reached by codepoint or substitution rules:
	- .null
 [code: unreachable-glyphs]

</details>
<details>
<summary>⚠ <b>WARN:</b> Check if each glyph has the recommended amount of contours.</summary>

* [com.google.fonts/check/contour_count](https://font-bakery.readthedocs.io/en/latest/fontbakery/profiles/universal.html#com.google.fonts/check/contour_count)
<pre>--- Rationale ---
Visually QAing thousands of glyphs by hand is tiring. Most glyphs can only be
constructured in a handful of ways. This means a glyph&#x27;s contour count will only
differ slightly amongst different fonts, e.g a &#x27;g&#x27; could either be 2 or 3
contours, depending on whether its double story or single story.
However, a quotedbl should have 2 contours, unless the font belongs to a display
family.
This check currently does not cover variable fonts because there&#x27;s plenty of
alternative ways of constructing glyphs with multiple outlines for each feature
in a VarFont. The expected contour count data for this check is currently
optimized for the typical construction of glyphs in static fonts.</pre>

* ⚠ **WARN** This check inspects the glyph outlines and detects the total number of contours in each of them. The expected values are infered from the typical ammounts of contours observed in a large collection of reference font families. The divergences listed below may simply indicate a significantly different design on some of your glyphs. On the other hand, some of these may flag actual bugs in the font such as glyphs mapped to an incorrect codepoint. Please consider reviewing the design and codepoint assignment of these to make sure they are correct.

The following glyphs do not have the recommended number of contours:

	- Glyph name: uni02BB	Contours detected: 0	Expected: 1
	- Glyph name: uni02BC	Contours detected: 0	Expected: 1
	- Glyph name: fi	Contours detected: 1	Expected: 3
	- Glyph name: fl	Contours detected: 1	Expected: 2
	- Glyph name: uni02BB	Contours detected: 0	Expected: 1 
	- And Glyph name: uni02BC	Contours detected: 0	Expected: 1
 [code: contour-count]

</details>
<details>
<summary>⚠ <b>WARN:</b> Does GPOS table have kerning information? This check skips monospaced fonts as defined by post.isFixedPitch value</summary>

* [com.google.fonts/check/gpos_kerning_info](https://font-bakery.readthedocs.io/en/latest/fontbakery/profiles/gpos.html#com.google.fonts/check/gpos_kerning_info)

* ⚠ **WARN** GPOS table lacks kerning information. [code: lacks-kern-info]

</details>
<details>
<summary>⚠ <b>WARN:</b> Do any segments have colinear vectors?</summary>

* [com.google.fonts/check/outline_colinear_vectors](https://font-bakery.readthedocs.io/en/latest/fontbakery/profiles/<Section: Outline Correctness Checks>.html#com.google.fonts/check/outline_colinear_vectors)
<pre>--- Rationale ---
This check looks for consecutive line segments which have the same angle. This
normally happens if an outline point has been added by accident.
This check is not run for variable fonts, as they may legitimately have colinear
vectors.</pre>

* ⚠ **WARN** The following glyphs have colinear vectors:
	* A (U+0041): L<<455.0,660.0>--<549.0,136.0>> -> L<<549.0,136.0>--<563.0,63.0>>
	* Aacute (U+00C1): L<<455.0,660.0>--<549.0,136.0>> -> L<<549.0,136.0>--<563.0,63.0>>
	* Abreve (U+0102): L<<455.0,660.0>--<549.0,136.0>> -> L<<549.0,136.0>--<563.0,63.0>>
	* Acircumflex (U+00C2): L<<455.0,660.0>--<549.0,136.0>> -> L<<549.0,136.0>--<563.0,63.0>>
	* Adieresis (U+00C4): L<<455.0,660.0>--<549.0,136.0>> -> L<<549.0,136.0>--<563.0,63.0>>
	* Agrave (U+00C0): L<<455.0,660.0>--<549.0,136.0>> -> L<<549.0,136.0>--<563.0,63.0>>
	* Amacron (U+0100): L<<455.0,660.0>--<549.0,136.0>> -> L<<549.0,136.0>--<563.0,63.0>>
	* Aogonek (U+0104): L<<455.0,660.0>--<549.0,136.0>> -> L<<549.0,136.0>--<563.0,63.0>>
	* Aring (U+00C5): L<<455.0,660.0>--<549.0,136.0>> -> L<<549.0,136.0>--<563.0,63.0>>
	* Atilde (U+00C3): L<<455.0,660.0>--<549.0,136.0>> -> L<<549.0,136.0>--<563.0,63.0>> and 15 more.

Use -F or --full-lists to disable shortening of long lists. [code: found-colinear-vectors]

</details>
<details>
<summary>⚠ <b>WARN:</b> Do outlines contain any jaggy segments?</summary>

* [com.google.fonts/check/outline_jaggy_segments](https://font-bakery.readthedocs.io/en/latest/fontbakery/profiles/<Section: Outline Correctness Checks>.html#com.google.fonts/check/outline_jaggy_segments)
<pre>--- Rationale ---
This check heuristically detects outline segments which form a particularly
small angle, indicative of an outline error. This may cause false positives in
cases such as extreme ink traps, so should be regarded as advisory and backed up
by manual inspection.</pre>

* ⚠ **WARN** The following glyphs have jaggy segments:
	* r (U+0072): B<<221.5,290.0>-<218.0,274.0>-<217.0,271.0>>/B<<217.0,271.0>-<236.0,313.0>-<262.5,352.5>> = 5.906141113770435
	* racute (U+0155): B<<221.5,290.0>-<218.0,274.0>-<217.0,271.0>>/B<<217.0,271.0>-<236.0,313.0>-<262.5,352.5>> = 5.906141113770435
	* rcaron (U+0159): B<<221.5,290.0>-<218.0,274.0>-<217.0,271.0>>/B<<217.0,271.0>-<236.0,313.0>-<262.5,352.5>> = 5.906141113770435
	* uni00B5 (U+00B5): B<<119.0,43.5>-<116.0,64.0>-<116.0,76.0>>/B<<116.0,76.0>-<109.0,39.0>-<103.5,13.0>> = 10.713123022791033
	* uni0157 (U+0157): B<<221.5,290.0>-<218.0,274.0>-<217.0,271.0>>/B<<217.0,271.0>-<236.0,313.0>-<262.5,352.5>> = 5.906141113770435
	* uni03BC (U+03BC): B<<119.0,43.5>-<116.0,64.0>-<116.0,76.0>>/B<<116.0,76.0>-<109.0,39.0>-<103.5,13.0>> = 10.713123022791033
	* uni2619 (U+2619): B<<585.0,323.0>-<585.0,298.0>-<560.0,267.0>>/B<<560.0,267.0>-<616.0,320.0>-<678.0,323.0>> = 7.6920536214691255 and uni2767 (U+2767): B<<316.0,323.0>-<378.0,320.0>-<434.0,267.0>>/B<<434.0,267.0>-<409.0,298.0>-<409.0,323.0>> = 7.6920536214691255 [code: found-jaggy-segments]

</details>
<details>
<summary>ℹ <b>INFO:</b> Show hinting filesize impact.</summary>

* [com.google.fonts/check/hinting_impact](https://font-bakery.readthedocs.io/en/latest/fontbakery/profiles/googlefonts.html#com.google.fonts/check/hinting_impact)
<pre>--- Rationale ---
This check is merely informative, displaying and useful comparison of filesizes
of hinted versus unhinted font files.</pre>

* ℹ **INFO** Hinting filesize impact:

 |               | CrimsonText-SemiBoldItalic.ttf          |
 |:------------- | ---------------:|
 | Dehinted Size | 58.0kb |
 | Hinted Size   | 58.0kb   |
 | Increase      | -24 bytes      |
 | Change        | -0.0 %  |
 [code: size-impact]

</details>
<details>
<summary>ℹ <b>INFO:</b> Font has old ttfautohint applied?</summary>

* [com.google.fonts/check/old_ttfautohint](https://font-bakery.readthedocs.io/en/latest/fontbakery/profiles/googlefonts.html#com.google.fonts/check/old_ttfautohint)
<pre>--- Rationale ---
Check if font has been hinted with an outdated version of ttfautohint.</pre>

* ℹ **INFO** Could not detect which version of ttfautohint was used in this font. It is typically specified as a comment in the font version entries of the 'name' table. Such font version strings are currently: ['Version 1.000'] [code: version-not-detected]

</details>
<details>
<summary>ℹ <b>INFO:</b> EPAR table present in font?</summary>

* [com.google.fonts/check/epar](https://font-bakery.readthedocs.io/en/latest/fontbakery/profiles/googlefonts.html#com.google.fonts/check/epar)
<pre>--- Rationale ---
The EPAR table is/was a way of expressing common licensing permissions and
restrictions in metadata; while almost nothing supported it, Dave Crossland
wonders that adding it to everything in Google Fonts could help make it more
popular.
More info is available at:
https://davelab6.github.io/epar/</pre>

* ℹ **INFO** EPAR table not present in font. To learn more see https://github.com/googlefonts/fontbakery/issues/818 [code: lacks-EPAR]

</details>
<details>
<summary>ℹ <b>INFO:</b> Familyname must be unique according to namecheck.fontdata.com</summary>

* [com.google.fonts/check/fontdata_namecheck](https://font-bakery.readthedocs.io/en/latest/fontbakery/profiles/googlefonts.html#com.google.fonts/check/fontdata_namecheck)
<pre>--- Rationale ---
We need to check names are not already used, and today the best place to check
that is http://namecheck.fontdata.com</pre>

* ℹ **INFO** The family name "CrimsonText" seems to be already in use.
Please visit http://namecheck.fontdata.com for more info. [code: name-collision]

</details>
<details>
<summary>ℹ <b>INFO:</b> Check for font-v versioning.</summary>

* [com.google.fonts/check/fontv](https://font-bakery.readthedocs.io/en/latest/fontbakery/profiles/googlefonts.html#com.google.fonts/check/fontv)
<pre>--- Rationale ---
The git sha1 tagging and dev/release features of Source Foundry `font-v` tool
are awesome and we would love to consider upstreaming the approach into fontmake
someday. For now we only emit a WARN if a given font does not yet follow the
experimental versioning style, but at some point we may start enforcing it.</pre>

* ℹ **INFO** Version string is: "Version 1.000"
The version string must ideally include a git commit hash and either a "dev" or a "release" suffix such as in the example below:
"Version 1.3; git-0d08353-release" [code: bad-format]

</details>
<details>
<summary>ℹ <b>INFO:</b> Font contains all required tables?</summary>

* [com.google.fonts/check/required_tables](https://font-bakery.readthedocs.io/en/latest/fontbakery/profiles/universal.html#com.google.fonts/check/required_tables)
<pre>--- Rationale ---
Depending on the typeface and coverage of a font, certain tables are recommended
for optimum quality. For example, the performance of a non-linear font is
improved if the VDMX, LTSH, and hdmx tables are present. Non-monospaced Latin
fonts should have a kern table. A gasp table is necessary if a designer wants to
influence the sizes at which grayscaling is used under Windows. Etc.</pre>

* ℹ **INFO** This font contains the following optional tables:
	- loca
	- GPOS 
	- And GSUB [code: optional-tables]

</details>
<details>
<summary>ℹ <b>INFO:</b> List all superfamily filepaths</summary>

* [com.google.fonts/check/superfamily/list](https://font-bakery.readthedocs.io/en/latest/fontbakery/profiles/universal.html#com.google.fonts/check/superfamily/list)
<pre>--- Rationale ---
This is a merely informative check that lists all sibling families detected by
fontbakery.
Only the fontfiles in these directories will be considered in superfamily-level
checks.</pre>

* ℹ **INFO** . [code: family-path]

</details>
<br>
</details>

### Summary

| 💔 ERROR | 🔥 FAIL | ⚠ WARN | 💤 SKIP | ℹ INFO | 🍞 PASS | 🔎 DEBUG |
|:-----:|:----:|:----:|:----:|:----:|:----:|:----:|
| 0 | 39 | 45 | 632 | 43 | 493 | 0 |
| 0% | 3% | 4% | 50% | 3% | 39% | 0% |

**Note:** The following loglevels were omitted in this report:
* **SKIP**
* **PASS**
* **DEBUG**
