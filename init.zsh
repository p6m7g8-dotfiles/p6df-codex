# shellcheck shell=bash
######################################################################
#<
#
# Function: p6df::modules::codex::deps()
#
#>
######################################################################
p6df::modules::codex::deps() {
  ModuleDeps=(
    p6m7g8-dotfiles/p6df-openai
  )
}

######################################################################
#<
#
# Function: p6df::modules::codex::aliases::init(_module, _dir)
#
#  Args:
#	_module -
#	_dir -
#
#>
######################################################################
p6df::modules::codex::aliases::init() {

  local _module="$1"
  local _dir="$2"
  p6_alias "co"    "codex"
  p6_alias "coa"   "codex ask"
  p6_alias "coc"   "codex chat"
  p6_alias "cocfg" "codex config"
  p6_alias "coE"   "codex exec"
  p6_alias "coF"   "codex fix"
  p6_alias "corev" "codex review"
  p6_alias "coT"   "codex test"
  p6_alias "cor"   "codex resume"

  p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::codex::home::symlinks()
#
#  Environment:	 HOME P6_DFZ_SRC_P6M7G8_DOTFILES_DIR
#>
######################################################################
p6df::modules::codex::home::symlinks() {

  p6_file_symlink "$P6_DFZ_SRC_P6M7G8_DOTFILES_DIR/p6df-codex/share/codex" "$HOME/.codex"

  p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::codex::external::brews()
#
#>
######################################################################
p6df::modules::codex::external::brews() {

  p6df::core::homebrew::cli::brew::install --cask codex
  p6df::core::homebrew::cli::brew::install --cask codex-app

  p6_return_void
}

######################################################################
#<
#
# Function: words codex = p6df::modules::codex::profile::mod()
#
#  Returns:
#	words - codex
#
#  Environment:	 CODEX_HOME
#>
######################################################################
p6df::modules::codex::profile::mod() {

  p6_return_words 'codex' '$CODEX_HOME'
}

