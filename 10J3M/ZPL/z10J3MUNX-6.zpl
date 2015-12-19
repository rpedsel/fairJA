set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 28.4509, <2> 3.6053, <3> 3.9176, <4> 43.044, <5> 21.2023, <6> 13.2851, <7> 23.9108, <8> 36.4104, <9> 48.1922, <10> 8.7196;
param workload[JOB] := <1> 5.3339, <2> 1.8988, <3> 1.9793, <4> 6.5608, <5> 4.6046, <6> 3.6449, <7> 4.8899, <8> 6.0341, <9> 6.9421, <10> 2.9529;
param capacity[MACHINE] := <1> 44.8413, <2> 44.8413, <3> 44.8413;

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
