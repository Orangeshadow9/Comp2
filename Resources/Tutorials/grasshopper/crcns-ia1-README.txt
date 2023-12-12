==================================================
Locusta Migratoria auditory receptor cell data set
==================================================

:Author: Ariel Rokem
:Contact: arokem@berkeley.edu
:Date: 2009-04-19

Introduction
============

This data repository contains two data sets of recordings done by Ariel Rokem
at the Institute for Theoretical Biology, Humbolt University, Berlin, in the
Laboratory of Andreas Herz (Now at the LMU, Munich). The first data set
('Data1') was collected in the Spring of 2003. Analysis of this data has been
published in the following journal articles:

- A. Rokem, S. Watzl, T. Gollisch, M. Stemmler, A.V.M. Herz and I. Samengo
  (2006). Spike-Timing Precision Underlies the Coding Efficiency of Auditory
  Receptor Neurons. Journal of Neurophysiology 95: 2541-2552.

- H.G. Eyherabide, A. Rokem, A.V.M. Herz and I. Samengo (2008). Burst Firing as
  a Neural Code in an Insect Auditory System. Frontiers in Computational
  Neuroscience, 3:1.
  
- H.G. Eyherabide, A. Rokem, A.V.M. Herz, I. Samengo (2009). Bursts generate a
  non-reducible spike-pattern code. Frontiers in Neuroscience, 3: 8-14

Additional information about the stimuli used can be found in this paper: 

- CK Machens and MB Stemmler and P Prinz and R Krahe and B Ronacher and AV Herz
  (2001). Representation of acoustic communication signals by insect auditory
  receptor neurons. Journal of Neuroscience 21:3215:3227  
  
The second data set ('Data2') was collected in the summer of 2004. This data
has not been previously published. Similar experimental methods were used in
collecting both of these data sets, so the following methods section applies to
both data sets. 

How to get started
==================

In order to get started analyzing these data sets, read this document. The
first section contains information about the methods used in order to collect
the data and is based on text which appears in Rokem et al. (2006).
Further information is provided below about the data structure. Further
information is provided specifically for each of the data sets. Information is
also provided about the stimuli used in the experiments. Please also read the
conditions of use (in CONDITION.txt).


Description of experimental conditions/experimental paradigms etc.
==================================================================

Experiments were conducted on adult male and female Locusta migratoria. Their
legs, wings, head, gut, and dorsal part of the thorax were removed. Once the
animal was fixed with wax onto a Peltier element that was heated to a constant
temperature of 30C, the metathoracic ganglion and tympanal nerve were
exposed. Action potentials were recorded intracellularly from the axons of
auditory receptors located in the tympanal nerve using standard glass
micro-electrodes (borosilicate; GC100F-10, Harvard Apparatus, Edenbridge, UK)
filled with 1 M KCl solution (30-100 MOhm resistance). The signal was amplified
(BRAMP-01, NPI Electronic, Tamm, Germany) and recorded by a data acquisition
board (PCI-MIO-16E-1, National Instruments, Austin, TX) with a sampling rate of
10 kHz (for Data1) and 20 kHz (for Data2). Detection of action potentials and
generation of the stimuli were controlled by OEL (on-line electrophysiology
laboratory, http://relacs.sourceforge.net/), a custom-made software (but see
below about off-line spike detection for Data1). All experiments were conducted
in a Faraday's cage lined with sound- attenuating foam to reduce echoes. The
preparation was placed between two loudspeakers (Esotec D-260, Dynaudio,
Skanderborg, Denmark, on a DCA450 amplifier, Denon Electronic, Ratingen,
Germany), 60 cm from one another. The stimuli were transmitted to the
loudspeakers by a data acquisition board at a conversion rate of 100 kHz and
played only from the speaker ipsilateral to the nerve that was being monitored.
Experiments were conducted on both high-frequency and low-frequency cells. At
the beginning of each experiment, the best frequency of the cell was
determined, by determening the f-I curve of the cell at several different
frequencies. The experiments that followed were conducted using a pure tone in
the cell's preferred frequency.

Data structure
==============
Both data sets contain data directories, as well as a directory containing the
stimuli used in collecting the data.

Data directories are named something like: 03-01-15-aa, where the date-string
references the date in which the recording was done and the letter-string
indicates the serial order of recordings on that date. These directories
contain many different files, some of which are the result of previous analysis
of the data. The raw data, in the form of spike times is in the files named
*_spikes.dat and *_long.dat (or *longStimulation_spikes.dat in Data2). These
files contain the spike times in micro-seconds, relative to the stimulus
trigger. In files containing data from multiple trials, subsequent trials are
separated by a header, which looks like this:

# repro call number: 0
# mode: 3
# signal: 1
# stimulus file: /extra/setup/oel/stimuli/receptorInfo/gauss_st6_co200.dat
# carrier freq (kHz): 1.76777
# stimulus length (msec): 1000
# pause between stimuli (msec): 650
# length of ramp (usec): 1000
# desired firing rate (Hz): 150
# standard deviation (dB): 6
# cut-off frequency (Hz): 200
# repetition number: 1
# duration (msec): 1000
# intensity (dB): 77.3958

where the different fields are:

- repro call number: not important.
- mode: not important.
- signal: the serial number of the signal within the experiment (that is, was
  this the first stimulus displayed or the second one, or in Data2, the third).
