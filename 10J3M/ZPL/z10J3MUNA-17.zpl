set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 30.3677, <2> 17.3337, <3> 23.2963, <4> 5.3676, <5> 42.5769, <6> 45.3686, <7> 19.6535, <8> 11.8394, <9> 44.8031, <10> 12.1408;
param workload[JOB] := <1> 922.1972, <2> 300.4572, <3> 542.7176, <4> 28.8111, <5> 1812.7924, <6> 2058.3099, <7> 386.2601, <8> 140.1714, <9> 2007.3178, <10> 147.399;
param capacity[MACHINE] := <1> 8346.4337, <2> 8346.4337, <3> 8346.4337;

var x[JM] binary;
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
