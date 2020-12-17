all: creation partage adaptation adaptation-thread adaptation-detach
all: compteurs compteurs-sem
all: Synch.class interblocage relai producteur-consommateur

creation: creation.c
	gcc -Wall -Wextra -g creation.c -o creation -pthread

partage: partage.c
	gcc -Wall -Wextra -g partage.c -o partage -pthread

adaptation: adaptation.c
	gcc -Wall -Wextra -g adaptation.c -o adaptation

adaptation-thread: adaptation-thread.c
	gcc -Wall -Wextra -g adaptation-thread.c -o adaptation-thread -pthread

adaptation-detach: adaptation-detach.c
	gcc -Wall -Wextra -g adaptation-detach.c -o adaptation-detach -pthread

compteurs: compteurs.c
	gcc -Wall -Wextra -g compteurs.c -o compteurs -pthread

compteurs-sem: compteurs-sem.c
	gcc -Wall -Wextra -g compteurs-sem.c -o compteurs-sem -pthread

Synch.class: Synch.java
	javac -Xlint:all Synch.java

interblocage: interblocage.c
	gcc -Wall -Wextra -g interblocage.c -o interblocage -pthread

relai: relai.c
	gcc -Wall -Wextra -g relai.c -o relai -pthread

producteur-consommateur: producteur-consommateur.c
	gcc -Wall -Wextra -g producteur-consommateur.c -o producteur-consommateur -pthread

.PHONY: all
