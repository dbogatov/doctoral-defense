# Oral Exam

- Intro / motivation
- Background
  - crypto topics
  - obliviousness and ORAM
  - privacy: $`k`$-anonymity, $`l`$-diversity, $`t`$-closeness and differential privacy
  - enclaves and SGX
- Model
  - data leakage (from non-symmetric encryption) + attacks
	- OPE/ORE + my work
  - access pattern leakage + attacks
  - communication volume leakage + attacks
  - teaser: DPODB
- Work in the Area
  - property-preserving encryption
    - CryptDB
    - Arx
    - PPQED
    - SisoSPIR
  - access pattern and/or communication volume
    - Foundations of Differentially Oblivious Algorithms
    - $`\text{Crypt}\epsilon`$
    - Shrinkwrap (mention SMCQL)
    - PINED-RQ
  - SGX
    - Cipherbase
    - Oblix
    - ObliDB
    - Opaque
    - HybrIDX
    - HardIDX
    - EnclaveDB
    - StealthDB
    - Hermetic
- $`\mathcal{E}\text{psolute}`$
  - model and definition
  - single-threaded algorithm
  - extending to parallel
  - performance
- conclusion

## How to compile

```bash
./document/build.sh # to compile without notes
./document/build.sh -n # to compile with notes
open ./document/dist/*.pdf # to open
```