- the stimulus file (telling you which stimulus was used, the file names here
  are the same as used in the 'stimuli' directory).
- carrier frequency: the carrier frequency of the stimulus.
- pause between stimuli: the duration of the inter-trial interval.
- length of ramp: the stimuli were ramped in during this duration at the
  beginning of each stimulus presentation
- desired firing rate: stimulus intensity was set to achieve firing at this
  rate.
- standard deviation: the standard deviation of the amplitude modulation
  distribution.
- cut-off frequency: the cut-off frequency of the stimulus amplitude modulation
  rate.
- repetition number: trial no
- duration: how much of the stimulus was presented, where 1000 msec means that
  only the first 1000 msec of the stimulus were presented in this trial.
- intensity: at what intensity was the stimulus presented. This is the
  *maximal* intensity used in the experiment! Stimuli spanned 6 standard
  deviations around the mean, so this is mean + 3 * std. 

Methods pertaining specifically to Data1:
=========================================

In each experiment, two different stimuli were presented in an interleaved
fashion. The stimuli consisted of random amplitude modulations of the carrier
frequency from a distribution of controlled shape, standard deviation and
cut-off frequency (see Machens et al., 2001). The stimuli used are also
included in the data set, see `stimuli`, below.

After determining the cell's preferred frequency, the intensities at which the
stimuli were to be presented in order to achieve the desired firing rate were
determined. Each stimulus was played in several different amplitudes until the
target firing frequency was traversed and then the target amplitude was
determined by interpolating between the two points adjacent to the target
firing rate.

After the intensities were determined, the experiment started. The first
presentation of the stimulus was a long presentation of ten seconds. The spike
times of spikes emitted during this presentation are recorded in the files
named '_long'. Thereafter, the first 1000 msec of the stimulus were presented
multiple times (varying between 98 trials and 533 trials). These spikes are
recorded in the files named '_spikes'.

A summary of the experiment also appears in the file named 'cell.dat'. This file
tells you which two stimuli were used in the experiment and what intensity they
were played at (again, this is the *maximal* intensity). This file also tells you which other experiments contain data
from the same cell (see below).  

In this data set, in those experiments where action potential detection by the
software was deemed to be inexact, the voltage traces were inspected and
off-line spike detection was performed. Experiments in which this is the case
will not have the above header, but rather will have a header which might look
something like this:

# OFFOEL HEADER
# duration (msec): 1000
# repetition number : 1
#

In these cases, data about the experiment can be derived from the 'cell.dat'
file.

Same cell, different experiment
-------------------------------

In some cases, more than one comparison was done on a single cell. The file
singlecells.txt contains a record of this. Each row in this file is a single
cell. For example:

03-03-05-ab ac

means that the data in both 03-03-05-ab and in 03-03-05-ac are taken from the
same cell - the electrode was not moved between these two recordings. 

Stimuli
-------

Stimulus files are stored in the 'stimuli' directory. Each file
contains two columns, where the first is time (in micro-seconds) and the second
column is the stimulus in volts. In order to transform the stimulus to dB,
please use the attached Matlab script, 'stimtodB.m'. If you don't have Matlab,
don't worry - the file is short and self-explanatory. Notice that the stimulus
is sample in 20 kHz (50 usec intervals). The stimuli are 10 seconds long and
were presented in their entirety only in the initial long presentation. In the
1 second trials, only the first second of the stimulus was presented.

Methods pertaining specifically to Data2:
=========================================

The directory structure in this data set is the same as in Data1. However, in
these experiments, nine different stimuli were used, with standard deviations
3,6 and 12 and cut-off frequencies of 100,200 and 300 Hz. In each experiment,
one standard deviation was presented with the three different cut-off
frequencies. Thus, three different stimuli were presented in an interleaved
fashion. For that reason, each directory here contains three '_spikes'
files. In different experiments, different desired firing rates were chosen
(50,100 and 200 Hz).

As before, stimuli were presented in the cell's preferred frequency. In this
data set, no offline spike detection was done, so the headers always contain
all the information about the experiment. On the other hand, there are no
'cell.dat' files. Files with the extension '.inf' were saved by OEL as part of
the data acquisition. However, the information contained in those files *should
not be trusted*. As before, before the experiment started, the best frequency
of the cell was determined. This process was saved for only part of the cells,
but happened in all cases. The stimulus intenisty was also determined in a
pre-experiment procedure, in which each stimulus was played in several
different amplitudes until the target firing frequency was traversed and then
the target amplitude was determined by interpolating between the two points
adjacent to the target firing rate. The data used in this process is saved in
the files whose names end with '_fi.dat': first column: intensity, second
column: firing rate.
 
Same cell, different experiment
-------------------------------

Here too, in some cases, more than one comparison was done on a single cell. As
before, the file 'singlecells.txt' contains a record of this, where each row in
this file is a single cell. In addition, the file 'cells.txt' has some
information on which experiments were conducted on one and the same animal. The
file 'cells_trials.txt' contains information on what stimulus was used in each
experiment and how many trials were recorded. The first column is the directory
indetifier, the second column indicates which stimulus was used and what firing
rate was desired (where 3-50 is std = 3 and firing rate was 50 Hz), the third
column is the number of trials recorded in this condition.


Stimuli
-------

Here too, stimuli are provided in a separate directory. The stimuli are
provided in the same format as above and a script called 'stimtodB.m' can be
used in order to transform the data to dB.
