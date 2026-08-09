#!/usr/bin/env python3

import os, sys, subprocess, tempfile, fontforge
from fontTools.ttLib import TTFont

src = os.environ["src"]
out = os.environ["out"]

SCALE = 16

ft         = TTFont(f"{src}/gallant.ttf")
cmap       = ft["cmap"].getBestCmap()
ebdt       = ft["EBDT"]
eblc       = ft["EBLC"]
strike     = eblc.strikes[0]
ppem       = strike.bitmapSizeTable.ppemX
strikeData = ebdt.strikeData[0]

idxMetrics = {}
for sub in strike.indexSubTables:
    if hasattr(sub, "metrics"):
        for gi in range(sub.firstGlyphIndex, sub.lastGlyphIndex + 1):
            idxMetrics[gi] = sub.metrics

def get_metrics(gname, gdata):
    m = getattr(gdata, "metrics", None)
    if m is not None:
        return m.width, m.height, m.BearingX, m.BearingY, m.Advance
    gi = ft.getGlyphID(gname)
    if gi not in idxMetrics:
        return None
    m = idxMetrics[gi]
    return m.width, m.height, m.horiBearingX, m.horiBearingY, m.horiAdvance

def to_pbm(raw, w, h):
    bits      = "".join(f"{b:08b}" for b in raw)
    row_bytes = (w + 7) // 8
    header    = f"P4\n{w} {h}\n".encode()
    body      = bytearray()
    for row in range(h):
        for bi in range(row_bytes):
            val = 0
            for bit_i in range(8):
                pi = bi * 8 + bit_i
                if pi < w and bits[row * w + pi] == "1":
                    val |= 1 << (7 - bit_i)
            body.append(val)
    return header + bytes(body)

def trace(raw, w, h, svg_out):
    if not any(raw):
        return False
    with tempfile.TemporaryDirectory() as tmp:
        pbm = os.path.join(tmp, "g.pbm")
        big = os.path.join(tmp, "g_big.pbm")
        with open(pbm, "wb") as f:
            f.write(to_pbm(raw, w, h))
        subprocess.run(
            ["convert", pbm, "-scale", f"{w*SCALE}x{h*SCALE}!",
             "-threshold", "50%", big],
            check=True, capture_output=True,
        )
        r = subprocess.run(
            ["potrace", "-s", "-a", "0", "-o", svg_out, big],
            capture_output=True,
        )
    return r.returncode == 0 and os.path.getsize(svg_out) > 0

font = fontforge.open(f"{src}/gallant.ttf")
font.encoding = "UnicodeFull"
em = font.em

processed = skipped = errors = 0
cp_map = {cp: gn for cp, gn in cmap.items() if gn in strikeData}

with tempfile.TemporaryDirectory() as svgdir:
    for cp, gname in sorted(cp_map.items()):
        result = get_metrics(gname, strikeData[gname])
        if result is None:
            skipped += 1
            continue
        w, h, bx, by, adv = result
        try:
            raw      = strikeData[gname].imageData
            svg_path = os.path.join(svgdir, f"{cp}.svg")
            has_svg  = trace(raw, w, h, svg_path)
            g = font[cp] if cp in font else font.createChar(cp)
            g.clear()
            if has_svg:
                g.importOutlines(svg_path)
            g.width = round(adv / ppem * em)
            processed += 1
        except Exception as e:
            errors += 1
            print(f"  error U+{cp:04X} {gname}: {e}", file=sys.stderr)

print(f"gallant-trace: processed={processed} skipped={skipped} errors={errors}",
      file=sys.stderr)

font.bitmapSizes = ()
font.fontname    = "Gallant"
font.familyname  = "Gallant"
font.fullname    = "Gallant"

os.makedirs(f"{out}/share/fonts/truetype", exist_ok=True)
font.generate(f"{out}/share/fonts/truetype/gallant.ttf")
font.close()
ft.close()
