# 2η Εργασία Αρχιτεκτονικής Υπολογιστών (Ομάδα 2)

_Ραφαήλ Μπουλογεώργος, ΑΕΜ: 9186_

_Παύλος Φραγκιαδουλάκης, ΑΕΜ: 8389_

## Ερώτημα 1ο
Με βάση τη διατύπωση της εργασίας, αποσυμπιέστηκε το αρχείο _spec_cpu2006_gem5.tar.gz_ στον φάκελο εγκατάστασης του gem5. Για την μαζικό compiling και των 5 targets των benchmarks, γράφτηκε ένα νέο makefile στον φάκελο _spec_spu2006_ (στον οποίο βρίσκονται οι υποφάκελοι):
```makefile
SUBDIRS := $(wildcard */src)

all: $(SUBDIRS)
$(SUBDIRS):
	$(MAKE) -C $@

.PHONY: all $(SUBDIRS)
```
Με κλήση του make στον φάκελο _spec_cpu2006_ έχουμε δημιουργία όλων των εκτελέσιμων αρχείων.

Στο πρώτο ερώτημα μας ζητάει να εντοπίσουμε στα αρχεία εξόδου των προσομοιώσεών τα μεγέθη των caches, το associativity κάθε μίας από αυτές και το μέγεθος της cache line.

- **Specbzip**

