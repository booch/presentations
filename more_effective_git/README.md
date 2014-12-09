Using Git More Effectively
==========================

by Craig Buchek

STL Ruby

December 8, 2014

@CraigBuchek


Feature Branches
----------------

- Use a branch for everything
- Rebase from `master` before merging back to `master`
- Merge back to master with either `--ff` or `--no-ff`


Commit Messages
---------------

- Don't use `-m`
- First line is a summary
  - Think of it as an email subject line
  - Keep it to about 50 characters or less
  - Consider prefixing with name of module affected
- Rest of the message should explain in more detail what you did
  - More importantly, *why* did you do it?
- Use "fix" tense instead of "fixed" or "fixes"
  - Shorter
  - Matches git-created "merge" and "revert" messages


Add -p
------

- Always use `-p` when adding
  - Ensures you see exactly what you're committing
- Keeps commits smaller
  - Makes changes more self-contained
    - Easier to see what the commit is _about_
  - Makes reverting easier


Aliases
-------

- I have a ton of aliases I've collected
- `git unstage`
- `git uncommit`
- `git staged`
- `git lg`
- `git amend`


References
----------

- https://github.com/booch/presentations

- https://github.com/booch/config_files/blob/master/gitconfig

- http://tbaggery.com/2008/04/19/a-note-about-git-commit-messages.html

- http://robots.thoughtbot.com/5-useful-tips-for-a-better-commit-message
