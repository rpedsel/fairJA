set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 29.3394, <2> 29.2138, <3> 21.7297, <4> 20.4471, <5> 18.98, <6> 33.5832, <7> 28.6006, <8> 24.0499, <9> 19.6846, <10> 28.5006;
param workload[JOB] := <1> 29.3394, <2> 29.2138, <3> 21.7297, <4> 20.4471, <5> 18.98, <6> 33.5832, <7> 28.6006, <8> 24.0499, <9> 19.6846, <10> 28.5006;
param capacity[MACHINE] := <1> 63.5322, <2> 63.5322, <3> 63.5322;

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
