# Third-party runtimes bundled in Etabli Atelier

All runtimes below are open-source and redistributed under their own licenses.
This file is the provenance record F-Droid's reviewer will check against the
`assets/runtimes` directory referenced by `scanignore` in `.fdroid.yml`.

| Component | Upstream source | License | Pinned version |
|-----------|-----------------|---------|----------------|
| WebR | https://github.com/r-wasm/webr | Apache-2.0 / MIT (see upstream) | (pin version) |
| Pyodide | https://github.com/pyodide/pyodide | MPL-2.0 (see upstream) | (pin version) |
| numpy/pandas/scipy/matplotlib/scikit-learn | via Pyodide | BSD-family | (pin) |

> ACTION: replace each "(pin ...)" with the exact version and the exact upstream
> release URL you vendor in `assets/runtimes/`. `tool/fetch_runtimes.sh` must fetch
> from these same URLs so the build is reproducible and the provenance verifiable.
