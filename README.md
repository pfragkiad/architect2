# 1η Εργασία Αρχιτεκτονικής Υπολογιστών (Ομάδα 2)

_Παύλος Φραγκιαδουλάκης, ΑΕΜ: 8389_

_Ραφαήλ Μπουλογεώργος, ΑΕΜ: 9186_

## Προεργασία
Με βάση τη διατύπωση της εργασίας, αποσυμπιέστηκε το αρχείο _spec_cpu2006_gem5.tar.gz_ στον φάκελο εγκατάστασης του gem5. Για την μαζικό compiling και των 5 targets των benchmarks, γράφτηκε ένα νέο makefile στον φάκελο _spec_spu2006_ (στον οποίο βρίσκονται οι υποφάκελοι):
```makefile
SUBDIRS := $(wildcard */src)

all: $(SUBDIRS)
$(SUBDIRS):
	$(MAKE) -C $@

.PHONY: all $(SUBDIRS)
```
Έτσι, με κλήση του make στον φάκελο _spec_spu2006_ έχουμε δημιουργία όλων των εκτελέσιμων αρχείων.


## Ερώτημα 1: Παράμετροι του starter_se.py
