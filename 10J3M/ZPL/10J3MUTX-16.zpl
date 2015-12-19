set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 38.9232, <2> 1.6195, <3> 5.6849, <4> 46.6717, <5> 46.1405, <6> 35.6432, <7> 18.7756, <8> 42.5965, <9> 8.2235, <10> 8.1133;
param workload[JOB] := <1> 6.2388, <2> 1.2726, <3> 2.3843, <4> 6.8317, <5> 6.7927, <6> 5.9702, <7> 4.3331, <8> 6.5266, <9> 2.8677, <10> 2.8484;
param capacity[MACHINE] := <1> 11.5165, <2> 11.5165, <3> 11.5165;

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
