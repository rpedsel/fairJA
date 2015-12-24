set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 28.3476, <2> 20.0678, <3> 21.3325, <4> 25.4265, <5> 28.6768, <6> 9.8636, <7> 27.6609, <8> 24.5548, <9> 34.1123, <10> 27.9535;
param workload[JOB] := <1> 28.3476, <2> 20.0678, <3> 21.3325, <4> 25.4265, <5> 28.6768, <6> 9.8636, <7> 27.6609, <8> 24.5548, <9> 34.1123, <10> 27.9535;
param capacity[MACHINE] := <1> 82.6654, <2> 82.6654, <3> 82.6654;

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
