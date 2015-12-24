set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 24.3269, <2> 20.0065, <3> 22.3664, <4> 34.1523, <5> 20.8863, <6> 23.2359, <7> 29.6887, <8> 23.0142, <9> 27.0267, <10> 24.4237;
param workload[JOB] := <1> 26.0119, <2> 35.4023, <3> 21.734, <4> 36.7758, <5> 31.6353, <6> 24.6367, <7> 29.8191, <8> 48.8451, <9> 0.4694, <10> 47.6629;
param capacity[MACHINE] := <1> 302.9925, <2> 302.9925, <3> 302.9925;

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
