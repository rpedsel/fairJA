set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 16.1767, <2> 11.6305, <3> 3.6583, <4> 29.0771, <5> 1.655, <6> 26.732, <7> 37.2423, <8> 23.775, <9> 37.2274, <10> 39.3845, <11> 41.8818, <12> 29.5035, <13> 14.0694, <14> 26.351, <15> 42.6741, <16> 37.3315, <17> 14.9765, <18> 2.8249, <19> 42.1278, <20> 49.351;
param workload[JOB] := <1> 4.022, <2> 3.4104, <3> 1.9127, <4> 5.3923, <5> 1.2865, <6> 5.1703, <7> 6.1026, <8> 4.876, <9> 6.1014, <10> 6.2757, <11> 6.4716, <12> 5.4317, <13> 3.7509, <14> 5.1333, <15> 6.5325, <16> 6.11, <17> 3.8699, <18> 1.6807, <19> 6.4906, <20> 7.025;
param capacity[MACHINE] := <1> 97.0461, <2> 97.0461, <3> 97.0461, <4> 97.0461, <5> 97.0461, <6> 97.0461;

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
