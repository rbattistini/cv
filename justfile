export TYPST_FONT_PATHS := "./fonts/"

COMMON_INPUTS := "--input location_url='https://www.google.com/maps/place/Cesena,+Province+of+Forl%C3%AC-Cesena/@44.1492555,12.2212642,13z/data=!3m1!4b1!4m6!3m5!1s0x132ca4d41ed493c1:0xbee0ab1075577a47!8m2!3d44.1396438!4d12.2464292!16zL20vMDE5M3Iw?entry=ttu&g_ep=EgoyMDI1MDcyMy4wIKXMDSoASAFQAw%3D%3D' --input email='riccardo.battistini@protonmail.com'"

build:
    typst compile cv_it.typ cv_it.pdf {{COMMON_INPUTS}} --input location="Italia, Cesena FC 47521"  --input age="26 anni"
    typst compile cv_en.typ cv_en.pdf {{COMMON_INPUTS}} --input location="Italy, Cesena FC 47521"  --input age="26 years old"

sync:
    git add -A
    git commit -m "Sync {{`date +'%Y-%m-%d %H:%M:%S'`}}"

tag VERSION:
    TIMESTAMP=$(date +'%Y-%m-%dT%H%M%S') && git tag "{{VERSION}}-${TIMESTAMP}"

push VERSION:
    just sync
    just tag {{VERSION}}
    git push
    git push --tags
