set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 31.8791, <2> 26.4094, <3> 23.5978, <4> 24.4421, <5> 24.3728, <6> 20.5451, <7> 29.2551, <8> 28.97, <9> 22.2484, <10> 24.565;
param workload[JOB] := <1> 31.8791, <2> 26.4094, <3> 23.5978, <4> 24.4421, <5> 24.3728, <6> 20.5451, <7> 29.2551, <8> 28.97, <9> 22.2484, <10> 24.565;
param capacity[MACHINE] := <1> 64.0712, <2> 64.0712, <3> 64.0712;

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
