set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 26.6982, <2> 38.9511, <3> 18.3614, <4> 12.2869, <5> 16.6009, <6> 48.7283, <7> 1.7553, <8> 47.1367, <9> 14.3624, <10> 8.9481;
param workload[JOB] := <1> 712.7939, <2> 1517.1882, <3> 337.141, <4> 150.9679, <5> 275.5899, <6> 2374.4472, <7> 3.0811, <8> 2221.8685, <9> 206.2785, <10> 80.0685;
param capacity[MACHINE] := <1> 2626.4749, <2> 2626.4749, <3> 2626.4749;

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
