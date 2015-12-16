set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 46.6994, <2> 9.3406, <3> 20.4208, <4> 46.274, <5> 30.9458, <6> 0.0621, <7> 21.1332, <8> 38.4171, <9> 37.7152, <10> 8.7688;
param workload[JOB] := <1> 6.8337, <2> 3.0562, <3> 4.5189, <4> 6.8025, <5> 5.5629, <6> 0.2492, <7> 4.5971, <8> 6.1982, <9> 6.1413, <10> 2.9612;
param capacity[MACHINE] := <1> 15.6404, <2> 15.6404, <3> 15.6404;

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
