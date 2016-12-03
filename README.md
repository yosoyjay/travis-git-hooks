# Travis CI build badge Git pre-commit hook

This pre-commit hook updates Travis CI build badge details to eliminate manually updating branch details in README.md files.

Account details are derived from `git remote origin`.

## Install
```bash
$ cp update_travis_badge_precommit.sh path/to/git/repo/.git/hooks
$ cd path/to/git/repo/.git/hooks
$ ln -s update_travis_badge_precommit.sh pre-commit
```
