set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 21.2565, <2> 29.7619, <3> 22.4406, <4> 11.2808, <5> 28.0039, <6> 21.8264, <7> 25.9397, <8> 27.7283, <9> 25.6791, <10> 24.7402;
param workload[JOB] := <1> 451.8388, <2> 885.7707, <3> 503.5805, <4> 127.2564, <5> 784.2184, <6> 476.3917, <7> 672.868, <8> 768.8586, <9> 659.4162, <10> 612.0775;
param capacity[MACHINE] := <1> 1485.5692, <2> 1485.5692, <3> 1485.5692;

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
