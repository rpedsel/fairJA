set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 21.316, <2> 30.7491, <3> 18.2817, <4> 23.77, <5> 25.5366, <6> 25.9187, <7> 30.3537, <8> 29.7581, <9> 24.6, <10> 26.2501;
param workload[JOB] := <1> 454.3719, <2> 945.5072, <3> 334.2206, <4> 565.0129, <5> 652.1179, <6> 671.779, <7> 921.3471, <8> 885.5445, <9> 605.16, <10> 689.0678;
param capacity[MACHINE] := <1> 1681.0322, <2> 1681.0322, <3> 1681.0322;

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
