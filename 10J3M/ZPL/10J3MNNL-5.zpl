set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 33.9281, <2> 26.8845, <3> 32.0679, <4> 25.5935, <5> 23.06, <6> 25.8828, <7> 21.0282, <8> 25.9407, <9> 23.3395, <10> 24.7883;
param workload[JOB] := <1> 33.9281, <2> 26.8845, <3> 32.0679, <4> 25.5935, <5> 23.06, <6> 25.8828, <7> 21.0282, <8> 25.9407, <9> 23.3395, <10> 24.7883;
param capacity[MACHINE] := <1> 262.5135, <2> 262.5135, <3> 262.5135;

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