Μέγεθος | Τιμή | Αναφορά σε αρχείο
----------------- | ----- | ------------------
L1 instruction cache | 32kB  |  [size=32768 - [config.ini]](/Step1_files/sim_results/specbzip/config.ini#L845)
L1 data caches  | 64kB  | [size=65536 - [config.ini]](/Step1_files/sim_results/specbzip/config.ini#L179)
L2 cache  | 2MB | [size=2097152 - [config.ini]](/Step1_files/sim_results/specbzip/config.ini#L1050)
Associativity L1 instruction cache  | 2 | [assoc=2 - [config.ini]](/Step1_files/sim_results/specbzip/config.ini#L832)
Associativity L1 data cache | 2 | [assoc=2 - [config.ini]](/Step1_files/sim_results/specbzip/config.ini#L159)
Associativity L2 cache | 8 | [assoc=8 - [config.ini]](/Step1_files/sim_results/specbzip/config.ini#L1037)
Cacheline size  | 64kB |  [cache_line_size=65536 - [config.ini]](/Step1_files/sim_results/specbzip/config.ini#L15)

- **Spechmmer**

Μέγεθος | Τιμή | Αναφορά σε αρχείο
----------------- | ----- | ------------------
L1 instruction cache | 32kB  |  [size=32768 - [config.ini]](/Step1_files/sim_results/spechmmer/config.ini#L813)
L1 data caches  | 64kB  | [size=65536 - [config.ini]](/Step1_files/sim_results/spechmmer/config.ini#L211)
L2 cache  | 2MB | [size=2097152 - [config.ini]](/Step1_files/sim_results/spechmmer/config.ini#L1018)
Associativity L1 instruction cache  | 2 | [assoc=2 - [config.ini]](/Step1_files/sim_results/spechmmer/config.ini#L793)
Associativity L1 data cache | 2 | [assoc=2 - [config.ini]](/Step1_files/sim_results/spechmmer/config.ini#L159)
Associativity L2 cache | 8 | [assoc=8 - [config.ini]](/Step1_files/sim_results/spechmmer/config.ini#L998)
Cacheline size  | 64kB |  [cache_line_size=65536 - [config.ini]](/Step1_files/sim_results/spechmmer/config.ini#L15)

- **Speclibm**

Μέγεθος | Τιμή | Αναφορά σε αρχείο
----------------- | ----- | ------------------
L1 instruction cache | 32kB  |  [size=32768 - [config.ini]](/Step1_files/sim_results/speclibm/config.ini#L813)
L1 data caches  | 64kB  | [size=65536 - [config.ini]](/Step1_files/sim_results/speclibm/config.ini#L211)
L2 cache  | 2MB | [size=2097152 - [config.ini]](/Step1_files/sim_results/speclibm/config.ini#L1018)
Associativity L1 instruction cache  | 2 | [assoc=2 - [config.ini]](/Step1_files/sim_results/speclibm/config.ini#L793)
Associativity L1 data cache | 2 | [assoc=2 - [config.ini]](/Step1_files/sim_results/speclibm/config.ini#L159)
Associativity L2 cache | 8 | [assoc=8 - [config.ini]](/Step1_files/sim_results/speclibm/config.ini#L998)
Cacheline size  | 64kB |  [cache_line_size=65536 - [config.ini]](/Step1_files/sim_results/speclibm/config.ini#L15)

- **Specmcf**

Μέγεθος | Τιμή | Αναφορά σε αρχείο
----------------- | ----- | ------------------
L1 instruction cache | 32kB  |  [size=32768 - [config.ini]](/Step1_files/sim_results/specmcf/config.ini#L813)
L1 data caches  | 64kB  | [size=65536 - [config.ini]](/Step1_files/sim_results/specmcf/config.ini#L211)
L2 cache  | 2MB | [size=2097152 - [config.ini]](/Step1_files/sim_results/specmcf/config.ini#L1018)
Associativity L1 instruction cache  | 2 | [assoc=2 - [config.ini]](/Step1_files/sim_results/specmcf/config.ini#L793)
Associativity L1 data cache | 2 | [assoc=2 - [config.ini]](/Step1_files/sim_results/specmcf/config.ini#L159)
Associativity L2 cache | 8 | [assoc=8 - [config.ini]](/Step1_files/sim_results/specmcf/config.ini#L998)
Cacheline size  | 64kB |  [cache_line_size=65536 - [config.ini]](/Step1_files/sim_results/specmcf/config.ini#L15)

- **Specsjeng**

Μέγεθος | Τιμή | Αναφορά σε αρχείο
----------------- | ----- | ------------------
L1 instruction cache | 32kB  |  [size=32768 - [config.ini]](/Step1_files/sim_results/specsjeng/config.ini#L813)
L1 data caches  | 64kB  | [size=65536 - [config.ini]](/Step1_files/sim_results/specsjeng/config.ini#L211)
L2 cache  | 2MB | [size=2097152 - [config.ini]](/Step1_files/sim_results/specsjeng/config.ini#L1018)
Associativity L1 instruction cache  | 2 | [assoc=2 - [config.ini]](/Step1_files/sim_results/specsjeng/config.ini#L793)
Associativity L1 data cache | 2 | [assoc=2 - [config.ini]](/Step1_files/sim_results/specsjeng/config.ini#L159)
Associativity L2 cache | 8 | [assoc=8 - [config.ini]](/Step1_files/sim_results/specsjeng/config.ini#L998)
Cacheline size  | 64kB |  [cache_line_size=65536 - [config.ini]](/Step1_files/sim_results/specsjeng/config.ini#L15)

**Είναι φανερό ότι τα μεγέθη αυτά παρεμένουν σταθερά σε όλα τα Benchmarks καθώς δεν αλλάζουμε τα ορίσματα του script *se.py*.**

## Ερώτημα 2ο

### Βήμα 1ο Εκτέλεση SPEC CPU2006 Benchmarks στον gem5
Το δεύτερο ερώτημα μας ζητάει να κρατήσουε τις ακόλουθες πληροφορίες από τα στατιστικά για κάθε Benchmark που προσομοιώσαμε.

Τα δεδομένα θα τα αντλήσουμε από το αρχείο [stats.txt](/Step1_files/sim_results/specbzip/stats.txt).

_Αναφορικά οι παραπομπές αφορούν το Benchmark Specbzip._

Πληροφορίες | Παραπομπή
------------------------  | ------------------------
Χρόνος Εκτέλεσης [1](#86)  |  [sim_seconds [stats.txt]](/Step1_files/sim_results/specbzip/stats.txt#L12)
Cycles per instruction (CPI)  | [system.cpu.cpi [stats.txt]](/Step1_files/sim_results/specbzip/stats.txt#L29)
Συνολικά miss rates L1 Data cache | [system.cpu.dcache.overall_miss_rate::total [stats.txt]](/Step1_files/sim_results/specbzip/stats.txt#L867)
Συνολικά miss rates L1 instruction cache | [system.cpu.icache.overall_miss_rate::total [stats.txt]](/Step1_files/sim_results/specbzip/stats.txt#L780)
Συνολικά miss rates L2 cache | [system.l2.overall_miss_rate::total [stats.txt]](/Step1_files/sim_results/specbzip/stats.txt#L320)

*[1](#80): Αναφερόμαστε στον χρόνο εκτέλεσης του Benchmark και όχι τον συνολικό χρόνο προσομοίωσης.*

Δεδομένα/Benchmark  |  Χρόνος Εκτέλεσης | Cycles per instruction (CPI)  | Total miss-rate L1 Data  | Total miss-rate L1 Instruction | Total miss-rate rates L2
-------------------- | ---------------------- | -------------------------- | ------------------------- | -------------------------- | ----------------
401.bzip2 *(specbzip)* |  0.084159	| 1.683172 |	0.014840 |	0.000074 |	0.281708
470.lbm *(speclibm)*  | 0.174681 |	3.493611 |	0.060971 |	0.000099 |	0.999927
456.hmmer *(spechmmer)* | 0.059368 |	1.187362|	0.001645 |	0.000205 |	0.082246
458.sjeng *(specsjeng)* | 0.513541 |	10.270810	| 0.121829 |	0.000020 |	0.999979
429.mcf *(specmcf)* | 0.055477 |	1.109538 |	0.002051 |	0.000037 |	0.724040

- **Χρόνος Εκτέλεσης**

![Simulated Time Per Benchmark](/Step1_files/step1_q2_grafs/sim_seconds_graf.bmp "Simulated Time Per Benchmark")

- **Cycles per instruction (CPI)**

![Cycles per instruction (CPI)](/Step1_files/step1_q2_grafs/cpi_graf.bmp "Cycles per instruction (CPI)")

- **Total miss-rate L1 Data**

![Total misses L1 Data](/Step1_files/step1_q2_grafs/dcache_miss_rate_graf.bmp "Total misses L1 Data")

- **Total miss-rate L1 Instruction**

![Total misses L1 Data](/Step1_files/step1_q2_grafs/icache_miss_rate_graf.bmp "Total misses L1 Data")

- **Total miss-rate L2 Cache**

![Total miss-rate L2 Cache](/Step1_files/step1_q2_grafs/L2_cache_miss_rate_graf.bmp "Total miss-rate L2 Cache")

- **Συμπέρασματα Γραφημάτων**

Από τα γραφήματα μπορούμε να βγάλουμε συμπεράσματα σχετικά με τον τρόπο που λειτουργούν τα Benchmarks αλλά και τις αδυναμίες της αντίστοιχης αρχιτεκτονικής.

Αρχικά βλέπουμε ότι οι διαφορές στα miss-rates στην L1 Instruction Cache είναι αμελητέες και δεν επηρεάζουν το συνολικό χρόνο εκτέλεσης των προγραμμάτων. Παρόλα αυτά το Spechmmer φαίνεται να έχει συγκριτικά μεγαλύτερο ποσοστό miss-rate στην instruction Cache κάτι που μας κάνει να συμπεράνουμε ότι η εντολές δεν βρίσκονται πάντα η μία κοντά στην άλλη, δηλαδή υπάρχουν πολλά branches σε διάφορα σημεία του κώδικα ή ότι το μέγεθος στην L1 δεν είναι αρκετά μεγάλο για τις απαιτήσεις του προγράμματος.

Αντίθετα τα miss-rate της L1 Data cache επηρεάζουν καθοριστικά τον χρόνο εκτέλεσης. Για το Specsjeng με αρκετά μεγάλο ποσοστό misses σε σχέση με τα υπόλοιπα βλέπουμε ότι ο χρόνος αυξάνεται σημαντικά. Με βάση αυτό μπορούμε να συμπεράνουμε ότι το μέγεθος της L1 Data Cache δεν επαρκεί ή ότι τα δεδομένα που χρειάζεται το πρόγραμμα δεν βρίσκονται δε γειτονικές θέσεις μνήμης με αποτέλεσμα να μην ακολουθούν την τοπικότητα και να αυξάνουν το miss-rate. Το γεγονός αυτό επαληθεύεται και από το διάγραμμα της L2 Cache στο οποίο βλέπουμε ότι σχεδόν κάθε φορά που αναζητούσε εκεί δεδομένα είχε miss. Αντίστοιχα αποτελέσματα συμπεραίνουμε και από το Speclibm .

### Βήμα 2ο Design Exploration – Βελτιστοποίηση απόδοσης

Για την εύρεση της επίπτωσης στην απόδοση στις διάφορες παραμέτρους που εξετάζουμε, τα παρακάτω εύρη που αναφέρονται παρακάτω. Να σημειωθεί ότι το μέγεθος των Data/Instruction για την L1 είναι επιλεγμένο έτσι ώστε να το άθροισμά τους να μην υπερβαίνει τα 256 kB:
  * Cacheline Size: 32, **64**, 128
  * L1 Data Size [kB]: 16, **32**, 64, 128
  * L1 Instruction Size [kB]: 16, 32, **64**, 128
  * L1 Data Associativity: **1**, 2, 4
  * L1 Instruction Associativity: **1**, 2, 4
  * L2 Data Associativity: 1, **2**, 4
  * L2 Size [kB]: **512**, 1024, 2048, 4096  
  
Στα παραπάνω, με έντονη γραμματοσειρά σημειώνονται οι default τιμές. 
Ο αριθμός των instructions που εκτελέστηκε είναι ίσος με 10<sup>8</sup>, γεγονός που επηρέασε τη μη σημαντική επίπτωση των μεταβολών του L1 instruction size, το οποίο θα ήταν αναμενόμενο. 

Παρακάτω παρατίθενται τα χαρακτηριστικά γραφήματα για τις παραπάνω περιπτώσεις, στις οποίες παρουσιάζεται κάποια αξιοσημείωτη μεταβολή:

#### CACHE LINE
Το μέγεθος του Cache Line φαίνεται να επηρεάζει σχεδόν όλα τα μεγέθη ενδιαφέροντος.
* Cache Line effect to CPI
![Cache Line effect to CPI](charts/01_CACHE_CPI.png)

Παρατηρούμε ότι υπάρχει σημαντική μείωση του CPI με αύξηση του Cache Line κυρίως στα spechmmer, speclibm προγράμματα. Στα άλλα η επίπτωση είναι αμελητέα.

* Cache Line effect to data cache miss rate
![Cache Line effect to dcache miss rate](charts/01_CACHE_DCACHE.png)

Η επίπτωση και εδώ είναι παρόμοια με παραπάνω. Υπάρχει μείωση του data cache miss rate με αύξηση του Cache Line κυρίως στα spechmmer, speclibm προγράμματα.

* Cache Line effect to instruction cache miss rate
![Cache Line effect to icache miss rate](charts/01_CACHE_ICACHE.png)

Εδώ βλέπουμε ότι το miss rate υφίσταται πρακτικά μόνο στο spechmmer στο οποίο εμφανίζεται πτώση

* Cache Line effect to L2 overall miss rate
![Cache Line effect to L2 overall miss rate](charts/01_CACHE_L2.png)

Εκτός του speclibm αύξηση του Cache Line επιφέρει μείωση του L2 overall miss rate σε όλα τα προγράμματα. Πιο έντονη είναι η πτώση στα specbzip, specmcf.

#### L1D size/L1I size

* L1D size/L1I size effect to CPI
![L1D size/L1I size effect to CPI](charts/02_L1D_L1I_CPI.png)

Τα μεγέθη του L1 data/L1 instr. προκαλούν αμελητέα μείωση στο CPI.

* L1D size/L1I size effect to data cache miss rate
![L1D size/L1I size effect to data cache miss rate](charts/02_L1D_L1I_DCACHE.png)

Το μέγεθος του L1 instruction size δεν φαίνεται να επηρεάζει το data cache miss rate. Το L1 data size μειώνει το data cache miss rate σε όλα τα προγράμματα εκτός του speclibm.

* L1D size/L1I size effect to instruction cache miss rate
![L1D size/L1I size effect to data cache miss rate](charts/02_L1D_L1I_ICACHE.png)

Το μέγεθος του L1 instruction size μειώνει το instruction cache miss rate πάρα πολύ στο specmcf και λιγότερο στο spechmmer. Το L1 data size έχει αμελητέα επίπτωση.

* L1D size/L1I size effect to L2 overall miss rate
![L1D size/L1I size effect to L2 overall miss rate](charts/02_L1D_L1I_L2.png)

Το L1 instruction size φαίνεται να αυξάνει το L2 miss rate σχεδόν σε όλες τις περιπτώσεις εκτός του speclibm.

#### L1D associativity

* L1D associativity effect to CPI
![L1D associativity effect to CPI](charts/03_L1D_ASSOC_CPI.png)

To CPI δεν φαίνεται να επηρεάζεται.

* L1D associativity effect to data cache miss rate
![L1D associativity effect to data cache miss rate](charts/03_L1D_ASSOC_DCACHE.png)

Εμφανίζεται μικρή μείωση του data cache miss rate με την αύξηση του associativity στα spechmmer, specbzip.

* L1D associativity effect to instruction cache miss rate
![L1D associativity effect to instruction cache miss rate](charts/03_L1D_ASSOC_ICACHE.png)

Δεν επηρεάζεται το instruction cache miss rate.

* L1D associativity effect to L2 overall miss rate
![L1D associativity effect to L2 overall miss rate](charts/03_L1D_ASSOC_L2.png)

Με την αύξηση του L1D associativity, φαίνεται να αυξάνεται το L2 miss rate στα specbzip, specmcf, spechmmer.

#### L1I associativity

* L1I associativity effect to CPI
![L1I associativity effect to CPI](charts/04_L1I_ASSOC_CPI.png)

To CPI δεν φαίνεται να επηρεάζεται.

* L1I associativity effect to data cache miss rate
![L1I associativity effect to data cache miss rate](charts/04_L1I_ASSOC_DCACHE.png)

Το data cache miss rate δεν φαίνεται να επηρεάζεται.

* L1I associativity effect to instruction cache miss rate
![L1I associativity effect to instruction cache miss rate](charts/04_L1I_ASSOC_ICACHE.png)

Δεν επηρεάζεται πρακτικά το instruction cache miss rate.

* L1I associativity effect to L2 overall miss rate
![L1I associativity effect to L2 overall miss rate](charts/04_L1I_ASSOC_L2.png)

Δεν επηρεάζεται πρακτικά το L2 overall miss rate.

#### L2D associativity

* L2D associativity effect to CPI
![L2D associativity effect to CPI](charts/05_L2D_ASSOC_CPI.png)

To CPI δεν φαίνεται να επηρεάζεται.

* L2D associativity effect to data cache miss rate
![L2D associativity effect to data cache miss rate](charts/05_L2D_ASSOC_DCACHE.png)

Το data cache miss rate δεν φαίνεται να επηρεάζεται.

* L2D associativity effect to instruction cache miss rate
![L2D associativity effect to instruction cache miss rate](charts/05_L2D_ASSOC_ICACHE.png)

Δεν επηρεάζεται το instruction cache miss rate.

* L2D associativity effect to L2 overall miss rate
![L2D associativity effect to L2 overall miss rate](charts/05_L2D_ASSOC_L2.png)

Δεν επηρεάζεται πρακτικά το L2 overall miss rate. Υπάρχει μία πολύ μικρή μείωση στα specbzip, specmcf.

#### L2 size [kB]

* L2 size effect to CPI
![L2 size effect to CPI](charts/06_L2SIZE_CPI.png)

To CPI δεν φαίνεται να επηρεάζεται.

* L2 size effect to data cache miss rate
![L2 size effect to data cache miss rate](charts/06_L2SIZE_DCACHE.png)

Το data cache miss rate δεν φαίνεται να επηρεάζεται.

* L2 size effect to instruction cache miss rate
![L2 size effect to instruction cache miss rate](charts/06_L2SIZE_ICACHE.png)

Δεν επηρεάζεται το instruction cache miss rate.

* L2 size effect to L2 overall miss rate
![L2 size effect to L2 overall miss rate](charts/06_L2SIZE_L2.png)

Εμφανίζεται μία μείωση του L2 overall miss rate (με την αύξηση του L2 size) στα specbzip, specmcf.


### Βήμα 3ο Κόστος απόδοσης και βελτιστοποίηση κόστους/απόδοσης
Παρακάτω επισυνάπτεται ο συνολικός πίνακας των αποτελεσμάτων. 

Η βέλτιστη επιλογή των παραμέτρων γίνεται εδώ με βάση το γινόμενο *COST\*(AMAT+CPI/Frequency)*. Θέλουμε το λίγοτερο δυνατό κόστος και τον μικρότερο δυνατό χρόνο, συνεπώς η καλύτερη επιλογή για κάθε benchmark είναι εκείνη με την μικρότερη τιμή.
Εναλλακτικά θα μπορούσαμε να πάρουμε την μεγαλύτερη τιμή του λόγου Performance/Cost = 1/ ((AMAT+CPI/Frequency) x Cost), όπου η απόδοση θα ήταν το 1/(AMAT+CPI/Frequency). 
Η σχέση του AMAT προκύπτει από την βιβλιογραφία (_Patterson, Hennessy - Computer Organization and Design, 5th ed., p.402_) βάζοντας συμβατικούς συντελεστές για τα HitRate, αλλά χρησιμοποιώντας τις μετρούμενες τιμές από το gem5 (MissRate<sub>L1</sub>, MissRate<sub>L2</sub>):

**MissRate<sub>L1</sub> = (Miss Rate Instruction + Miss Rate Data Cache)**

**ΑΜΑΤ = HitRate<sub>L1</sub> + MissRate<sub>L1</sub> x (HitRate<sub>L2</sub> + MissRate<sub>L2</sub> x MissPenalty<sub>L2</sub>)** ή

**AMAT = 1 + (system.cpu.dcache.overall_miss_rate::total + system.cpu.icache.overall_miss_rate::total) x (10 + system.l2.overall_miss_rate::total
 x 100)**
 
Για το κόστος χρησιμοποιούμε την (εμπειρική) συνάρτηση θεωρώντας δεδομένη περίπου μία τάξη μεγέθους στο κόστος L1, L2:

**COST = (L1 Data Size + L1 Instr Size)/128 x 10 + (L1 Data Assoc)/4 x 10 + (L2 Size)/4096 x 1 + (Cache Line)/128 x 10**

Στα παραπάνω έχουμε ανάγει κάθε μέγεθος αθροιστή σε ένα τυπικό εύρος [0,1] πριν γίνει πολ/σμός με ένα συγκριτικό συντελεστή κόστους.

Οι αναλυτικοί υπολογισμοί του Cost function και του AMAT και του τελικού index φαίνονται στον παρακάτω πίνακα:
| Benchmarks                      | system.cpu.cpi | system.cpu.dcache.overall_miss_rate::total | system.cpu.icache.overall_miss_rate::total | system.l2.overall_miss_rate::total | Benchmark | Scenario          | Cache line | Frequency [GHz] | L1 Data Size [kB] | L1 Instr Size [kB] | L1 Data Assoc | L1 Instr Assoc | L2 Data Assoc | L2 Size [kB] | ([AMAT+CPI/Freq) [ns] | COST | COST*TIME |
|---------------------------------|----------------|--------------------------------------------|--------------------------------------------|------------------------------------|-----------|-------------------|------------|-----------------|-------------------|--------------------|---------------|----------------|---------------|--------------|-----------------------|------|-----------|
| ./specbzip/cacheline.128        | 1.730924       | 0.021791                                   | 0.000061                                   | 0.196655                           | specbzip  | Cache Line        | 128        | 1               | 32                | 32                 | 1             | 1              | 2             | 512          | 3.38                  | 17.6 | 59.6      |
| ./specbzip/cacheline.32         | 1.836366       | 0.023846                                   | 0.00009                                    | 0.399277                           | specbzip  | Cache Line        | 32         | 1               | 32                | 32                 | 1             | 1              | 2             | 512          | 4.03                  | 10.1 | 40.8      |
| ./specbzip/cacheline.64         | 1.727746       | 0.021398                                   | 0.000076                                   | 0.271811                           | specbzip  | Cache Line        | 64         | 1               | 32                | 32                 | 1             | 1              | 2             | 512          | 3.53                  | 12.6 | 44.5      |
| ./specbzip/cpu_clock.1GHz       | 1.727746       | 0.021398                                   | 0.000076                                   | 0.271811                           | specbzip  | CPU Frequency     | 64         | 1               | 32                | 32                 | 1             | 1              | 2             | 512          | 3.53                  | 12.6 | 44.5      |
| ./specbzip/l1d.128kB_l1i.128kB  | 1.657078       | 0.014063                                   | 0.000072                                   | 0.421743                           | specbzip  | L1D/L1I Size      | 64         | 1               | 128               | 128                | 1             | 1              | 2             | 512          | 3.39                  | 27.6 | 93.8      |
| ./specbzip/l1d.128kB_l1i.16kB   | 1.657357       | 0.014061                                   | 0.000254                                   | 0.420709                           | specbzip  | L1D/L1I Size      | 64         | 1               | 128               | 16                 | 1             | 1              | 2             | 512          | 3.40                  | 18.9 | 64.2      |
| ./specbzip/l1d.128kB_l1i.32kB   | 1.657156       | 0.014063                                   | 0.000086                                   | 0.421697                           | specbzip  | L1D/L1I Size      | 64         | 1               | 128               | 32                 | 1             | 1              | 2             | 512          | 3.40                  | 20.1 | 68.3      |
| ./specbzip/l1d.128kB_l1i.64kB   | 1.657078       | 0.014061                                   | 0.000076                                   | 0.421736                           | specbzip  | L1D/L1I Size      | 64         | 1               | 128               | 64                 | 1             | 1              | 2             | 512          | 3.39                  | 22.6 | 76.8      |
| ./specbzip/l1d.16kB_l1i.128kB   | 1.77353        | 0.026154                                   | 0.000072                                   | 0.221456                           | specbzip  | L1D/L1I Size      | 64         | 1               | 16                | 128                | 1             | 1              | 2             | 512          | 3.62                  | 18.9 | 68.3      |
| ./specbzip/l1d.16kB_l1i.16kB    | 1.773781       | 0.026152                                   | 0.00026                                    | 0.221191                           | specbzip  | L1D/L1I Size      | 64         | 1               | 16                | 16                 | 1             | 1              | 2             | 512          | 3.62                  | 10.1 | 36.7      |
| ./specbzip/l1d.16kB_l1i.32kB    | 1.773608       | 0.026154                                   | 0.000086                                   | 0.221453                           | specbzip  | L1D/L1I Size      | 64         | 1               | 16                | 32                 | 1             | 1              | 2             | 512          | 3.62                  | 11.4 | 41.1      |
| ./specbzip/l1d.16kB_l1i.64kB    | 1.773615       | 0.026153                                   | 0.000076                                   | 0.221456                           | specbzip  | L1D/L1I Size      | 64         | 1               | 16                | 64                 | 1             | 1              | 2             | 512          | 3.62                  | 13.9 | 50.2      |
| ./specbzip/l1d.32kB_l1i.128kB   | 1.727746       | 0.021398                                   | 0.000072                                   | 0.271812                           | specbzip  | L1D/L1I Size      | 64         | 1               | 32                | 128                | 1             | 1              | 2             | 512          | 3.53                  | 20.1 | 71.0      |
| ./specbzip/l1d.32kB_l1i.16kB    | 1.72793        | 0.021396                                   | 0.000254                                   | 0.271409                           | specbzip  | L1D/L1I Size      | 64         | 1               | 32                | 16                 | 1             | 1              | 2             | 512          | 3.53                  | 11.4 | 40.2      |
| ./specbzip/l1d.32kB_l1i.32kB    | 1.727774       | 0.021398                                   | 0.000086                                   | 0.271801                           | specbzip  | L1D/L1I Size      | 64         | 1               | 32                | 32                 | 1             | 1              | 2             | 512          | 3.53                  | 12.6 | 44.5      |
| ./specbzip/l1d.32kB_l1i.64kB    | 1.727746       | 0.021398                                   | 0.000076                                   | 0.271811                           | specbzip  | L1D/L1I Size      | 64         | 1               | 32                | 64                 | 1             | 1              | 2             | 512          | 3.53                  | 15.1 | 53.3      |
| ./specbzip/l1d.64kB_l1i.128kB   | 1.693686       | 0.017754                                   | 0.000072                                   | 0.329703                           | specbzip  | L1D/L1I Size      | 64         | 1               | 64                | 128                | 1             | 1              | 2             | 512          | 3.46                  | 22.6 | 78.3      |
| ./specbzip/l1d.64kB_l1i.16kB    | 1.693845       | 0.017754                                   | 0.000254                                   | 0.329099                           | specbzip  | L1D/L1I Size      | 64         | 1               | 64                | 16                 | 1             | 1              | 2             | 512          | 3.47                  | 13.9 | 48.1      |
| ./specbzip/l1d.64kB_l1i.32kB    | 1.693587       | 0.017754                                   | 0.000086                                   | 0.329683                           | specbzip  | L1D/L1I Size      | 64         | 1               | 64                | 32                 | 1             | 1              | 2             | 512          | 3.46                  | 15.1 | 52.3      |
| ./specbzip/l1d.64kB_l1i.64kB    | 1.693686       | 0.017754                                   | 0.000076                                   | 0.329702                           | specbzip  | L1D/L1I Size      | 64         | 1               | 64                | 64                 | 1             | 1              | 2             | 512          | 3.46                  | 17.6 | 61.0      |
| ./specbzip/l1d_assoc.1          | 1.727746       | 0.021398                                   | 0.000076                                   | 0.271811                           | specbzip  | L1D Associativity | 64         | 1               | 32                | 32                 | 1             | 1              | 2             | 512          | 3.53                  | 12.6 | 44.5      |
| ./specbzip/l1d_assoc.2          | 1.688318       | 0.017826                                   | 0.000076                                   | 0.327085                           | specbzip  | L1D Associativity | 64         | 1               | 32                | 32                 | 2             | 1              | 2             | 512          | 3.45                  | 15.1 | 52.2      |
| ./specbzip/l1d_assoc.4          | 1.67506        | 0.016515                                   | 0.000076                                   | 0.354163                           | specbzip  | L1D Associativity | 64         | 1               | 32                | 32                 | 4             | 1              | 2             | 512          | 3.43                  | 20.1 | 69.0      |
| ./specbzip/l1i_assoc.1          | 1.727746       | 0.021398                                   | 0.000076                                   | 0.271811                           | specbzip  | L1I Associativity | 64         | 1               | 32                | 32                 | 1             | 1              | 2             | 512          | 3.53                  | 12.6 | 44.5      |
| ./specbzip/l1i_assoc.2          | 1.727696       | 0.021396                                   | 0.00007                                    | 0.271806                           | specbzip  | L1I Associativity | 64         | 1               | 32                | 32                 | 1             | 2              | 2             | 512          | 3.53                  | 12.6 | 44.5      |
| ./specbzip/l1i_assoc.4          | 1.727791       | 0.021397                                   | 0.000067                                   | 0.271813                           | specbzip  | L1I Associativity | 64         | 1               | 32                | 32                 | 1             | 4              | 2             | 512          | 3.53                  | 12.6 | 44.5      |
| ./specbzip/l2d_assoc.1          | 1.745032       | 0.021366                                   | 0.000076                                   | 0.300587                           | specbzip  | L2D Associativity | 64         | 1               | 32                | 32                 | 1             | 1              | 1             | 512          | 3.60                  | 12.6 | 45.5      |
| ./specbzip/l2d_assoc.2          | 1.727746       | 0.021398                                   | 0.000076                                   | 0.271811                           | specbzip  | L2D Associativity | 64         | 1               | 32                | 32                 | 1             | 1              | 2             | 512          | 3.53                  | 12.6 | 44.5      |
| ./specbzip/l2d_assoc.4          | 1.726159       | 0.021398                                   | 0.000076                                   | 0.26553                            | specbzip  | L2D Associativity | 64         | 1               | 32                | 32                 | 1             | 1              | 4             | 512          | 3.51                  | 12.6 | 44.3      |
| ./specbzip/l2_size.1MB          | 1.701162       | 0.021405                                   | 0.000076                                   | 0.224366                           | specbzip  | L2 Size           | 64         | 1               | 32                | 32                 | 1             | 1              | 2             | 1024         | 3.40                  | 12.8 | 43.3      |
| ./specbzip/l2_size.256kB        | 1.782824       | 0.02138                                    | 0.000076                                   | 0.357172                           | specbzip  | L2 Size           | 64         | 1               | 32                | 32                 | 1             | 1              | 2             | 256          | 3.76                  | 12.6 | 47.3      |
| ./specbzip/l2_size.2MB          | 1.684597       | 0.021403                                   | 0.000076                                   | 0.197444                           | specbzip  | L2 Size           | 64         | 1               | 32                | 32                 | 1             | 1              | 2             | 2048         | 3.32                  | 13.0 | 43.2      |
| ./specbzip/l2_size.4MB          | 1.666818       | 0.021403                                   | 0.000076                                   | 0.170211                           | specbzip  | L2 Size           | 64         | 1               | 32                | 32                 | 1             | 1              | 2             | 4096         | 3.25                  | 13.5 | 43.8      |
| ./specbzip/l2_size.512kB        | 1.727746       | 0.021398                                   | 0.000076                                   | 0.271811                           | specbzip  | L2 Size           | 64         | 1               | 32                | 32                 | 1             | 1              | 2             | 512          | 3.53                  | 12.6 | 44.5      |
| ./spechmmer/cacheline.128       | 3.77849        | 0.03885                                    | 0.058011                                   | 0.856041                           | spechmmer | Cache Line        | 128        | 1               | 32                | 32                 | 1             | 1              | 2             | 512          | 14.04                 | 17.6 | 247.4     |
| ./spechmmer/cacheline.32        | 6.2138         | 0.077136                                   | 0.10876                                    | 0.94686                            | spechmmer | Cache Line        | 32         | 1               | 32                | 32                 | 1             | 1              | 2             | 512          | 26.67                 | 10.1 | 270.1     |
| ./spechmmer/cacheline.64        | 4.523777       | 0.054129                                   | 0.077973                                   | 0.892922                           | spechmmer | Cache Line        | 64         | 1               | 32                | 32                 | 1             | 1              | 2             | 512          | 18.64                 | 12.6 | 235.3     |
| ./spechmmer/cpu_clock.1GHz      | 4.523777       | 0.054129                                   | 0.077973                                   | 0.892922                           | spechmmer | CPU Frequency     | 64         | 1               | 32                | 32                 | 1             | 1              | 2             | 512          | 18.64                 | 12.6 | 235.3     |
| ./spechmmer/l1d.128kB_l1i.128kB | 4.450576       | 0.044307                                   | 0.077877                                   | 0.957198                           | spechmmer | L1D/L1I Size      | 64         | 1               | 128               | 128                | 1             | 1              | 2             | 512          | 18.37                 | 27.6 | 507.4     |
| ./spechmmer/l1d.128kB_l1i.16kB  | 4.574689       | 0.044297                                   | 0.092743                                   | 0.849741                           | spechmmer | L1D/L1I Size      | 64         | 1               | 128               | 16                 | 1             | 1              | 2             | 512          | 18.59                 | 18.9 | 350.9     |
| ./spechmmer/l1d.128kB_l1i.32kB  | 4.483704       | 0.044316                                   | 0.082461                                   | 0.921348                           | spechmmer | L1D/L1I Size      | 64         | 1               | 128               | 32                 | 1             | 1              | 2             | 512          | 18.43                 | 20.1 | 370.9     |
| ./spechmmer/l1d.128kB_l1i.64kB  | 4.450576       | 0.044307                                   | 0.078312                                   | 0.953488                           | spechmmer | L1D/L1I Size      | 64         | 1               | 128               | 64                 | 1             | 1              | 2             | 512          | 18.37                 | 22.6 | 415.6     |
| ./spechmmer/l1d.16kB_l1i.128kB  | 4.584001       | 0.061377                                   | 0.077205                                   | 0.846816                           | spechmmer | L1D/L1I Size      | 64         | 1               | 16                | 128                | 1             | 1              | 2             | 512          | 18.71                 | 18.9 | 353.1     |
| ./spechmmer/l1d.16kB_l1i.16kB   | 4.645905       | 0.061364                                   | 0.092371                                   | 0.759259                           | spechmmer | L1D/L1I Size      | 64         | 1               | 16                | 16                 | 1             | 1              | 2             | 512          | 18.86                 | 10.1 | 190.9     |
| ./spechmmer/l1d.16kB_l1i.32kB   | 4.622319       | 0.06139                                    | 0.081946                                   | 0.817276                           | spechmmer | L1D/L1I Size      | 64         | 1               | 16                | 32                 | 1             | 1              | 2             | 512          | 18.77                 | 11.4 | 213.5     |
| ./spechmmer/l1d.16kB_l1i.64kB   | 4.585833       | 0.061377                                   | 0.077636                                   | 0.843911                           | spechmmer | L1D/L1I Size      | 64         | 1               | 16                | 64                 | 1             | 1              | 2             | 512          | 18.71                 | 13.9 | 259.6     |
| ./spechmmer/l1d.32kB_l1i.128kB  | 4.516373       | 0.054129                                   | 0.07754                                    | 0.896175                           | spechmmer | L1D/L1I Size      | 64         | 1               | 32                | 128                | 1             | 1              | 2             | 512          | 18.63                 | 20.1 | 375.0     |
| ./spechmmer/l1d.32kB_l1i.16kB   | 4.633845       | 0.054118                                   | 0.092795                                   | 0.798701                           | spechmmer | L1D/L1I Size      | 64         | 1               | 32                | 16                 | 1             | 1              | 2             | 512          | 18.84                 | 11.4 | 214.3     |
| ./spechmmer/l1d.32kB_l1i.32kB   | 4.567209       | 0.054141                                   | 0.082103                                   | 0.864675                           | spechmmer | L1D/L1I Size      | 64         | 1               | 32                | 32                 | 1             | 1              | 2             | 512          | 18.71                 | 12.6 | 236.2     |
| ./spechmmer/l1d.32kB_l1i.64kB   | 4.523777       | 0.054129                                   | 0.077973                                   | 0.892922                           | spechmmer | L1D/L1I Size      | 64         | 1               | 32                | 64                 | 1             | 1              | 2             | 512          | 18.64                 | 15.1 | 281.9     |
| ./spechmmer/l1d.64kB_l1i.128kB  | 4.450576       | 0.044307                                   | 0.077877                                   | 0.957198                           | spechmmer | L1D/L1I Size      | 64         | 1               | 64                | 128                | 1             | 1              | 2             | 512          | 18.37                 | 22.6 | 415.6     |
| ./spechmmer/l1d.64kB_l1i.16kB   | 4.574689       | 0.044297                                   | 0.092743                                   | 0.849741                           | spechmmer | L1D/L1I Size      | 64         | 1               | 64                | 16                 | 1             | 1              | 2             | 512          | 18.59                 | 13.9 | 257.9     |
| ./spechmmer/l1d.64kB_l1i.32kB   | 4.483704       | 0.044316                                   | 0.082461                                   | 0.921348                           | spechmmer | L1D/L1I Size      | 64         | 1               | 64                | 32                 | 1             | 1              | 2             | 512          | 18.43                 | 15.1 | 278.8     |
| ./spechmmer/l1d.64kB_l1i.64kB   | 4.450576       | 0.044307                                   | 0.078312                                   | 0.953488                           | spechmmer | L1D/L1I Size      | 64         | 1               | 64                | 64                 | 1             | 1              | 2             | 512          | 18.37                 | 17.6 | 323.7     |
| ./spechmmer/l1d_assoc.1         | 4.523777       | 0.054129                                   | 0.077973                                   | 0.892922                           | spechmmer | L1D Associativity | 64         | 1               | 32                | 32                 | 1             | 1              | 2             | 512          | 18.64                 | 12.6 | 235.3     |
| ./spechmmer/l1d_assoc.2         | 4.450576       | 0.044735                                   | 0.078261                                   | 0.949807                           | spechmmer | L1D Associativity | 64         | 1               | 32                | 32                 | 2             | 1              | 2             | 512          | 18.36                 | 15.1 | 277.7     |
| ./spechmmer/l1d_assoc.4         | 4.450576       | 0.044307                                   | 0.078312                                   | 0.953488                           | spechmmer | L1D Associativity | 64         | 1               | 32                | 32                 | 4             | 1              | 2             | 512          | 18.37                 | 20.1 | 369.7     |
| ./spechmmer/l1i_assoc.1         | 4.523777       | 0.054129                                   | 0.077973                                   | 0.892922                           | spechmmer | L1I Associativity | 64         | 1               | 32                | 32                 | 1             | 1              | 2             | 512          | 18.64                 | 12.6 | 235.3     |
| ./spechmmer/l1i_assoc.2         | 4.516373       | 0.054129                                   | 0.077306                                   | 0.89781                            | spechmmer | L1I Associativity | 64         | 1               | 32                | 32                 | 1             | 2              | 2             | 512          | 18.63                 | 12.6 | 235.2     |
| ./spechmmer/l1i_assoc.4         | 4.516373       | 0.054129                                   | 0.076623                                   | 0.902752                           | spechmmer | L1I Associativity | 64         | 1               | 32                | 32                 | 1             | 4              | 2             | 512          | 18.63                 | 12.6 | 235.2     |
| ./spechmmer/l2d_assoc.1         | 4.523777       | 0.054129                                   | 0.077973                                   | 0.892922                           | spechmmer | L2D Associativity | 64         | 1               | 32                | 32                 | 1             | 1              | 1             | 512          | 18.64                 | 12.6 | 235.3     |
| ./spechmmer/l2d_assoc.2         | 4.523777       | 0.054129                                   | 0.077973                                   | 0.892922                           | spechmmer | L2D Associativity | 64         | 1               | 32                | 32                 | 1             | 1              | 2             | 512          | 18.64                 | 12.6 | 235.3     |
| ./spechmmer/l2d_assoc.4         | 4.523777       | 0.054129                                   | 0.077973                                   | 0.892922                           | spechmmer | L2D Associativity | 64         | 1               | 32                | 32                 | 1             | 1              | 4             | 512          | 18.64                 | 12.6 | 235.3     |
| ./spechmmer/l2_size.1MB         | 4.523777       | 0.054129                                   | 0.077973                                   | 0.892922                           | spechmmer | L2 Size           | 64         | 1               | 32                | 32                 | 1             | 1              | 2             | 1024         | 18.64                 | 12.8 | 237.7     |
| ./spechmmer/l2_size.256kB       | 4.523777       | 0.054129                                   | 0.077973                                   | 0.892922                           | spechmmer | L2 Size           | 64         | 1               | 32                | 32                 | 1             | 1              | 2             | 256          | 18.64                 | 12.6 | 234.2     |
| ./spechmmer/l2_size.2MB         | 4.523777       | 0.054129                                   | 0.077973                                   | 0.892922                           | spechmmer | L2 Size           | 64         | 1               | 32                | 32                 | 1             | 1              | 2             | 2048         | 18.64                 | 13.0 | 242.3     |
| ./spechmmer/l2_size.4MB         | 4.523777       | 0.054129                                   | 0.077973                                   | 0.892922                           | spechmmer | L2 Size           | 64         | 1               | 32                | 32                 | 1             | 1              | 2             | 4096         | 18.64                 | 13.5 | 251.6     |
| ./spechmmer/l2_size.512kB       | 4.523777       | 0.054129                                   | 0.077973                                   | 0.892922                           | spechmmer | L2 Size           | 64         | 1               | 32                | 32                 | 1             | 1              | 2             | 512          | 18.64                 | 12.6 | 235.3     |
| ./speclibm/cacheline.128        | 4.978208       | 0.061057                                   | 0.000014                                   | 0.995481                           | speclibm  | Cache Line        | 128        | 1               | 32                | 32                 | 1             | 1              | 2             | 512          | 12.67                 | 17.6 | 223.3     |
| ./speclibm/cacheline.32         | 11.660412      | 0.243703                                   | 0.000023                                   | 0.999597                           | speclibm  | Cache Line        | 32         | 1               | 32                | 32                 | 1             | 1              | 2             | 512          | 39.46                 | 10.1 | 399.5     |
| ./speclibm/cacheline.64         | 7.042241       | 0.121912                                   | 0.00002                                    | 0.99863                            | speclibm  | Cache Line        | 64         | 1               | 32                | 32                 | 1             | 1              | 2             | 512          | 21.44                 | 12.6 | 270.7     |
| ./speclibm/cpu_clock.1GHz       | 7.042241       | 0.121912                                   | 0.00002                                    | 0.99863                            | speclibm  | CPU Frequency     | 64         | 1               | 32                | 32                 | 1             | 1              | 2             | 512          | 21.44                 | 12.6 | 270.7     |
| ./speclibm/l1d.128kB_l1i.128kB  | 7.041453       | 0.121845                                   | 0.000019                                   | 0.999742                           | speclibm  | L1D/L1I Size      | 64         | 1               | 128               | 128                | 1             | 1              | 2             | 512          | 21.44                 | 27.6 | 592.4     |
| ./speclibm/l1d.128kB_l1i.16kB   | 7.041488       | 0.121845                                   | 0.000024                                   | 0.999713                           | speclibm  | L1D/L1I Size      | 64         | 1               | 128               | 16                 | 1             | 1              | 2             | 512          | 21.44                 | 18.9 | 404.7     |
| ./speclibm/l1d.128kB_l1i.32kB   | 7.041519       | 0.121845                                   | 0.000021                                   | 0.99973                            | speclibm  | L1D/L1I Size      | 64         | 1               | 128               | 32                 | 1             | 1              | 2             | 512          | 21.44                 | 20.1 | 431.6     |
| ./speclibm/l1d.128kB_l1i.64kB   | 7.041481       | 0.121845                                   | 0.00002                                    | 0.999735                           | speclibm  | L1D/L1I Size      | 64         | 1               | 128               | 64                 | 1             | 1              | 2             | 512          | 21.44                 | 22.6 | 485.2     |
| ./speclibm/l1d.16kB_l1i.128kB   | 7.0435         | 0.12201                                    | 0.000019                                   | 0.99705                            | speclibm  | L1D/L1I Size      | 64         | 1               | 16                | 128                | 1             | 1              | 2             | 512          | 21.43                 | 18.9 | 404.5     |
| ./speclibm/l1d.16kB_l1i.16kB    | 7.043558       | 0.12201                                    | 0.000024                                   | 0.997021                           | speclibm  | L1D/L1I Size      | 64         | 1               | 16                | 16                 | 1             | 1              | 2             | 512          | 21.43                 | 10.1 | 217.0     |
| ./speclibm/l1d.16kB_l1i.32kB    | 7.046748       | 0.12201                                    | 0.000021                                   | 0.997037                           | speclibm  | L1D/L1I Size      | 64         | 1               | 16                | 32                 | 1             | 1              | 2             | 512          | 21.43                 | 11.4 | 243.8     |
| ./speclibm/l1d.16kB_l1i.64kB    | 7.046734       | 0.12201                                    | 0.00002                                    | 0.997043                           | speclibm  | L1D/L1I Size      | 64         | 1               | 16                | 64                 | 1             | 1              | 2             | 512          | 21.43                 | 13.9 | 297.4     |
| ./speclibm/l1d.32kB_l1i.128kB   | 7.042241       | 0.121913                                   | 0.000019                                   | 0.998637                           | speclibm  | L1D/L1I Size      | 64         | 1               | 32                | 128                | 1             | 1              | 2             | 512          | 21.44                 | 20.1 | 431.4     |
| ./speclibm/l1d.32kB_l1i.16kB    | 7.042301       | 0.121912                                   | 0.000024                                   | 0.998608                           | speclibm  | L1D/L1I Size      | 64         | 1               | 32                | 16                 | 1             | 1              | 2             | 512          | 21.44                 | 11.4 | 243.9     |
| ./speclibm/l1d.32kB_l1i.32kB    | 7.042268       | 0.121912                                   | 0.000021                                   | 0.998624                           | speclibm  | L1D/L1I Size      | 64         | 1               | 32                | 32                 | 1             | 1              | 2             | 512          | 21.44                 | 12.6 | 270.7     |
| ./speclibm/l1d.32kB_l1i.64kB    | 7.042241       | 0.121912                                   | 0.00002                                    | 0.99863                            | speclibm  | L1D/L1I Size      | 64         | 1               | 32                | 64                 | 1             | 1              | 2             | 512          | 21.44                 | 15.1 | 324.3     |
| ./speclibm/l1d.64kB_l1i.128kB   | 7.041767       | 0.12187                                    | 0.000019                                   | 0.999334                           | speclibm  | L1D/L1I Size      | 64         | 1               | 64                | 128                | 1             | 1              | 2             | 512          | 21.44                 | 22.6 | 485.1     |
| ./speclibm/l1d.64kB_l1i.16kB    | 7.041807       | 0.12187                                    | 0.000024                                   | 0.999305                           | speclibm  | L1D/L1I Size      | 64         | 1               | 64                | 16                 | 1             | 1              | 2             | 512          | 21.44                 | 13.9 | 297.5     |
| ./speclibm/l1d.64kB_l1i.32kB    | 7.041767       | 0.12187                                    | 0.000021                                   | 0.999322                           | speclibm  | L1D/L1I Size      | 64         | 1               | 64                | 32                 | 1             | 1              | 2             | 512          | 21.44                 | 15.1 | 324.3     |
| ./speclibm/l1d.64kB_l1i.64kB    | 7.041776       | 0.12187                                    | 0.00002                                    | 0.999327                           | speclibm  | L1D/L1I Size      | 64         | 1               | 64                | 64                 | 1             | 1              | 2             | 512          | 21.44                 | 17.6 | 377.9     |
| ./speclibm/l1d_assoc.1          | 7.042241       | 0.121912                                   | 0.00002                                    | 0.99863                            | speclibm  | L1D Associativity | 64         | 1               | 32                | 32                 | 1             | 1              | 2             | 512          | 21.44                 | 12.6 | 270.7     |
| ./speclibm/l1d_assoc.2          | 7.041284       | 0.121831                                   | 0.00002                                    | 0.999954                           | speclibm  | L1D Associativity | 64         | 1               | 32                | 32                 | 2             | 1              | 2             | 512          | 21.44                 | 15.1 | 324.3     |
| ./speclibm/l1d_assoc.4          | 7.041284       | 0.121829                                   | 0.00002                                    | 0.999973                           | speclibm  | L1D Associativity | 64         | 1               | 32                | 32                 | 4             | 1              | 2             | 512          | 21.44                 | 20.1 | 431.6     |
| ./speclibm/l1i_assoc.1          | 7.042241       | 0.121912                                   | 0.00002                                    | 0.99863                            | speclibm  | L1I Associativity | 64         | 1               | 32                | 32                 | 1             | 1              | 2             | 512          | 21.44                 | 12.6 | 270.7     |
| ./speclibm/l1i_assoc.2          | 7.042218       | 0.121913                                   | 0.000019                                   | 0.998638                           | speclibm  | L1I Associativity | 64         | 1               | 32                | 32                 | 1             | 2              | 2             | 512          | 21.44                 | 12.6 | 270.7     |
| ./speclibm/l1i_assoc.4          | 7.042256       | 0.121913                                   | 0.000019                                   | 0.998638                           | speclibm  | L1I Associativity | 64         | 1               | 32                | 32                 | 1             | 4              | 2             | 512          | 21.44                 | 12.6 | 270.7     |
| ./speclibm/l2d_assoc.1          | 7.042333       | 0.121912                                   | 0.00002                                    | 0.998668                           | speclibm  | L2D Associativity | 64         | 1               | 32                | 32                 | 1             | 1              | 1             | 512          | 21.44                 | 12.6 | 270.7     |
| ./speclibm/l2d_assoc.2          | 7.042241       | 0.121912                                   | 0.00002                                    | 0.99863                            | speclibm  | L2D Associativity | 64         | 1               | 32                | 32                 | 1             | 1              | 2             | 512          | 21.44                 | 12.6 | 270.7     |
| ./speclibm/l2d_assoc.4          | 7.042371       | 0.121913                                   | 0.00002                                    | 0.99863                            | speclibm  | L2D Associativity | 64         | 1               | 32                | 32                 | 1             | 1              | 4             | 512          | 21.44                 | 12.6 | 270.7     |
| ./speclibm/l2_size.1MB          | 7.041927       | 0.121912                                   | 0.00002                                    | 0.99863                            | speclibm  | L2 Size           | 64         | 1               | 32                | 32                 | 1             | 1              | 2             | 1024         | 21.44                 | 12.8 | 273.3     |
| ./speclibm/l2_size.256kB        | 7.042417       | 0.121912                                   | 0.00002                                    | 0.998631                           | speclibm  | L2 Size           | 64         | 1               | 32                | 32                 | 1             | 1              | 2             | 256          | 21.44                 | 12.6 | 269.3     |
| ./speclibm/l2_size.2MB          | 7.041123       | 0.121912                                   | 0.00002                                    | 0.99863                            | speclibm  | L2 Size           | 64         | 1               | 32                | 32                 | 1             | 1              | 2             | 2048         | 21.44                 | 13.0 | 278.7     |
| ./speclibm/l2_size.4MB          | 7.039496       | 0.121912                                   | 0.00002                                    | 0.99863                            | speclibm  | L2 Size           | 64         | 1               | 32                | 32                 | 1             | 1              | 2             | 4096         | 21.44                 | 13.5 | 289.4     |
| ./speclibm/l2_size.512kB        | 7.042241       | 0.121912                                   | 0.00002                                    | 0.99863                            | speclibm  | L2 Size           | 64         | 1               | 32                | 32                 | 1             | 1              | 2             | 512          | 21.44                 | 12.6 | 270.7     |
| ./specmcf/cacheline.128         | 1.088302       | 0.002858                                   | 0.000035                                   | 0.336438                           | specmcf   | Cache Line        | 128        | 1               | 32                | 32                 | 1             | 1              | 2             | 512          | 2.21                  | 17.6 | 39.0      |
| ./specmcf/cacheline.32          | 1.129462       | 0.00424                                    | 0.000037                                   | 0.696368                           | specmcf   | Cache Line        | 32         | 1               | 32                | 32                 | 1             | 1              | 2             | 512          | 2.47                  | 10.1 | 25.0      |
| ./specmcf/cacheline.64          | 1.102246       | 0.003232                                   | 0.000034                                   | 0.541189                           | specmcf   | Cache Line        | 64         | 1               | 32                | 32                 | 1             | 1              | 2             | 512          | 2.31                  | 12.6 | 29.2      |
| ./specmcf/cpu_clock.1GHz        | 1.102246       | 0.003232                                   | 0.000034                                   | 0.541189                           | specmcf   | CPU Frequency     | 64         | 1               | 32                | 32                 | 1             | 1              | 2             | 512          | 2.31                  | 12.6 | 29.2      |
| ./specmcf/l1d.128kB_l1i.128kB   | 1.097575       | 0.00222                                    | 0.000029                                   | 0.791926                           | specmcf   | L1D/L1I Size      | 64         | 1               | 128               | 128                | 1             | 1              | 2             | 512          | 2.30                  | 27.6 | 63.5      |
| ./specmcf/l1d.128kB_l1i.16kB    | 1.453474       | 0.002217                                   | 0.061155                                   | 0.027238                           | specmcf   | L1D/L1I Size      | 64         | 1               | 128               | 16                 | 1             | 1              | 2             | 512          | 3.26                  | 18.9 | 61.5      |
| ./specmcf/l1d.128kB_l1i.32kB    | 1.122811       | 0.00222                                    | 0.004668                                   | 0.250696                           | specmcf   | L1D/L1I Size      | 64         | 1               | 128               | 32                 | 1             | 1              | 2             | 512          | 2.36                  | 20.1 | 47.6      |
| ./specmcf/l1d.128kB_l1i.64kB    | 1.097653       | 0.00222                                    | 0.000035                                   | 0.789952                           | specmcf   | L1D/L1I Size      | 64         | 1               | 128               | 64                 | 1             | 1              | 2             | 512          | 2.30                  | 22.6 | 52.0      |
| ./specmcf/l1d.16kB_l1i.128kB    | 1.118355       | 0.007879                                   | 0.000029                                   | 0.230268                           | specmcf   | L1D/L1I Size      | 64         | 1               | 16                | 128                | 1             | 1              | 2             | 512          | 2.38                  | 18.9 | 44.9      |
| ./specmcf/l1d.16kB_l1i.16kB     | 1.472443       | 0.006699                                   | 0.061148                                   | 0.024828                           | specmcf   | L1D/L1I Size      | 64         | 1               | 16                | 16                 | 1             | 1              | 2             | 512          | 3.32                  | 10.1 | 33.6      |
| ./specmcf/l1d.16kB_l1i.32kB     | 1.144496       | 0.007879                                   | 0.004668                                   | 0.14081                            | specmcf   | L1D/L1I Size      | 64         | 1               | 16                | 32                 | 1             | 1              | 2             | 512          | 2.45                  | 11.4 | 27.8      |
| ./specmcf/l1d.16kB_l1i.64kB     | 1.118433       | 0.007879                                   | 0.000034                                   | 0.230099                           | specmcf   | L1D/L1I Size      | 64         | 1               | 16                | 64                 | 1             | 1              | 2             | 512          | 2.38                  | 13.9 | 33.0      |
| ./specmcf/l1d.32kB_l1i.128kB    | 1.102321       | 0.003232                                   | 0.000029                                   | 0.542108                           | specmcf   | L1D/L1I Size      | 64         | 1               | 32                | 128                | 1             | 1              | 2             | 512          | 2.31                  | 20.1 | 46.5      |
| ./specmcf/l1d.32kB_l1i.16kB     | 1.457086       | 0.00322                                    | 0.061152                                   | 0.026505                           | specmcf   | L1D/L1I Size      | 64         | 1               | 32                | 16                 | 1             | 1              | 2             | 512          | 3.27                  | 11.4 | 37.2      |
| ./specmcf/l1d.32kB_l1i.32kB     | 1.127802       | 0.003231                                   | 0.004668                                   | 0.217325                           | specmcf   | L1D/L1I Size      | 64         | 1               | 32                | 32                 | 1             | 1              | 2             | 512          | 2.38                  | 12.6 | 30.0      |
| ./specmcf/l1d.32kB_l1i.64kB     | 1.102246       | 0.003232                                   | 0.000034                                   | 0.541189                           | specmcf   | L1D/L1I Size      | 64         | 1               | 32                | 64                 | 1             | 1              | 2             | 512          | 2.31                  | 15.1 | 35.0      |
| ./specmcf/l1d.64kB_l1i.128kB    | 1.099474       | 0.002561                                   | 0.000029                                   | 0.682814                           | specmcf   | L1D/L1I Size      | 64         | 1               | 64                | 128                | 1             | 1              | 2             | 512          | 2.30                  | 22.6 | 52.1      |
| ./specmcf/l1d.64kB_l1i.16kB     | 1.454581       | 0.002554                                   | 0.061154                                   | 0.026834                           | specmcf   | L1D/L1I Size      | 64         | 1               | 64                | 16                 | 1             | 1              | 2             | 512          | 3.26                  | 13.9 | 45.3      |
| ./specmcf/l1d.64kB_l1i.32kB     | 1.124264       | 0.002561                                   | 0.004668                                   | 0.237184                           | specmcf   | L1D/L1I Size      | 64         | 1               | 64                | 32                 | 1             | 1              | 2             | 512          | 2.37                  | 15.1 | 35.8      |
| ./specmcf/l1d.64kB_l1i.64kB     | 1.099343       | 0.00256                                    | 0.000034                                   | 0.681334                           | specmcf   | L1D/L1I Size      | 64         | 1               | 64                | 64                 | 1             | 1              | 2             | 512          | 2.30                  | 17.6 | 40.6      |
| ./specmcf/l1d_assoc.1           | 1.102246       | 0.003232                                   | 0.000034                                   | 0.541189                           | specmcf   | L1D Associativity | 64         | 1               | 32                | 32                 | 1             | 1              | 2             | 512          | 2.31                  | 12.6 | 29.2      |
| ./specmcf/l1d_assoc.2           | 1.098104       | 0.00239                                    | 0.000034                                   | 0.737719                           | specmcf   | L1D Associativity | 64         | 1               | 32                | 32                 | 2             | 1              | 2             | 512          | 2.30                  | 15.1 | 34.8      |
| ./specmcf/l1d_assoc.4           | 1.097597       | 0.002278                                   | 0.000034                                   | 0.778095                           | specmcf   | L1D Associativity | 64         | 1               | 32                | 32                 | 4             | 1              | 2             | 512          | 2.30                  | 20.1 | 46.3      |
| ./specmcf/l1i_assoc.1           | 1.102246       | 0.003232                                   | 0.000034                                   | 0.541189                           | specmcf   | L1I Associativity | 64         | 1               | 32                | 32                 | 1             | 1              | 2             | 512          | 2.31                  | 12.6 | 29.2      |
| ./specmcf/l1i_assoc.2           | 1.102321       | 0.003232                                   | 0.000019                                   | 0.543669                           | specmcf   | L1I Associativity | 64         | 1               | 32                | 32                 | 1             | 2              | 2             | 512          | 2.31                  | 12.6 | 29.2      |
| ./specmcf/l1i_assoc.4           | 1.102243       | 0.003232                                   | 0.000019                                   | 0.543695                           | specmcf   | L1I Associativity | 64         | 1               | 32                | 32                 | 1             | 4              | 2             | 512          | 2.31                  | 12.6 | 29.2      |
| ./specmcf/l2d_assoc.1           | 1.103617       | 0.003232                                   | 0.000034                                   | 0.565427                           | specmcf   | L2D Associativity | 64         | 1               | 32                | 32                 | 1             | 1              | 1             | 512          | 2.32                  | 12.6 | 29.3      |
| ./specmcf/l2d_assoc.2           | 1.102246       | 0.003232                                   | 0.000034                                   | 0.541189                           | specmcf   | L2D Associativity | 64         | 1               | 32                | 32                 | 1             | 1              | 2             | 512          | 2.31                  | 12.6 | 29.2      |
| ./specmcf/l2d_assoc.4           | 1.102084       | 0.003232                                   | 0.000034                                   | 0.535115                           | specmcf   | L2D Associativity | 64         | 1               | 32                | 32                 | 1             | 1              | 4             | 512          | 2.31                  | 12.6 | 29.2      |
| ./specmcf/l2_size.1MB           | 1.099771       | 0.003231                                   | 0.000034                                   | 0.497559                           | specmcf   | L2 Size           | 64         | 1               | 32                | 32                 | 1             | 1              | 2             | 1024         | 2.29                  | 12.8 | 29.3      |
| ./specmcf/l2_size.256kB         | 1.104293       | 0.003232                                   | 0.000034                                   | 0.57408                            | specmcf   | L2 Size           | 64         | 1               | 32                | 32                 | 1             | 1              | 2             | 256          | 2.32                  | 12.6 | 29.2      |
| ./specmcf/l2_size.2MB           | 1.09768        | 0.003231                                   | 0.000034                                   | 0.464776                           | specmcf   | L2 Size           | 64         | 1               | 32                | 32                 | 1             | 1              | 2             | 2048         | 2.28                  | 13.0 | 29.7      |
| ./specmcf/l2_size.4MB           | 1.097524       | 0.003231                                   | 0.000034                                   | 0.461612                           | specmcf   | L2 Size           | 64         | 1               | 32                | 32                 | 1             | 1              | 2             | 4096         | 2.28                  | 13.5 | 30.8      |
| ./specmcf/l2_size.512kB         | 1.102246       | 0.003232                                   | 0.000034                                   | 0.541189                           | specmcf   | L2 Size           | 64         | 1               | 32                | 32                 | 1             | 1              | 2             | 512          | 2.31                  | 12.6 | 29.2      |
| ./specsjeng/cacheline.128       | 1.243045       | 0.005824                                   | 0.000118                                   | 0.013793                           | specsjeng | Cache Line        | 128        | 1               | 32                | 32                 | 1             | 1              | 2             | 512          | 2.31                  | 17.6 | 40.7      |
| ./specsjeng/cacheline.32        | 1.225318       | 0.00658                                    | 0.000176                                   | 0.039736                           | specsjeng | Cache Line        | 32         | 1               | 32                | 32                 | 1             | 1              | 2             | 512          | 2.32                  | 10.1 | 23.5      |
| ./specsjeng/cacheline.64        | 1.232385       | 0.005777                                   | 0.000136                                   | 0.024803                           | specsjeng | Cache Line        | 64         | 1               | 32                | 32                 | 1             | 1              | 2             | 512          | 2.31                  | 12.6 | 29.1      |
| ./specsjeng/cpu_clock.1GHz      | 1.232385       | 0.005777                                   | 0.000136                                   | 0.024803                           | specsjeng | CPU Frequency     | 64         | 1               | 32                | 32                 | 1             | 1              | 2             | 512          | 2.31                  | 12.6 | 29.1      |
| ./specsjeng/l1d.128kB_l1i.128kB | 1.188863       | 0.001493                                   | 0.000123                                   | 0.093507                           | specsjeng | L1D/L1I Size      | 64         | 1               | 128               | 128                | 1             | 1              | 2             | 512          | 2.22                  | 27.6 | 61.3      |
| ./specsjeng/l1d.128kB_l1i.16kB  | 1.191855       | 0.001493                                   | 0.001184                                   | 0.075247                           | specsjeng | L1D/L1I Size      | 64         | 1               | 128               | 16                 | 1             | 1              | 2             | 512          | 2.24                  | 18.9 | 42.3      |
| ./specsjeng/l1d.128kB_l1i.32kB  | 1.190126       | 0.001493                                   | 0.000624                                   | 0.082375                           | specsjeng | L1D/L1I Size      | 64         | 1               | 128               | 32                 | 1             | 1              | 2             | 512          | 2.23                  | 20.1 | 44.9      |
| ./specsjeng/l1d.128kB_l1i.64kB  | 1.188898       | 0.001493                                   | 0.000135                                   | 0.093236                           | specsjeng | L1D/L1I Size      | 64         | 1               | 128               | 64                 | 1             | 1              | 2             | 512          | 2.22                  | 22.6 | 50.2      |
| ./specsjeng/l1d.16kB_l1i.128kB  | 1.25907        | 0.008332                                   | 0.000123                                   | 0.017301                           | specsjeng | L1D/L1I Size      | 64         | 1               | 16                | 128                | 1             | 1              | 2             | 512          | 2.36                  | 18.9 | 44.5      |
| ./specsjeng/l1d.16kB_l1i.16kB   | 1.26144        | 0.008331                                   | 0.001198                                   | 0.017738                           | specsjeng | L1D/L1I Size      | 64         | 1               | 16                | 16                 | 1             | 1              | 2             | 512          | 2.37                  | 10.1 | 24.0      |
| ./specsjeng/l1d.16kB_l1i.32kB   | 1.259834       | 0.008332                                   | 0.000627                                   | 0.016907                           | specsjeng | L1D/L1I Size      | 64         | 1               | 16                | 32                 | 1             | 1              | 2             | 512          | 2.36                  | 11.4 | 26.9      |
| ./specsjeng/l1d.16kB_l1i.64kB   | 1.259123       | 0.008332                                   | 0.000136                                   | 0.017308                           | specsjeng | L1D/L1I Size      | 64         | 1               | 16                | 64                 | 1             | 1              | 2             | 512          | 2.36                  | 13.9 | 32.7      |
| ./specsjeng/l1d.32kB_l1i.128kB  | 1.232337       | 0.005777                                   | 0.000123                                   | 0.024805                           | specsjeng | L1D/L1I Size      | 64         | 1               | 32                | 128                | 1             | 1              | 2             | 512          | 2.31                  | 20.1 | 46.4      |
| ./specsjeng/l1d.32kB_l1i.16kB   | 1.234974       | 0.005777                                   | 0.001194                                   | 0.024719                           | specsjeng | L1D/L1I Size      | 64         | 1               | 32                | 16                 | 1             | 1              | 2             | 512          | 2.32                  | 11.4 | 26.4      |
| ./specsjeng/l1d.32kB_l1i.32kB   | 1.233326       | 0.005777                                   | 0.000626                                   | 0.023957                           | specsjeng | L1D/L1I Size      | 64         | 1               | 32                | 32                 | 1             | 1              | 2             | 512          | 2.31                  | 12.6 | 29.2      |
| ./specsjeng/l1d.32kB_l1i.64kB   | 1.232385       | 0.005777                                   | 0.000136                                   | 0.024803                           | specsjeng | L1D/L1I Size      | 64         | 1               | 32                | 64                 | 1             | 1              | 2             | 512          | 2.31                  | 15.1 | 34.9      |
| ./specsjeng/l1d.64kB_l1i.128kB  | 1.20848        | 0.003468                                   | 0.000123                                   | 0.04119                            | specsjeng | L1D/L1I Size      | 64         | 1               | 64                | 128                | 1             | 1              | 2             | 512          | 2.26                  | 22.6 | 51.1      |
| ./specsjeng/l1d.64kB_l1i.16kB   | 1.211472       | 0.003468                                   | 0.001188                                   | 0.039241                           | specsjeng | L1D/L1I Size      | 64         | 1               | 64                | 16                 | 1             | 1              | 2             | 512          | 2.28                  | 13.9 | 31.6      |
| ./specsjeng/l1d.64kB_l1i.32kB   | 1.209716       | 0.003468                                   | 0.000624                                   | 0.03889                            | specsjeng | L1D/L1I Size      | 64         | 1               | 64                | 32                 | 1             | 1              | 2             | 512          | 2.27                  | 15.1 | 34.3      |
| ./specsjeng/l1d.64kB_l1i.64kB   | 1.20854        | 0.003468                                   | 0.000135                                   | 0.041163                           | specsjeng | L1D/L1I Size      | 64         | 1               | 64                | 64                 | 1             | 1              | 2             | 512          | 2.26                  | 17.6 | 39.8      |
| ./specsjeng/l1d_assoc.1         | 1.232385       | 0.005777                                   | 0.000136                                   | 0.024803                           | specsjeng | L1D Associativity | 64         | 1               | 32                | 32                 | 1             | 1              | 2             | 512          | 2.31                  | 12.6 | 29.1      |
| ./specsjeng/l1d_assoc.2         | 1.188          | 0.002368                                   | 0.000136                                   | 0.059327                           | specsjeng | L1D Associativity | 64         | 1               | 32                | 32                 | 2             | 1              | 2             | 512          | 2.23                  | 15.1 | 33.7      |
| ./specsjeng/l1d_assoc.4         | 1.185092       | 0.002029                                   | 0.000135                                   | 0.068988                           | specsjeng | L1D Associativity | 64         | 1               | 32                | 32                 | 4             | 1              | 2             | 512          | 2.22                  | 20.1 | 44.7      |
| ./specsjeng/l1i_assoc.1         | 1.232385       | 0.005777                                   | 0.000136                                   | 0.024803                           | specsjeng | L1I Associativity | 64         | 1               | 32                | 32                 | 1             | 1              | 2             | 512          | 2.31                  | 12.6 | 29.1      |
| ./specsjeng/l1i_assoc.2         | 1.232289       | 0.005777                                   | 0.000102                                   | 0.024716                           | specsjeng | L1I Associativity | 64         | 1               | 32                | 32                 | 1             | 2              | 2             | 512          | 2.31                  | 12.6 | 29.1      |
| ./specsjeng/l1i_assoc.4         | 1.232261       | 0.005777                                   | 0.000082                                   | 0.024751                           | specsjeng | L1I Associativity | 64         | 1               | 32                | 32                 | 1             | 4              | 2             | 512          | 2.31                  | 12.6 | 29.1      |
| ./specsjeng/l2d_assoc.1         | 1.232709       | 0.00578                                    | 0.000136                                   | 0.026973                           | specsjeng | L2D Associativity | 64         | 1               | 32                | 32                 | 1             | 1              | 1             | 512          | 2.31                  | 12.6 | 29.1      |
| ./specsjeng/l2d_assoc.2         | 1.232385       | 0.005777                                   | 0.000136                                   | 0.024803                           | specsjeng | L2D Associativity | 64         | 1               | 32                | 32                 | 1             | 1              | 2             | 512          | 2.31                  | 12.6 | 29.1      |
| ./specsjeng/l2d_assoc.4         | 1.232297       | 0.005777                                   | 0.000136                                   | 0.024254                           | specsjeng | L2D Associativity | 64         | 1               | 32                | 32                 | 1             | 1              | 4             | 512          | 2.31                  | 12.6 | 29.1      |
| ./specsjeng/l2_size.1MB         | 1.232279       | 0.005777                                   | 0.000136                                   | 0.024129                           | specsjeng | L2 Size           | 64         | 1               | 32                | 32                 | 1             | 1              | 2             | 1024         | 2.31                  | 12.8 | 29.4      |
| ./specsjeng/l2_size.256kB       | 1.233336       | 0.005781                                   | 0.000136                                   | 0.030449                           | specsjeng | L2 Size           | 64         | 1               | 32                | 32                 | 1             | 1              | 2             | 256          | 2.31                  | 12.6 | 29.0      |
| ./specsjeng/l2_size.2MB         | 1.232279       | 0.005777                                   | 0.000136                                   | 0.024129                           | specsjeng | L2 Size           | 64         | 1               | 32                | 32                 | 1             | 1              | 2             | 2048         | 2.31                  | 13.0 | 30.0      |
| ./specsjeng/l2_size.4MB         | 1.232279       | 0.005777                                   | 0.000136                                   | 0.024129                           | specsjeng | L2 Size           | 64         | 1               | 32                | 32                 | 1             | 1              | 2             | 4096         | 2.31                  | 13.5 | 31.1      |
| ./specsjeng/l2_size.512kB       | 1.232385       | 0.005777                                   | 0.000136                                   | 0.024803                           | specsjeng | L2 Size           | 64         | 1               | 32                | 32                 | 1             | 1              | 2             | 512          | 2.31                  | 12.6 | 29.1      |

Από τον πίνακα αυτόν συμπεραίνουμε ότι οι καλύτεροι συνδυασμοί με βάση τις παραπάνω εμπειρικές συναρτήσεις για κάθε benchmark είναι:

| Benchmark | Cache line | Frequency [GHz] | L1 Data Size [kB] | L1 Instr Size [kB] | L1 Data Assoc | L1 Instr Assoc | L2 Data Assoc | L2 Size [kB] |
|-----------|------------|-----------------|-------------------|--------------------|---------------|----------------|---------------|--------------|
| specbzip  | 64         | 1               | 16                | 16                 | 1             | 1              | 2             | 512          |
| spechmmer | 64         | 1               | 16                | 16                 | 1             | 1              | 2             | 512          |
| speclibm  | 64         | 1               | 16                | 16                 | 1             | 1              | 2             | 512          |
| specmcf   | 32         | 1               | 32                | 32                 | 1             | 1              | 2             | 512          |
| specsjeng | 32         | 1               | 32                | 32                 | 1             | 1              | 2             | 512          |
