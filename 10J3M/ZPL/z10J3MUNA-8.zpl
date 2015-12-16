set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 20.3504, <2> 5.132, <3> 41.8436, <4> 24.9195, <5> 30.6055, <6> 6.9101, <7> 5.255, <8> 39.674, <9> 28.5658, <10> 44.6393;
param workload[JOB] := <1> 414.1388, <2> 26.3374, <3> 1750.8869, <4> 620.9815, <5> 936.6966, <6> 47.7495, <7> 27.615, <8> 1574.0263, <9> 816.0049, <10> 1992.6671;
param capacity[MACHINE] := <1> 8207.104, <2> 8207.104, <3> 8207.104;

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
