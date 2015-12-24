set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 23.7187, <2> 24.9667, <3> 19.368, <4> 30.4369, <5> 29.3584, <6> 22.8996, <7> 20.4648, <8> 26.8808, <9> 26.9216, <10> 20.4989;
param workload[JOB] := <1> 13.7701, <2> 20.3743, <3> 0.731, <4> 15.2446, <5> 17.068, <6> 49.087, <7> 10.6712, <8> 38.5492, <9> 14.9851, <10> 0.0767;
param capacity[MACHINE] := <1> 180.5572, <2> 180.5572, <3> 180.5572;

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
