set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 16.8426, <2> 30.8343, <3> 4.2232, <4> 3.0226, <5> 12.1326, <6> 30.5945, <7> 21.9838, <8> 48.4224, <9> 13.817, <10> 38.6294;
param workload[JOB] := <1> 32.1625, <2> 5.4242, <3> 35.0074, <4> 29.6658, <5> 42.1529, <6> 43.2424, <7> 33.3339, <8> 2.3207, <9> 40.0604, <10> 44.4675;
param capacity[MACHINE] := <1> 307.8377, <2> 307.8377, <3> 307.8377;

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
