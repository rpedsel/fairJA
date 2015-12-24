set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 26.3118, <2> 24.4586, <3> 24.2533, <4> 28.5847, <5> 32.4971, <6> 27.7733, <7> 26.641, <8> 24.3137, <9> 25.7499, <10> 27.3822;
param workload[JOB] := <1> 5.1295, <2> 4.9456, <3> 4.9248, <4> 5.3465, <5> 5.7006, <6> 5.27, <7> 5.1615, <8> 4.9309, <9> 5.0744, <10> 5.2328;
param capacity[MACHINE] := <1> 12.9292, <2> 12.9292, <3> 12.9292;

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
