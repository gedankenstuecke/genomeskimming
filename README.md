# Genome Skimming
This repository contains the scripts used for generating and analysing the data for the paper *Potential and pitfalls of eukaryotic metagenome skimming: A test case for lichens*. 

## Requirements
I used [*MIRA*](mira-assembler.sourceforge.net), [*Omega*](http://omega.omicsbio.org/), [*sga*](https://github.com/jts/sga), [*SPAdes*](http://bioinf.spbau.ru/spades), [*Velvet/Optimiser*](https://github.com/tseemann/VelvetOptimiser) and [*MetaVelvet*](metavelvet.dna.bio.keio.ac.jp), which you should have installed if you want to recreate the whole analysis. Besides that's the various scripts for generating the data and analysing the assemblies will have their own dependencies: 

- Python 2.x
 - [BioPython](http://biopython.org/wiki/Main_Page)
 - [Pysam](http://biopython.org/wiki/Main_Page)
- [ART](http://www.niehs.nih.gov/research/resources/software/biostatistics/art/)
- [FLASH](ccb.jhu.edu/software/FLASH/)
- [bbmap](bbmap.sourceforge.net)
- [QUAST](http://quast.bioinf.spbau.ru/)
- 
## Structure

### 00-simulate_reads
This folder contains the files needed to generate twin data sets for the lichen *Cladonia grayi* and its photobiont *Asterochloris sp.*

### 01-assemble
Contains the configuration files for the different assemblers evaluated and also the scripts necessary for preprocessing the data where needed. 

### 02-quast-chimeras
The scripts for analysing the resulting assemblies and scanning for chimeric contigs. 
