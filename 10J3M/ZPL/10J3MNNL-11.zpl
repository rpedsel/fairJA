set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 24.1053, <2> 27.2839, <3> 23.0443, <4> 22.4186, <5> 28.7526, <6> 27.063, <7> 31.0644, <8> 31.3576, <9> 23.4562, <10> 21.5752;
param workload[JOB] := <1> 24.1053, <2> 27.2839, <3> 23.0443, <4> 22.4186, <5> 28.7526, <6> 27.063, <7> 31.0644, <8> 31.3576, <9> 23.4562, <10> 21.5752;
param capacity[MACHINE] := <1> 260.1211, <2> 260.1211, <3> 260.1211;

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
