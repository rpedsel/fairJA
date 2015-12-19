set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 23.298, <2> 19.3162, <3> 26.1165, <4> 18.3398, <5> 25.1909, <6> 24.4348, <7> 28.3692, <8> 32.2985, <9> 24.4805, <10> 30.1277;
param workload[JOB] := <1> 542.7968, <2> 373.1156, <3> 682.0716, <4> 336.3483, <5> 634.5814, <6> 597.0595, <7> 804.8115, <8> 1043.1931, <9> 599.2949, <10> 907.6783;
param capacity[MACHINE] := <1> 6520.951, <2> 6520.951, <3> 6520.951;

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
