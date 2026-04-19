#!/usr/bin/env bash
# Verificaciones automáticas — Pizza Front (Flexbox).
set -u

HTML="index.html"
CSS="css/style_base.css"

fail() {
  echo "$1" >&2
  exit 1
}

ok() {
  echo CORRECTO
}

run_python() {
  if command -v python3 >/dev/null 2>&1; then
    python3 "$@"
  elif command -v python >/dev/null 2>&1; then
    python "$@"
  else
    fail "Se necesita Python 3 (comando python3 o python) para las pruebas de Flexbox."
  fi
}

clean_css() {
  perl -0777 -pe 's@/\*.*?\*/@@gs' "$CSS"
}

case "${1:-}" in
  base-structure)
    [[ -f "$HTML" ]] || fail "No se encontró index.html en la raíz del proyecto."
    [[ -d "css" ]] || fail "No se encontró la carpeta css/ en la raíz del proyecto."
    [[ -d "img" ]] || fail "No se encontró la carpeta img/ en la raíz del proyecto."
    ok
    ;;
  css-linked)
    [[ -f "$HTML" ]] || fail "No existe index.html."
    [[ -f "$CSS" ]] || fail "No existe el archivo css/style_base.css."
    grep -qiE '<link[^>]+href=["'\''][^"'\'']*css/style_base\.css[^"'\'']*["'\'']' "$HTML" \
      || fail "Falta enlazar correctamente css/style_base.css con la etiqueta <link>."
    ok
    ;;
  semantic-html)
    [[ -f "$HTML" ]] || fail "No existe index.html."
    grep -qi '<header' "$HTML" || fail "Falta utilizar la etiqueta <header> en la plantilla."
    grep -qi '<section' "$HTML" || fail "Falta utilizar al menos una vez la etiqueta <section> en la plantilla."
    grep -qi '<footer' "$HTML" || fail "Falta utilizar la etiqueta <footer> en la plantilla."
    ok
    ;;
  flexbox-header)
    [[ -f "$CSS" ]] || fail "No existe css/style_base.css."
    run_python - "$CSS" <<'PY' || exit 1
import re, sys
path = sys.argv[1]
text = open(path, encoding="utf-8", errors="replace").read()
text = re.sub(r"/\*.*?\*/", "", text, flags=re.S)

def balanced_block(s: str, open_brace: int) -> str:
    if open_brace < 0 or open_brace >= len(s) or s[open_brace] != "{":
        return ""
    depth = 0
    for i in range(open_brace, len(s)):
        if s[i] == "{":
            depth += 1
        elif s[i] == "}":
            depth -= 1
            if depth == 0:
                return s[open_brace : i + 1]
    return ""

def block_for_selector(css: str, pattern: str) -> str:
    m = re.search(pattern, css, flags=re.I)
    if not m:
        return ""
    brace = css.find("{", m.start())
    return balanced_block(css, brace)

def has_flex(block: str) -> bool:
    return bool(re.search(r"display\s*:\s*(?:inline-)?flex\b", block, flags=re.I))

required = [
    (r"header\s*\{", "header"),
    (r"header\s+nav\s+ul\s*\{", "header nav ul"),
    (r"header\s+\.header__logo\s*\{", "header .header__logo"),
]
missing = []
for pat, label in required:
    blk = block_for_selector(text, pat)
    if not blk:
        missing.append(f"{label}: no se encontró la regla esperada")
    elif not has_flex(blk):
        missing.append(f"{label}: falta display:flex (o inline-flex)")

if missing:
    print("En el encabezado, aplicá Flexbox donde indica la consigna:\n- " + "\n- ".join(missing), file=sys.stderr)
    sys.exit(1)
print("CORRECTO")
PY
    ;;
  flexbox-main)
    [[ -f "$CSS" ]] || fail "No existe css/style_base.css."
    run_python - "$CSS" <<'PY' || exit 1
import re, sys
path = sys.argv[1]
text = open(path, encoding="utf-8", errors="replace").read()
text = re.sub(r"/\*.*?\*/", "", text, flags=re.S)

def balanced_block(s: str, open_brace: int) -> str:
    if open_brace < 0 or open_brace >= len(s) or s[open_brace] != "{":
        return ""
    depth = 0
    for i in range(open_brace, len(s)):
        if s[i] == "{":
            depth += 1
        elif s[i] == "}":
            depth -= 1
            if depth == 0:
                return s[open_brace : i + 1]
    return ""

def block_for_selector(css: str, pattern: str) -> str:
    m = re.search(pattern, css, flags=re.I)
    if not m:
        return ""
    brace = css.find("{", m.start())
    return balanced_block(css, brace)

def has_flex(block: str) -> bool:
    return bool(re.search(r"display\s*:\s*(?:inline-)?flex\b", block, flags=re.I))

required = [
    (r"main\s+\.container\s*\{", "main .container"),
    (r"main\s+section\s+\.podio\s*\{", "main section .podio"),
    (r"\.top5\s*\{", ".top5"),
    (r"\.top5\s+\.podio__img\s*\{", ".top5 .podio__img"),
]
missing = []
for pat, label in required:
    blk = block_for_selector(text, pat)
    if not blk:
        missing.append(f"{label}: no se encontró la regla esperada")
    elif not has_flex(blk):
        missing.append(f"{label}: falta display:flex (o inline-flex)")

if missing:
    print("En el contenido principal, aplicá Flexbox donde indica la consigna:\n- " + "\n- ".join(missing), file=sys.stderr)
    sys.exit(1)
print("CORRECTO")
PY
    ;;
  flexbox-footer)
    [[ -f "$CSS" ]] || fail "No existe css/style_base.css."
    run_python - "$CSS" <<'PY' || exit 1
import re, sys
path = sys.argv[1]
text = open(path, encoding="utf-8", errors="replace").read()
text = re.sub(r"/\*.*?\*/", "", text, flags=re.S)

def balanced_block(s: str, open_brace: int) -> str:
    if open_brace < 0 or open_brace >= len(s) or s[open_brace] != "{":
        return ""
    depth = 0
    for i in range(open_brace, len(s)):
        if s[i] == "{":
            depth += 1
        elif s[i] == "}":
            depth -= 1
            if depth == 0:
                return s[open_brace : i + 1]
    return ""

def block_for_selector(css: str, pattern: str) -> str:
    m = re.search(pattern, css, flags=re.I)
    if not m:
        return ""
    brace = css.find("{", m.start())
    return balanced_block(css, brace)

def has_flex(block: str) -> bool:
    return bool(re.search(r"display\s*:\s*(?:inline-)?flex\b", block, flags=re.I))

required = [
    (r"footer\s*\{", "footer"),
    (r"footer\s+\.footer__logo\s*\{", "footer .footer__logo"),
    (r"footer\s+ul\s*\{", "footer ul"),
]
missing = []
for pat, label in required:
    blk = block_for_selector(text, pat)
    if not blk:
        missing.append(f"{label}: no se encontró la regla esperada")
    elif not has_flex(blk):
        missing.append(f"{label}: falta display:flex (o inline-flex)")

if missing:
    print("En el pie, aplicá Flexbox donde indica la consigna:\n- " + "\n- ".join(missing), file=sys.stderr)
    sys.exit(1)
print("CORRECTO")
PY
    ;;
  all)
    for sub in base-structure css-linked semantic-html flexbox-header flexbox-main flexbox-footer; do
      bash "$0" "$sub" || exit 1
    done
    ok
    ;;
  *)
    echo "Prueba automática no reconocida. Avísale al docente." >&2
    exit 2
    ;;
esac
