set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 23.1247, <2> 25.7719, <3> 30.4666, <4> 19.1366, <5> 23.889, <6> 31.4814, <7> 39.1616, <8> 20.1578, <9> 28.0124, <10> 23.0071;
param workload[JOB] := <1> 4.8088, <2> 5.0766, <3> 5.5197, <4> 4.3745, <5> 4.8876, <6> 5.6108, <7> 6.2579, <8> 4.4897, <9> 5.2927, <10> 4.7966;
param capacity[MACHINE] := <1> 51.1149, <2> 51.1149, <3> 51.1149;

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
