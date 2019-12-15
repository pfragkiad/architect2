# 1η Εργασία Αρχιτεκτονικής Υπολογιστών (Ομάδα 2)

_Ραφαήλ Μπουλογεώργος, ΑΕΜ: 9186_

_Παύλος Φραγκιαδουλάκης, ΑΕΜ: 8389_

## Προεργασία
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
  * L1 Data/Instruction Size [kB]: 128/128, 128/64, 32/128, **32/64**, 64/128, 64/64
  * L2 Size [kB]: **512**, 1024, 2048, 4096
  * L1 Instruction Associativity: **1**, 2, 4
  * L1 Data Associativity: **1**, 2, 4
  * L2 Data Associativity: 1, **2**, 4
  
 Στα παραπάνω, με έντονη γραμματοσειρά σημειώνονται οι default τιμές.
  
