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
# Function: p6df::modules::codex::external::brews()
#
#>
######################################################################
p6df::modules::codex::external::brews() {

  p6df::modules::homebrew::cli::brew::install --cask codex
  p6df::modules::homebrew::cli::brew::install --cask codex-app

  p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::codex::home::symlink()
#
#  Environment:	 P6_DFZ_SRC_P6M7G8_DOTFILES_DIR
#>
######################################################################
p6df::modules::codex::home::symlink() {

  p6_file_symlink "$P6_DFZ_SRC_P6M7G8_DOTFILES_DIR/p6df-codex/share/codex" "$HOME/.codex"

  p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::codex::aliases::init()
#
#>
######################################################################
p6df::modules::codex::aliases::init() {

  p6_alias cx "codex"
  p6_alias cdxa "codex ask"
  p6_alias cdxc "codex chat"
  p6_alias cdxcfg "codex config"
  p6_alias cdxE "codex exec"
  p6_alias cdxF "codex fix"
  p6_alias cdxr "codex review"
  p6_alias cdxT "codex test"
  p6_alias cxr "codex resume"

  p6_return_void
}

######################################################################
#<
#
# Function: str str = p6df::modules::codex::prompt::mod()
#
#  Returns:
#	str - str
#
#  Environment:	 CODEX_HOME P6_DFZ_PROFILE_CODEX
#>
######################################################################
p6df::modules::codex::prompt::mod() {
  local str=""
  local profile="$P6_DFZ_PROFILE_CODEX"
  local codex_home="$CODEX_HOME"

  if p6_string_blank_NOT "$profile"; then
    str="codex:\t\t  ${profile}:"
    if p6_string_blank_NOT "$codex_home"; then
      str=$(p6_string_append "$str" "$codex_home" " ")
    fi
  fi

  p6_return_str "$str"
}

######################################################################
#<
#
# Function: p6df::modules::codex::profile::on(profile, code)
#
#  Args:
#	profile -
#	code - shell code block (export CODEX_HOME=... CODEX_SQLITE_HOME=... CODEX_CA_CERTIFICATE=...)
#
#  Environment:	 CODEX_CA_CERTIFICATE CODEX_HOME CODEX_SQLITE_HOME P6_DFZ_PROFILE_CODEX
#>
######################################################################
p6df::modules::codex::profile::on() {
  local profile="$1"
  local code="$2"

  p6_run_code "$code"

  p6_env_export "P6_DFZ_PROFILE_CODEX" "$profile"

  p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::codex::profile::off(code)
#
#  Args:
#	code - shell code block previously passed to profile::on
#
#  Environment:	 CODEX_CA_CERTIFICATE CODEX_HOME CODEX_SQLITE_HOME P6_DFZ_PROFILE_CODEX
#>
######################################################################
p6df::modules::codex::profile::off() {
  local code="$1"

  p6_env_unset_from_code "$code"
  p6_env_export_un P6_DFZ_PROFILE_CODEX

  p6_return_void
}
