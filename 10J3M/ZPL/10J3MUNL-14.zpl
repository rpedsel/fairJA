set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 35.2841, <2> 33.3253, <3> 0.1463, <4> 26.4368, <5> 28.2197, <6> 26.0421, <7> 8.7219, <8> 16.3855, <9> 49.4324, <10> 16.9187;
param workload[JOB] := <1> 35.2841, <2> 33.3253, <3> 0.1463, <4> 26.4368, <5> 28.2197, <6> 26.0421, <7> 8.7219, <8> 16.3855, <9> 49.4324, <10> 16.9187;
param capacity[MACHINE] := <1> 240.9128, <2> 240.9128, <3> 240.9128;

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
