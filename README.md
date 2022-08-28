# DSP-on-FPGA Workshop

This directory holds all the necessary information for the DSP-on-FPGA Workshop, which uses a DSP on an FPGA to implement an audio equalizer.

## Motivation

The purpose of this workshop is to introduce to students how to:

1. Correctly design and simulate DSP solutions that have desirable filter properties and resource constraints
2. Understand differences in signal properties between FIR and IIR filters and when one or the other should be used
3. Map a DSP solution to a hardware platform using symmetries in filter structures
4. Implement DSP solution on an FPGA using VHDL and concepts such as fixed-point math and pipelining
5. Test the functionality of the solution using VHDL benchtests and benchtop testing

## Problem Statement

A customer wants a high-fidelity and low-latency audio equalizer running on an FPGA design. An audio equalizer is essentially a series of bandpass filters used to fine-tune the frequency contents of an audio input (for reference: https://www.youtube.com/watch?v=GXIkWiB09rw). Our design must meet the following specifications:

1. 12-bit audio
2. 48 kHz sampling rate
3. Audio latency of under 15 milliseconds
4. 8 filters to fine-tune frequency response (cutoffs: 0 Hz, 125 Hz, 250 Hz, 500 Hz, 1000 Hz, 2000 Hz, 4000 Hz, 8000 Hz)
5. Filter magnitude response adjustable between -12 dB and 12 dB
6. Passband ripple not exceeding 1 dB
6. Easy to use user interface

## Workshop Outline

Much of the work on the FPGA has been done already. The students must implement the DSP portion of the design to finalize the solution. To do this, the student must do the following:

1. Design a linear phase FIR bandpass filter and simulate its frequency properties using fixed-point math
2. Generalize the filter structure so that each of the 8 filters can store their unique taps
3. Utilize the "generate" keyword and pipelinig to implement the generic FIR structure with VHDL and use a VHDL benchtest to verify functionality
4. Implement and test FIFO buffer with VHDL to act as input to filter structures
5. Implement variable gain amplifiers with VHDL
6. Integrate the FIR filter into the larger design and verify functionality using audio test

## References

* This workshop was based off the following webpage: https://www.controlpaths.com/2021/06/28/audio-equalizer-based-on-fir-filters/
* The following was used as reference for the equalizer design: https://s2.smu.edu/~cd/EE2170/Labs/EQ.htm
