tous: exit fork partage-var partage-fic exec-ls echo-redir

%: %.c
	gcc -Wall -Wextra $< -o $@

partage-fic: chiffres

chiffres:
	seq -s '' 0 9 > chiffres
