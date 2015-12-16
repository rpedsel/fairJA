set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 21.4805, <2> 23.279, <3> 21.2802, <4> 24.5464, <5> 21.0881, <6> 29.68, <7> 20.2442, <8> 33.6391, <9> 18.0595, <10> 23.4187;
param workload[JOB] := <1> 15.2631, <2> 40.6068, <3> 35.2287, <4> 28.5658, <5> 47.7546, <6> 37.519, <7> 43.2376, <8> 4.4059, <9> 12.1554, <10> 32.7249;
param capacity[MACHINE] := <1> 74.3654, <2> 74.3654, <3> 74.3654;

var x[JM] binary;
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
