#
# Defines Git aliases.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

#
# Settings
#
#

# Log
zstyle -s ':prezto:module:git:log:medium' format '_git_log_medium_format' \
  || _git_log_medium_format='%C(bold)Commit:%C(reset) %C(green)%H%C(red)%d%n%C(bold)Author:%C(reset) %C(cyan)%an <%ae>%n%C(bold)Date:%C(reset)   %C(blue)%ai (%ar)%C(reset)%n%+B'
zstyle -s ':prezto:module:git:log:oneline' format '_git_log_oneline_format' \
  || _git_log_oneline_format='%C(green)%h%C(reset) %s%C(red)%d%C(reset)%n'
zstyle -s ':prezto:module:git:log:brief' format '_git_log_brief_format' \
  || _git_log_brief_format='%C(green)%h%C(reset) %s%n%C(blue)(%ar by %an)%C(red)%d%C(reset)%n'

# Status
zstyle -s ':prezto:module:git:status:ignore' submodules '_git_status_ignore_submodules' \
  || _git_status_ignore_submodules='none'

#
# Aliases
#

if ! zstyle -t ':prezto:module:git:alias' skip 'yes'; then
    # Git
  alias g='git'

  # Branch (b)
  alias gb='git branch'

  # Commit (c)
  alias gcm='git commit --message'
  alias gra='git commit --amend --no-edit --reset-author'
  alias gco='git checkout'
  alias wip="git add -A && git commit -m'WIP'"
  alias unwip='git reset HEAD~'
  alias main='git checkout main'

  # Fetch (f)
  alias gpr='git pull --rebase'

  # Index (i)
  alias ga='git add'
  alias gap='git add -p'

  # Log (l)
  alias gl='git lg'

  # Push (p)
  alias gpsupf="git push --set-upstream origin $(current_branch) --force-with-lease"

  # Rebase (r)
  alias gra='git rebase --abort'
  alias grc='git rebase --continue'
  alias gri='git rebase --interactive'

  # Tag (t)
  alias gt='git tag'
  alias gtl='git tag --list'

  # Working Copy (w)
  alias gs='git status'
fi
