Steps to make the real book using latex:

1) First copy over the `images` folder from leanpub repo
from `leanpub/manuscript` to `realbook/out`. Make an empty dir
`realbook/out/figure`.

2) Remove the images associated with the title to save space:

`images/1477*`
`images/title_page*`

3) Run these bash scripts:

NOTE: if you are on a Mac, there will be an issue with the `sed -i` in `make_tex.sh`.
If you are on a Mac, use `make_tex_mac.sh` instead.

`make_md_figs.sh`
`make_assess.sh`
`make_tex.sh`
`make_wrapper.sh`

4) Try to build a PDF:

```
cd out
pdflatex wrapper.tex
```

5) Search the PDF file for "## Error"

