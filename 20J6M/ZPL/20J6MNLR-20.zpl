set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 27.6947, <2> 23.1405, <3> 22.3034, <4> 24.2376, <5> 37.7566, <6> 17.2676, <7> 20.008, <8> 24.2927, <9> 27.2822, <10> 32.7671, <11> 23.2854, <12> 25.1639, <13> 20.5246, <14> 22.0318, <15> 28.3024, <16> 26.6019, <17> 15.5657, <18> 16.9982, <19> 29.4402, <20> 20.2693;
param workload[JOB] := <1> 45.5389, <2> 16.3443, <3> 35.1243, <4> 4.1204, <5> 7.9931, <6> 21.9436, <7> 13.2121, <8> 23.518, <9> 21.6421, <10> 17.6993, <11> 11.1335, <12> 23.9702, <13> 26.0103, <14> 6.7971, <15> 6.8601, <16> 49.1101, <17> 20.1602, <18> 44.6614, <19> 13.0613, <20> 8.8064;
param capacity[MACHINE] := <1> 69.6178, <2> 69.6178, <3> 69.6178, <4> 69.6178, <5> 69.6178, <6> 69.6178;

var x[JM];
var z;
maximize minBenefit: z;
subto Z:
   forall <m> in MACHINE do
      sum <j> in JOB : benefit[j] * x[j,m] >= z;
subto K:
   forall <m> in MACHINE do
      sum <j> in JOB : workload[j] * x[j,m] <= capacity[m];
subto X:
   forall <j> in JOB do
      sum <m> in MACHINE : x[j,m] <= 1;
subto A:
   forall <j,m> in JM do
      x[j,m] >= 0;
