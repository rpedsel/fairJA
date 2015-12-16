set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 32.1441, <2> 24.6014, <3> 12.216, <4> 19.4643, <5> 25.7506, <6> 21.2184, <7> 30.2585, <8> 19.87, <9> 25.2126, <10> 23.1551;
param workload[JOB] := <1> 2.6954, <2> 26.9982, <3> 18.6001, <4> 13.0415, <5> 19.7376, <6> 13.2358, <7> 45.2366, <8> 11.152, <9> 27.095, <10> 3.6731;
param capacity[MACHINE] := <1> 60.4884, <2> 60.4884, <3> 60.4884;

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
