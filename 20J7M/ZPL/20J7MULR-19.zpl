set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 33.1142, <2> 41.7443, <3> 46.3552, <4> 31.847, <5> 8.382, <6> 43.0801, <7> 31.9648, <8> 26.8882, <9> 14.4778, <10> 15.8799, <11> 23.3889, <12> 5.849, <13> 9.2373, <14> 0.6713, <15> 4.2565, <16> 47.5819, <17> 31.4213, <18> 48.1369, <19> 23.7888, <20> 1.2479;
param workload[JOB] := <1> 37.5632, <2> 8.1983, <3> 49.5861, <4> 2.6585, <5> 4.8912, <6> 34.1732, <7> 23.1161, <8> 8.3139, <9> 20.5593, <10> 0.9389, <11> 23.452, <12> 4.3203, <13> 46.9453, <14> 0.0711, <15> 28.0586, <16> 9.8277, <17> 7.9494, <18> 4.6491, <19> 29.6348, <20> 46.0258;
param capacity[MACHINE] := <1> 55.8475, <2> 55.8475, <3> 55.8475, <4> 55.8475, <5> 55.8475, <6> 55.8475, <7> 55.8475;

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
