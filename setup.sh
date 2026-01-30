#! /bin/sh

DOTFILES_DIR="$HOME/.dotfiles"
BACKUP_DIR="$HOME/.dotfiles_backup/$(date +%Y%m%d_%H%M%S)"

echo "Using $DOTFILES_DIR as source..."
echo "Using $BACKUP_DIR for backup..."

if [ -d "$BACKUP_DIR" ]; then
    echo "Backup Directory exists..."
else
    echo "Backup Directory does not exist... Creating..."
    mkdir -p "$BACKUP_DIR"
fi

link_file () {
  local src="$1"
  local dest="$2"

  if [ -e "$dest" ] || [ -L "$dest" ]; then
    echo "Backing up $dest to $BACKUP_DIR"
    mv "$dest" "$BACKUP_DIR/"
  fi

  echo "Linking $src -> $dest"
  ln -s "$src" "$dest"
}

# ---------- Files ----------
link_file "$DOTFILES_DIR/.gitconfig"       "$HOME/.gitconfig"
link_file "$DOTFILES_DIR/.vimrc"           "$HOME/.vimrc"
link_file "$DOTFILES_DIR/.xinitrc"         "$HOME/.xinitrc"
link_file "$DOTFILES_DIR/.Xresources"      "$HOME/.Xresources"
link_file "$DOTFILES_DIR/.zshenv"          "$HOME/.zshenv"

# ---------- Directories ----------
mkdir -p "$HOME/.config/alacritty"
mkdir -p "$HOME/.config/dunst"
mkdir -p "$HOME/.config/i3"
mkdir -p "$HOME/.config/tmux"
mkdir -p "$HOME/.config/polybar/modules"
mkdir -p "$HOME/.vim/after/ftplugin"

link_file "$DOTFILES_DIR/configs/alacritty/alacritty.toml"          "$HOME/.config/alacritty/alacritty.toml"
link_file "$DOTFILES_DIR/configs/dunst/dunstrc"                     "$HOME/.config/dunst/dunstrc"
link_file "$DOTFILES_DIR/configs/i3/config"                         "$HOME/.config/i3/config"
link_file "$DOTFILES_DIR/configs/polybar/config"                    "$HOME/.config/polybar/config"
link_file "$DOTFILES_DIR/configs/polybar/launch.sh"                 "$HOME/.config/polybar/launch.sh"
link_file "$DOTFILES_DIR/configs/polybar/modules/pynet"             "$HOME/.config/polybar/modules/pynet"
link_file "$DOTFILES_DIR/configs/polybar/modules/testmod"           "$HOME/.config/polybar/modules/testmod"
link_file "$DOTFILES_DIR/configs/zsh/.zprofile"                     "$HOME/.config/zsh/.zprofile"
link_file "$DOTFILES_DIR/configs/zsh/.zshrc"                        "$HOME/.config/zsh/.zshrc"
link_file "$DOTFILES_DIR/tmux/tmux.conf"                            "$HOME/.config/tmux/tmux.conf"
link_file "$DOTFILES_DIR/.vim/after/ftplugin/ruby.vim"              "$HOME/.config/.vim/after/ftplugin/ruby.vim"
link_file "$DOTFILES_DIR/.vim/after/ftplugin/python.vim"            "$HOME/.config/.vim/after/ftplugin/python.vim"
link_file "$DOTFILES_DIR/.vim/after/ftplugin/javascript.vim"        "$HOME/.config/.vim/after/ftplugin/javascript.vim"
link_file "$DOTFILES_DIR/.vim/after/ftplugin/javascriptreact.vim"   "$HOME/.config/.vim/after/ftplugin/javascriptreact.vim"
link_file "$DOTFILES_DIR/.vim/after/ftplugin/typescript.vim"        "$HOME/.config/.vim/after/ftplugin/typescript.vim"
link_file "$DOTFILES_DIR/.vim/after/ftplugin/typescriptreact.vim"   "$HOME/.config/.vim/after/ftplugin/typescriptreact.vim"

echo "Dotfiles linked successfully"
echo "Backups stored in: $BACKUP_DIR"
