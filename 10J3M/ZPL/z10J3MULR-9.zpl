set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 24.2955, <2> 47.7793, <3> 18.6619, <4> 45.2034, <5> 30.3706, <6> 30.7744, <7> 49.075, <8> 18.1338, <9> 11.508, <10> 25.2253;
param workload[JOB] := <1> 43.1545, <2> 0.2893, <3> 29.3032, <4> 2.6833, <5> 45.5482, <6> 34.6818, <7> 35.098, <8> 14.9853, <9> 27.4669, <10> 1.3795;
param capacity[MACHINE] := <1> 78.1967, <2> 78.1967, <3> 78.1967;

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
