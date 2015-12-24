set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 30.0635, <2> 12.1827, <3> 35.5019, <4> 22.0101, <5> 27.9497, <6> 37.7322, <7> 43.7602, <8> 18.1811, <9> 26.6987, <10> 35.8286;
param workload[JOB] := <1> 5.483, <2> 3.4904, <3> 5.9583, <4> 4.6915, <5> 5.2867, <6> 6.1427, <7> 6.6151, <8> 4.2639, <9> 5.1671, <10> 5.9857;
param capacity[MACHINE] := <1> 53.0844, <2> 53.0844, <3> 53.0844;

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
