set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 25.386, <2> 24.149, <3> 32.2344, <4> 25.9146, <5> 24.7984, <6> 29.9619, <7> 24.0611, <8> 11.4878, <9> 33.6328, <10> 23.9955;
param workload[JOB] := <1> 24.0963, <2> 30.6239, <3> 47.0707, <4> 36.4508, <5> 28.5639, <6> 0.5337, <7> 11.8625, <8> 18.1799, <9> 44.6335, <10> 24.7776;
param capacity[MACHINE] := <1> 266.7928, <2> 266.7928, <3> 266.7928;

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
