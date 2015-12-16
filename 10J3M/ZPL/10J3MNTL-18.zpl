set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 24.9054, <2> 16.558, <3> 15.6202, <4> 27.3559, <5> 23.5359, <6> 25.3291, <7> 24.0263, <8> 20.5185, <9> 31.7512, <10> 22.2138;
param workload[JOB] := <1> 24.9054, <2> 16.558, <3> 15.6202, <4> 27.3559, <5> 23.5359, <6> 25.3291, <7> 24.0263, <8> 20.5185, <9> 31.7512, <10> 22.2138;
param capacity[MACHINE] := <1> 57.9535, <2> 57.9535, <3> 57.9535;

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
