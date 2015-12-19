set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 23.7987, <2> 10.2067, <3> 29.7708, <4> 19.2304, <5> 25.8416, <6> 17.31, <7> 49.922, <8> 20.6468, <9> 28.1178, <10> 11.254;
param workload[JOB] := <1> 4.8784, <2> 3.1948, <3> 5.4563, <4> 4.3852, <5> 5.0835, <6> 4.1605, <7> 7.0656, <8> 4.5439, <9> 5.3026, <10> 3.3547;
param capacity[MACHINE] := <1> 15.8085, <2> 15.8085, <3> 15.8085;

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
