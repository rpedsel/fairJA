set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 3.7489, <2> 2.4337, <3> 30.0087, <4> 12.5206, <5> 48.0175, <6> 45.2251, <7> 20.6425, <8> 15.3207, <9> 39.5543, <10> 2.0987;
param workload[JOB] := <1> 3.7489, <2> 2.4337, <3> 30.0087, <4> 12.5206, <5> 48.0175, <6> 45.2251, <7> 20.6425, <8> 15.3207, <9> 39.5543, <10> 2.0987;
param capacity[MACHINE] := <1> 219.5707, <2> 219.5707, <3> 219.5707;

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
