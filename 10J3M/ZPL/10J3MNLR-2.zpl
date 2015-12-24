set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 22.655, <2> 19.5488, <3> 30.5064, <4> 20.4152, <5> 27.6285, <6> 22.9322, <7> 31.4602, <8> 21.189, <9> 26.8829, <10> 22.6501;
param workload[JOB] := <1> 10.009, <2> 44.0468, <3> 16.2448, <4> 44.5559, <5> 17.0516, <6> 44.7873, <7> 17.0204, <8> 28.1067, <9> 16.4947, <10> 18.8706;
param capacity[MACHINE] := <1> 85.7293, <2> 85.7293, <3> 85.7293;

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
