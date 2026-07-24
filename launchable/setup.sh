#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$(cd -- "${SCRIPT_DIR}/.." && pwd)"
cd "${PROJECT_DIR}"

# Brev lifecycle scripts run under systemd with a smaller PATH than an
# interactive SSH shell. Add common user-local locations before probing.
export PATH="$HOME/.local/bin:$HOME/.cargo/bin:/usr/local/bin:/usr/bin:/bin:$PATH"

python_is_supported() {
  "$1" - <<'PY_VERSION_CHECK' >/dev/null 2>&1
import sys
raise SystemExit(0 if (3, 11) <= sys.version_info[:2] < (3, 14) else 1)
PY_VERSION_CHECK
}

PYTHON_BIN="${PYTHON_BIN:-}"
if [[ -n "${PYTHON_BIN}" ]] && ! python_is_supported "${PYTHON_BIN}"; then
  echo "PYTHON_BIN=${PYTHON_BIN} is not Python >=3.11,<3.14; ignoring it."
  PYTHON_BIN=""
fi

if [[ -z "${PYTHON_BIN}" ]]; then
  for candidate in     python3.12     python3.11     /usr/local/bin/python3.12     /usr/bin/python3.12     /opt/conda/bin/python3.12; do
    if command -v "${candidate}" >/dev/null 2>&1 && python_is_supported "${candidate}"; then
      PYTHON_BIN="$(command -v "${candidate}")"
      break
    elif [[ -x "${candidate}" ]] && python_is_supported "${candidate}"; then
      PYTHON_BIN="${candidate}"
      break
    fi
  done
fi

if [[ -z "${PYTHON_BIN}" ]]; then
  echo "Python >=3.11,<3.14 was not visible to the lifecycle environment. Bootstrapping Python 3.12 with uv."
  if ! command -v uv >/dev/null 2>&1; then
    python3 -m pip install --user uv
    export PATH="$HOME/.local/bin:$PATH"
  fi
  uv python install 3.12
  PYTHON_BIN="$(uv python find 3.12)"
fi

"${PYTHON_BIN}" - <<'PY_VERSION_REPORT'
import sys
if not ((3, 11) <= sys.version_info[:2] < (3, 14)):
    raise SystemExit(
        "This workshop expects Python >=3.11,<3.14. "
        f"Found {sys.version.split()[0]}."
    )
print(f"Using Python {sys.version.split()[0]} at {sys.executable}")
PY_VERSION_REPORT

if command -v uv >/dev/null 2>&1; then
  uv venv .venv --python "${PYTHON_BIN}"
else
  "${PYTHON_BIN}" -m venv .venv
fi
source .venv/bin/activate

python -m pip install --upgrade pip
python -m pip install -r launchable/requirements.txt
python -m ipykernel install --user --name cuopt-workshop --display-name "Python (cuOpt Workshop)"

if [[ "${RUN_SMOKE_TEST:-0}" == "1" ]]; then
  python scripts/smoke_test.py
else
  echo "Skipping automatic smoke test. Run this manually after launch if desired:"
  echo "  source .venv/bin/activate && python scripts/smoke_test.py"
fi

cat <<'MSG'

cuOpt workshop setup complete.

Open JupyterLab, select the "Python (cuOpt Workshop)" kernel, and start with:
  00-Setup-Smoke-Test.ipynb

MSG
