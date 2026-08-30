if status is-interactive
# Commands to run in interactive sessions can go here
	set -g fish_key_bindings fish_vi_key_bindings

	abbr -a n nvim
	abbr -a ls lsd
	abbr -a ll lsd -la

	abbr -a nrbd sudo darwin-rebuild switch --flake .#Astors-MacBook-Air
	abbr -a nud sudo nix flake update
	# fish_add_path 

	starship init fish | source
end
