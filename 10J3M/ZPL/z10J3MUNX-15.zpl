set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 11.8258, <2> 26.239, <3> 35.5306, <4> 24.7603, <5> 1.9463, <6> 6.6043, <7> 33.9827, <8> 2.7669, <9> 4.3927, <10> 4.2042;
param workload[JOB] := <1> 3.4389, <2> 5.1224, <3> 5.9608, <4> 4.976, <5> 1.3951, <6> 2.5699, <7> 5.8295, <8> 1.6634, <9> 2.0959, <10> 2.0504;
param capacity[MACHINE] := <1> 35.1023, <2> 35.1023, <3> 35.1023;

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
