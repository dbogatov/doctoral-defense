# Prospectus Presentation

- Intro / model
  - companies outsourced lots of data
  - challenge to keep it safe and fast
  - different query types, we concentrate on these
  - model: snapshot and persistent
- List of works including Idemix (for each: model, query type, donnees)
  - a note on proposal structure (defense is close, some of the works are done)
  - ORE benchmark / Award
  - $`\mathcal{E}\text{psolute}`$
  - Idemix (only mention)
  - Private kNN
  - Oblivious JOINs
- ORE benchmark
  - model: snapshot, queries: range
  - the problem and solution
  - OPE/ORE table (very brief description of each construction)
  - range protocols table (very brief description of each construction)
  - one plot: "Queries stage number of I/O requests"
- $`\mathcal{E}\text{psolute}`$
  - model: persistent, queries: range
  - security model and definition
  - single-threaded algorithm
  - extending to parallel: choice of gamma / no-gamma and algorithm
  - performance
- Private kNN
  - WIP / half-done, model: snapshot, queries: kNN in arbitrary dimensions
  - Component: DCPE scheme
  - Component: Running similarity search using kNN (TREC and stuff)
  - Core: Running search using DCPE scheme, tuning $`\beta`$, theoretical and practical effect
  - Plot
- Oblivious JOINs
  - WIP / earlier stages, model: persistent, queries: inner JOINs over two tables
  - Algorithm steps / using SGX

## How to compile

```bash
./document/build.sh # to compile without notes
./document/build.sh -n # to compile with notes
open ./document/dist/*.pdf # to open
```
