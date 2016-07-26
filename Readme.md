# About

This repository contains difference between Truecrypt 7.1a and Veracrypt 1.17. I hope that this will help someone with auditing the latter, since the former has already been audited.

The first and the only commit to this repository **MUST** be signed with the GPG key whose fingerprint is `C81023ACF05791E75AE5B5647113FBBA4DCCA583`. You can verify that with `git log --show-signature`.

# What exactly has been compared

```
$ sha1sum "TrueCrypt 7.1a Source.tar.gz" "veracrypt_1.17_Source.tar.bz2"
d43e0dbe05c04e316447d87413c4f74c68f5de24  TrueCrypt 7.1a Source.tar.gz
cd27cf9b6853aac104a33fac0f1d8733765042ba  veracrypt_1.17_Source.tar.bz2

$ sha256sum "TrueCrypt 7.1a Source.tar.gz" "veracrypt_1.17_Source.tar.bz2"
e6214e911d0bbededba274a2f8f8d7b3f6f6951e20f1c3a598fc7a23af81c8dc  TrueCrypt 7.1a Source.tar.gz
e3527c6b3d0c9aa148e4761e009f80b32f72cc22bec1178760a842cbcc15a1e4  veracrypt_1.17_Source.tar.bz2
```

Whole contents of the former have been compared against the `src/` directory of the latter.

# How to replicate

Download `TrueCrypt 7.1a Source.tar.gz` and `veracrypt_1.17_Source.tar.bz2`. Verify checksums. Unpack the former in the current directory. Create a `veracrypt_1.17_Source` directory in the current directory, and unpack the latter into that directory. Put `script.sh` from the repository into the current directory. `cd` into TC's directory and run the following:

```
find . -type f -exec ../script.sh {} \;\
find ../diff -type f -size 0 -print0 | xargs -0 rm
```

To find out which files are unique to one of the programs you can use these:

```
diff -rq ./ ../veracrypt_1.17_Source/src/ | grep 'Only in ./' > "truecrypt.txt"
diff -rq ./ ../veracrypt_1.17_Source/src/ | grep 'Only in ../veracrypt_1.17_Source/src/
```

