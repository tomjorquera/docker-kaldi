# Ubuntu + Kaldi Dockefile

This repository contains a **Dockerfile** for installing Kaldi from the [upstream](https://github.com/kaldi-asr/kaldi) on a [Ubuntu](http://www.ubuntu.com/)-based container.

For convenience, the following environment variables are set:
- `KALDI_BASE` points to the root folder of the Kaldi install
- `KALDI_BIN` points to the binaries folder of the Kaldi install (aka `src/bin`)

## Kaldi + extra

The `extra` folder contains an additional Dockerfile which build upon the the main Kaldi image to install the utilities in the `kaldi/tools/extras/` folder (with the exception of `atlas`, `beamformit`, `openblas` and `srilm`), as well as some additional utilities.

### Additinal language model tools:
- [KenLM](http://kheafield.com/code/kenlm/)
- [MITLM](https://github.com/mitlm/mitlm)

For convenience, the following environment variables are set:
- `KENLM_BASE` points to the root folder of the KenLM install
- `KENLM_BIN` points to the folder containing the binaries of the KenLM install
- `MITLM_BASE` points to the root folder of the MITLM install
- `MITLM_BIN` points to the folder containing the binaries of the MITLM install


### Additional utilities:
- [sox](http://sox.sourceforge.net/)
- [flac](https://xiph.org/flac/)
- [graphviz](http://graphviz.org/)
- [num2words](https://github.com/savoirfairelinux/num2words)
