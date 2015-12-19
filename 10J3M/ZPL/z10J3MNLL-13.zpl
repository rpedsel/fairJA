set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 28.5641, <2> 25.0469, <3> 21.9966, <4> 20.6829, <5> 18.5211, <6> 26.4352, <7> 21.0525, <8> 28.7177, <9> 28.1241, <10> 25.6728;
param workload[JOB] := <1> 28.5641, <2> 25.0469, <3> 21.9966, <4> 20.6829, <5> 18.5211, <6> 26.4352, <7> 21.0525, <8> 28.7177, <9> 28.1241, <10> 25.6728;
param capacity[MACHINE] := <1> 81.6046, <2> 81.6046, <3> 81.6046;

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
