#!/usr/bin/bash

git add .
git commit -m "Tag, push, upload to PyPI"
git push
VERSION=$(grep "version=" setup.py | grep -P "[\'\"].*[\'\"]" -o | grep -P "[^\'\"]*" -o) &&
git tag v$VERSION &&
git push origin v$VERSION &&
python3 setup.py sdist &&
python3 -m twine upload dist/* &&
rm -rf dist &&
rm -rf $(ls | grep ".*\.egg-info")



