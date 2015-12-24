set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 20.1757, <2> 23.5178, <3> 17.6456, <4> 30.0469, <5> 13.8136, <6> 13.7175, <7> 35.1541, <8> 13.8744, <9> 8.7796, <10> 43.1215;
param workload[JOB] := <1> 32.1854, <2> 21.3723, <3> 24.1604, <4> 31.1398, <5> 15.6619, <6> 8.9406, <7> 47.6208, <8> 1.5732, <9> 6.4716, <10> 16.7427;
param capacity[MACHINE] := <1> 68.6229, <2> 68.6229, <3> 68.6229;

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
