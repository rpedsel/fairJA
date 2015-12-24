set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 36.614, <2> 29.7984, <3> 39.2131, <4> 45.5814, <5> 3.1035, <6> 12.9772, <7> 45.8821, <8> 47.9599, <9> 1.6097, <10> 6.9231;
param workload[JOB] := <1> 6.051, <2> 5.4588, <3> 6.262, <4> 6.7514, <5> 1.7617, <6> 3.6024, <7> 6.7736, <8> 6.9253, <9> 1.2687, <10> 2.6312;
param capacity[MACHINE] := <1> 11.8715, <2> 11.8715, <3> 11.8715;

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
