set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 32.1476, <2> 32.8439, <3> 29.9741, <4> 27.1071, <5> 31.9096, <6> 12.2767, <7> 21.7488, <8> 16.4664, <9> 28.1577, <10> 31.9655;
param workload[JOB] := <1> 1033.4682, <2> 1078.7218, <3> 898.4467, <4> 734.7949, <5> 1018.2226, <6> 150.7174, <7> 473.0103, <8> 271.1423, <9> 792.8561, <10> 1021.7932;
param capacity[MACHINE] := <1> 2491.0578, <2> 2491.0578, <3> 2491.0578;

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
