set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 31.867, <2> 34.7134, <3> 24.4183, <4> 22.1727, <5> 22.3269, <6> 24.0492, <7> 30.0996, <8> 26.9914, <9> 22.869, <10> 29.3528;
param workload[JOB] := <1> 1015.5057, <2> 1205.0201, <3> 596.2534, <4> 491.6286, <5> 498.4905, <6> 578.364, <7> 905.9859, <8> 728.5357, <9> 522.9912, <10> 861.5869;
param capacity[MACHINE] := <1> 7404.362, <2> 7404.362, <3> 7404.362;

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
