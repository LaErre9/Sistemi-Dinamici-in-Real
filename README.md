# Analisi e Simulazioni di alcuni esempi di Sistemi Dinamici applicabili nella realtà
La seguente trattazione è mirata nella analisi, simulazione e approfondimenti di programmi che
gentilmente i Prof. G. Celentano e L. Celentano hanno messo a disposizione con i Loro libri di
testo e del manuale degli elaborati Matlab/Simulink da Loro realizzati oltre a quelli gentilmente
illustrati durante il corso.
Ogni elaborato scelto, è stato trattato e simulato con un esempio concreto e reale ragionando sulle
possibili scelte costruttive o decisionali realizzando schemi e diagrammi aggiuntivi per rendere
attuale la spiegazione.
In alcuni programmi, come Antifurto, Serratura, Riscaldamento Bilocale si è aggiunto un mio punto
di vista su una possibile implementazione futura del programma nel mondo della Domotica. 

# La scaletta seguita nella realizzazione ed analisi dei programmi 

1. **Introduzione programma scelto** |
  Spiegazioni dell’argomento trattato e la sua importanza <br>
2. **Schema, individuazione parametri,modello matematico/logico** | Possibile schema del soggetto del programma,
individuazione parametri utili nel calcolo del modello
matematico o logico <br>
3. **Modifiche al programma e simulazioni** | Spiegazioni delle modifiche fatte e analisi delle
simulazioni attuate con dati reali <br>
4. **Conclusioni o possibili implementazioni future** | Conclusione dei risultati ottenuti e mie idee su
una possibile implementazione concreta del
programma <br>

# Lista dei Sistemi Dinamici analizzati

1. **Diffusione di un’epidemia: Modello S.E.I.R**<br>
   _1.1 Introduzione	<br>
1.2 Il Modello matematico	<br> 
1.2.1 Individuazione parametri	<br> 
1.2.2 Il Diagramma	<br> 
1.2.3 Le equazioni	<br> 
1.3 Analisi e controllo con Matlab	<br> 
1.3.1 Import dei dati su Matlab	<br> 
1.3.2 Condizioni Iniziali	<br> 
1.4.1 Editor Matlab	<br> 
1.5 Esecuzione del programma ed analisi	<br> 
1.6 Conclusioni	<br>_

2. **Edifici in zona sismica**<br> 
  _2.1 Introduzione	<br> 
2.2 Modello matematico	<br> 
2.2.1 Individuazione parametri	<br> 
2.2.2 Il modello	<br> 
2.3.1 Analisi del modello ed esecuzione del programma edificio_sisma	<br> 
2.3.2 Analisi edificio_sisma sistema costruttivo di legno	<br> 
2.3.3 Simulazione edificio_sisma sistema costruttivo in legno	<br> 
2.3.4 Analisi edificio_sisma sistema costruttivo in muratura ordinaria	<br> 
2.3.5 Simulazione edificio_sisma sistema costruttivo in muratura ordinaria<br> 
2.3.6 Analisi edificio_sisma sistema costruttivo in muratura armata	<br>_

3. **Robot planare**<br> 
_3.1 Introduzione ai robot	<br> 
3.2 Individuazione dei parametri	<br> 
3.3 Modello matematico	<br> 
3.3.1 Modello cinematico	<br> 
3.3.2 Modello dinamico	<br> 
3.3.2 Simulazione del robot su Matlab	<br> 
3.3.3 Test con 𝜏𝑓 = 0.1	<br> 
3.3.4 Test con 𝜏𝑓 = 0.5	<br> 
3.3.5 Test con 𝜏𝑓 = 0.05_<br>

4. **Auto in movimento con controllore PID**	<br> 
_4.1 Introduzione	<br> 
4.1.1 Un breve accenno al controllore PID	<br> 
4.2 Individuazione parametri e modello matematico	<br> 
4.2.1 Le equazioni	<br> 
4.2.2 Simulink e simulazioni	<br> 
4.2.3 Simulazione auto con massa superiore ai 2000Kg	<br> 
4.2.4 Simulazione auto con massa tra i 1000Kg e i 2000Kg	<br> 
4.2.5 Simulazione auto con massa minore di 1000kg	<br> 
4.3 Conclusioni_<br>

5. **Trasformatore** <br> 
_5.1 Introduzione	<br> 
5.2 Individuazione parametri e modello matematico	<br> 
5.3 Simulazione su Matlab e Simulink_<br>

6. **Rete idrica**	<br> 
_6.1 Introduzione	<br> 
6.2 Individuazione parametri e modello matematico	<br> 
6.3	Modello Simulink e simulazioni	<br> 
6.3.1 Simulazione con elettropompa per uso domestico	<br> 
6.3.2 Simulazione con elettropompa per uso condominiale	<br> 
6.4 Conclusione_<br>

7. **Serratura di casa**	<br> 
_7.1 Introduzione	<br> 
7.2 Individuazione dei parametri e modello logico	<br> 
7.3 Schema Simulink e simulazione	<br> 
7.3.1 Simulazione con combinazione 2927	<br> 
7.4 Conclusione e implementazione futura_	<br>

8. **Antifurto**	<br> 
_8.1 Introduzione	<br> 
8.2 Individuazione dei parametri e modello logico	<br> 
8.3 Modello Simulink Matlab e simulazione	<br> 
8.4 Conclusione e implementazione futura_	<br>

9. **Riscaldamento bilocale**	<br> 
_9.1 Introduzione	<br> 
9.2 Individuazione dei parametri e modello matematico	<br> 
9.3 Modello Simulink Matlab e simulazione	<br> 
9.3.1 Simulazione nel Nord Italia -5 Tmin e -2 Tmax	<br> 
9.3.2 Simulazione nel centro Italia 1 Tmin e 7 Tmax	<br> 
9.3.3 Simulazione nel sud Italia 1 Tmin e 10 Tmax	<br> 
9.4 Conclusione e implementazione futura_	<br>

10. **Frigorifero**	<br> 
_10.1 Introduzione	<br> 
10.2 Individuazione parametri e modello matematico	<br> 
10.3 Simulink e simulazioni	<br> 
10.4 Conclusioni_ <br>

# Progetto realizzato per soli scopi dimostrativi ed educativi 
La seguente trattazione è mirata alla realizzazione di un progetto per l'esame di Fondamenti di Sistemi Dinamici all' Università degli Studi di Napoli Federico II.

# Realizzato da 
<a title="Antonio Romano" href="https://github.com/LaErre9" target="_blank" > Antonio Romano</a>

