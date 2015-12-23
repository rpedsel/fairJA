set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 37.4364, <2> 47.812, <3> 18.3177, <4> 11.6572, <5> 22.8087, <6> 13.249, <7> 22.984, <8> 8.6065, <9> 34.8032, <10> 41.3052, <11> 8.208, <12> 10.7932, <13> 47.0495, <14> 10.2854, <15> 40.8654, <16> 49.5473, <17> 26.0816, <18> 2.6649, <19> 3.0234, <20> 33.6633;
param workload[JOB] := <1> 6.1185, <2> 6.9146, <3> 4.2799, <4> 3.4143, <5> 4.7758, <6> 3.6399, <7> 4.7942, <8> 2.9337, <9> 5.8994, <10> 6.4269, <11> 2.865, <12> 3.2853, <13> 6.8593, <14> 3.2071, <15> 6.3926, <16> 7.039, <17> 5.107, <18> 1.6325, <19> 1.7388, <20> 5.802;
param capacity[MACHINE] := <1> 13.3037, <2> 13.3037, <3> 13.3037, <4> 13.3037, <5> 13.3037, <6> 13.3037, <7> 13.3037;

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
