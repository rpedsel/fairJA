set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 28.2325, <2> 13.5164, <3> 24.8562, <4> 26.167, <5> 31.3138, <6> 20.8459, <7> 18.2737, <8> 32.7404, <9> 24.2301, <10> 22.6407;
param workload[JOB] := <1> 22.2198, <2> 0.0238, <3> 31.1791, <4> 4.4858, <5> 48.614, <6> 28.1173, <7> 47.3695, <8> 21.2757, <9> 20.1276, <10> 15.2511;
param capacity[MACHINE] := <1> 59.6659, <2> 59.6659, <3> 59.6659;

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
