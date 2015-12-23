set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 31.5967, <2> 32.203, <3> 44.8131, <4> 6.6948, <5> 45.8324, <6> 34.4489, <7> 4.3813, <8> 32.8076, <9> 33.4548, <10> 23.3489, <11> 38.3601, <12> 2.1835, <13> 26.1905, <14> 10.3179, <15> 8.2167, <16> 21.588, <17> 41.3444, <18> 4.177, <19> 32.2763, <20> 9.1713;
param workload[JOB] := <1> 31.5967, <2> 32.203, <3> 44.8131, <4> 6.6948, <5> 45.8324, <6> 34.4489, <7> 4.3813, <8> 32.8076, <9> 33.4548, <10> 23.3489, <11> 38.3601, <12> 2.1835, <13> 26.1905, <14> 10.3179, <15> 8.2167, <16> 21.588, <17> 41.3444, <18> 4.177, <19> 32.2763, <20> 9.1713;
param capacity[MACHINE] := <1> 51.7936, <2> 51.7936, <3> 51.7936, <4> 51.7936, <5> 51.7936, <6> 51.7936, <7> 51.7936;

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
