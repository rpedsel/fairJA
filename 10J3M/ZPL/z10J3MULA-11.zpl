set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 24.139, <2> 7.3984, <3> 46.7782, <4> 9.9177, <5> 13.3442, <6> 25.5106, <7> 8.928, <8> 1.6444, <9> 27.1476, <10> 40.7921;
param workload[JOB] := <1> 582.6913, <2> 54.7363, <3> 2188.2, <4> 98.3608, <5> 178.0677, <6> 650.7907, <7> 79.7092, <8> 2.7041, <9> 736.9922, <10> 1663.9954;
param capacity[MACHINE] := <1> 2884.7451, <2> 2884.7451, <3> 2884.7451;

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
