set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 31.2747, <2> 17.3104, <3> 28.2637, <4> 26.2122, <5> 21.5617, <6> 24.4278, <7> 25.0308, <8> 25.1133, <9> 27.1087, <10> 14.776;
param workload[JOB] := <1> 5.5924, <2> 4.1606, <3> 5.3164, <4> 5.1198, <5> 4.6435, <6> 4.9424, <7> 5.0031, <8> 5.0113, <9> 5.2066, <10> 3.844;
param capacity[MACHINE] := <1> 16.28, <2> 16.28, <3> 16.28;

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
