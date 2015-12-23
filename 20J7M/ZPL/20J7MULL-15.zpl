set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 12.6298, <2> 47.4028, <3> 44.9506, <4> 9.0596, <5> 48.3968, <6> 47.218, <7> 47.0286, <8> 43.3573, <9> 45.2892, <10> 7.405, <11> 43.4087, <12> 16.6762, <13> 44.7847, <14> 3.1483, <15> 33.5054, <16> 47.1189, <17> 39.442, <18> 18.0728, <19> 8.578, <20> 32.1917;
param workload[JOB] := <1> 12.6298, <2> 47.4028, <3> 44.9506, <4> 9.0596, <5> 48.3968, <6> 47.218, <7> 47.0286, <8> 43.3573, <9> 45.2892, <10> 7.405, <11> 43.4087, <12> 16.6762, <13> 44.7847, <14> 3.1483, <15> 33.5054, <16> 47.1189, <17> 39.442, <18> 18.0728, <19> 8.578, <20> 32.1917;
param capacity[MACHINE] := <1> 91.3806, <2> 91.3806, <3> 91.3806, <4> 91.3806, <5> 91.3806, <6> 91.3806, <7> 91.3806;

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
