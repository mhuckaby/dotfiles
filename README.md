# Dotfiles
## Usage

The included script `apply.sh` will do the following 
 
- Backup any existing dotfiles that might be replaced by files in this repository
- Copy dotfiles under from this repository to `~`
- Look for a source call to `.bash_profile_functions` and then add it if it is not found
