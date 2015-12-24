set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 22.35, <2> 22.5758, <3> 21.0097, <4> 31.557, <5> 8.1967, <6> 4.9285, <7> 19.5019, <8> 7.599, <9> 2.0597, <10> 45.1635;
param workload[JOB] := <1> 0.8027, <2> 7.521, <3> 39.3292, <4> 46.0215, <5> 17.7345, <6> 0.1338, <7> 28.3126, <8> 46.8221, <9> 13.3548, <10> 7.8844;
param capacity[MACHINE] := <1> 51.9791, <2> 51.9791, <3> 51.9791;

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
